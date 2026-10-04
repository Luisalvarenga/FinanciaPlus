package com.financiaplus.backend.service;

import com.financiaplus.backend.dto.ClientResponse;
import com.financiaplus.backend.dto.IdentityVerificationResponse;
import com.financiaplus.backend.dto.UpdateProfileRequest;
import com.financiaplus.backend.entity.Client;
import com.financiaplus.backend.exception.ForbiddenException;
import com.financiaplus.backend.exception.ResourceNotFoundException;
import com.financiaplus.backend.repository.ClientRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;

@Service
public class ClientService {

    private static final Logger logger =
            LoggerFactory.getLogger(ClientService.class);

    private final ClientRepository clientRepository;
    private final IdentityVerificationService identityVerificationService;

    public ClientService(
            ClientRepository clientRepository,
            IdentityVerificationService identityVerificationService) {

        this.clientRepository = clientRepository;
        this.identityVerificationService = identityVerificationService;
    }

    @Transactional(readOnly = true)
    public ClientResponse getClient(Long clientId) {
        return new ClientResponse(findClient(clientId));
    }

    @Transactional
    public ClientResponse updateProfile(
            Long clientId,
            UpdateProfileRequest request) {

        Client client = findClient(clientId);

        client.setAddress(request.getAddress());
        client.setBirthDate(request.getBirthDate());
        client.setGender(request.getGender());

        return new ClientResponse(clientRepository.save(client));
    }

    @Transactional
    public IdentityVerificationResponse verifyIdentity(Long clientId) {

        Client client = findClient(clientId);

        BigDecimal similarity =
                identityVerificationService.compareBiometrics(client);

        boolean approved = similarity.compareTo(
                IdentityVerificationService.MINIMUM_SIMILARITY
        ) >= 0;

        client.setBiometricScore(similarity);
        client.setIdentityVerified(approved);

        clientRepository.save(client);

        logger.info(
                "Identity verification completed. "
                        + "clientId={}, similarity={}, approved={}",
                clientId,
                similarity,
                approved
        );

        return new IdentityVerificationResponse(
                similarity,
                approved,
                approved
                        ? "Identidad verificada."
                        : "La selfie no coincide con el documento. "
                        + "Inténtalo de nuevo con mejor iluminación."
        );
    }

    /*
     * Customer data can only be read by its owner: the document
     * requested must belong to the authenticated client.
     */
    @Transactional(readOnly = true)
    public void requireOwnDocument(
            Long clientId,
            String documentNumber) {

        Client client = findClient(clientId);

        if (!client.getDocumentNumber().equals(documentNumber)) {
            throw new ForbiddenException(
                    "Solo puedes consultar tu propia información."
            );
        }
    }

    private Client findClient(Long clientId) {

        return clientRepository.findById(clientId)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Cliente no encontrado."
                ));
    }
}
