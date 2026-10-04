package com.financiaplus.backend.service;

import com.financiaplus.backend.dto.CreateCreditApplicationRequest;
import com.financiaplus.backend.dto.CreditApplicationResponse;
import com.financiaplus.backend.dto.CreditScoreResponse;
import com.financiaplus.backend.dto.GeolocationResponse;
import com.financiaplus.backend.entity.ApplicationStatus;
import com.financiaplus.backend.entity.Client;
import com.financiaplus.backend.entity.CreditApplication;
import com.financiaplus.backend.exception.GeolocationException;
import com.financiaplus.backend.exception.ResourceNotFoundException;
import com.financiaplus.backend.repository.ClientRepository;
import com.financiaplus.backend.repository.CreditApplicationRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;

@Service
public class CreditApplicationService {

    private static final Logger logger =
            LoggerFactory.getLogger(
                    CreditApplicationService.class
            );

    private static final BigDecimal MINIMUM_CREDIT_SCORE =
            new BigDecimal("7.0");

    private final ClientRepository clientRepository;
    private final CreditApplicationRepository creditApplicationRepository;
    private final AmlService amlService;
    private final CreditScoreService creditScoreService;
    private final GeolocationService geolocationService;
    private final RiskScoringService riskScoringService;

    public CreditApplicationService(
            ClientRepository clientRepository,
            CreditApplicationRepository creditApplicationRepository,
            AmlService amlService,
            CreditScoreService creditScoreService,
            GeolocationService geolocationService,
            RiskScoringService riskScoringService) {

        this.riskScoringService = riskScoringService;
        this.clientRepository = clientRepository;
        this.creditApplicationRepository = creditApplicationRepository;
        this.amlService = amlService;
        this.creditScoreService = creditScoreService;
        this.geolocationService = geolocationService;
    }

    @Transactional(readOnly = true)
    public List<CreditApplicationResponse> getApplications(
            Long clientId) {

        return creditApplicationRepository
                .findByClientIdOrderByCreatedAtDesc(clientId)
                .stream()
                .map(CreditApplicationResponse::new)
                .toList();
    }

    @Transactional
    public CreditApplicationResponse createApplication(
            Long clientId,
            CreateCreditApplicationRequest request,
            String ipAddress) {

        Client client = clientRepository.findById(clientId)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Cliente no encontrado."
                ));

        // The onboarding must be finished before applying.
        if (!client.isProfileComplete()) {
            throw new IllegalArgumentException(
                    "Completa tu perfil antes de solicitar."
            );
        }

        if (!client.isIdentityVerified()) {
            throw new IllegalArgumentException(
                    "Verifica tu identidad antes de solicitar."
            );
        }

        CreditApplication application = new CreditApplication();

        application.setClient(client);
        application.setRequestedAmount(request.getRequestedAmount());

        // AML evaluation
        var amlResult = amlService.checkPerson(
                client.getDocumentNumber(),
                client.getFirstName() + " " + client.getLastName(),
                client.getBirthDate()
        );

        application.setAmlMatch(amlResult.isMatch());

        logger.info(
                "AML check completed. clientId={}, match={}",
                client.getId(),
                amlResult.isMatch()
        );

        if (amlResult.isMatch()) {

            application.setStatus(
                    ApplicationStatus.REJECTED_AML
            );

            return save(application);
        }

        // Credit score evaluation
        CreditScoreResponse creditScoreResult =
                creditScoreService.getCreditScore(
                        client.getDocumentNumber()
                );

        BigDecimal creditScore = creditScoreResult.getScore();

        application.setCreditScore(creditScore);

        logger.info(
                "Credit score check completed. clientId={}, score={}",
                client.getId(),
                creditScore
        );

        if (creditScore.compareTo(MINIMUM_CREDIT_SCORE) < 0) {

            application.setStatus(
                    ApplicationStatus.REJECTED_CREDIT_SCORE
            );

            return save(application);
        }

        // IP geolocation. Business rule: it never blocks the process.
        // On a provider failure the application is still approved and
        // saved with the IP address only.
        application.setIpAddress(ipAddress);

        try {
            GeolocationResponse location =
                    geolocationService.getLocation(ipAddress);

            application.setCountry(location.getCountry());
            application.setRegion(location.getRegion());
            application.setCity(location.getCity());

            logger.info(
                    "Geolocation resolved. clientId={}, country={}",
                    client.getId(),
                    location.getCountry()
            );
        } catch (GeolocationException exception) {
            logger.warn(
                    "Geolocation unavailable, continuing without it. "
                            + "clientId={}, reason={}",
                    client.getId(),
                    exception.getMessage()
            );
        }

        // Internal risk scoring. Informative: it does not change
        // the outcome, it is stored for later review.
        RiskScoringService.RiskAssessment risk =
                riskScoringService.assess(
                        client,
                        creditScore,
                        application.getCountry()
                );

        application.setRiskScore(risk.score());
        application.setRiskLevel(risk.level());

        logger.info(
                "Risk scoring completed. clientId={}, score={}, level={}",
                client.getId(),
                risk.score(),
                risk.level()
        );

        // Application passed all evaluations
        application.setStatus(ApplicationStatus.APPROVED);

        return save(application);
    }

    private CreditApplicationResponse save(
            CreditApplication application) {

        CreditApplication savedApplication =
                creditApplicationRepository.save(application);

        logger.info(
                "Application saved. applicationId={}, clientId={}, status={}",
                savedApplication.getId(),
                savedApplication.getClient().getId(),
                savedApplication.getStatus()
        );

        return new CreditApplicationResponse(savedApplication);
    }
}
