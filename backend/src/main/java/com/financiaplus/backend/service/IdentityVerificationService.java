package com.financiaplus.backend.service;

import com.financiaplus.backend.entity.Client;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

@Service
public class IdentityVerificationService {

    public static final BigDecimal MINIMUM_SIMILARITY =
            new BigDecimal("80.00");

    /*
     * Mock implementation for the technical test.
     *
     * Simulates the document capture (OCR), the selfie with
     * liveness check and the biometric comparison. It returns
     * the similarity between the document photo and the selfie.
     * One document number is reserved to reproduce a failed match.
     */
    public BigDecimal compareBiometrics(Client client) {

        if ("44444444-4".equals(client.getDocumentNumber())) {
            return new BigDecimal("65.00");
        }

        return new BigDecimal("92.50");
    }
}
