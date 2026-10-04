package com.financiaplus.backend.service;

import com.financiaplus.backend.entity.Client;
import com.financiaplus.backend.entity.RiskLevel;
import com.financiaplus.backend.repository.BankCustomerRepository;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

/*
 * Internal risk scoring.
 *
 * Adds risk points from signals already collected during the
 * flow; a higher total means a riskier application. The level
 * is informative: it is stored with the application for later
 * review and does not approve or reject it. Only the AML check
 * and the minimum credit score decide the outcome.
 *
 *   Credit score     8.5 or more: 0 | 7.5 or more: 15 | lower: 30
 *   Bank customer    existing: 0    | new: 20
 *   Biometric match  90% or more: 0 | lower or missing: 10
 *   IP country       home: 0 | unknown: 15 | another country: 25
 *
 *   Total below 30: LOW | below 60: MEDIUM | otherwise: HIGH
 */
@Service
public class RiskScoringService {

    private static final BigDecimal STRONG_CREDIT_SCORE =
            new BigDecimal("8.5");

    private static final BigDecimal GOOD_CREDIT_SCORE =
            new BigDecimal("7.5");

    private static final BigDecimal STRONG_BIOMETRIC_MATCH =
            new BigDecimal("90");

    private static final int MEDIUM_RISK_FROM = 30;
    private static final int HIGH_RISK_FROM = 60;

    private final BankCustomerRepository bankCustomerRepository;
    private final String homeCountry;

    public RiskScoringService(
            BankCustomerRepository bankCustomerRepository,
            @Value("${app.risk.home-country:SV}")
            String homeCountry) {

        this.bankCustomerRepository = bankCustomerRepository;
        this.homeCountry = homeCountry;
    }

    public RiskAssessment assess(
            Client client,
            BigDecimal creditScore,
            String country) {

        int score = creditScorePoints(creditScore)
                + customerPoints(client)
                + biometricPoints(client)
                + countryPoints(country);

        return new RiskAssessment(score, toLevel(score));
    }

    private int creditScorePoints(BigDecimal creditScore) {

        if (creditScore.compareTo(STRONG_CREDIT_SCORE) >= 0) {
            return 0;
        }

        if (creditScore.compareTo(GOOD_CREDIT_SCORE) >= 0) {
            return 15;
        }

        return 30;
    }

    private int customerPoints(Client client) {

        boolean existingCustomer = bankCustomerRepository
                .findByDocumentNumber(client.getDocumentNumber())
                .isPresent();

        return existingCustomer ? 0 : 20;
    }

    private int biometricPoints(Client client) {

        BigDecimal biometricScore = client.getBiometricScore();

        if (biometricScore != null
                && biometricScore.compareTo(STRONG_BIOMETRIC_MATCH) >= 0) {
            return 0;
        }

        return 10;
    }

    private int countryPoints(String country) {

        if (country == null || country.isBlank()) {
            return 15;
        }

        return homeCountry.equalsIgnoreCase(country) ? 0 : 25;
    }

    private RiskLevel toLevel(int score) {

        if (score < MEDIUM_RISK_FROM) {
            return RiskLevel.LOW;
        }

        if (score < HIGH_RISK_FROM) {
            return RiskLevel.MEDIUM;
        }

        return RiskLevel.HIGH;
    }

    public record RiskAssessment(int score, RiskLevel level) {
    }
}
