package com.financiaplus.backend.dto;

import java.math.BigDecimal;

public class IdentityVerificationResponse {

    private final BigDecimal similarity;
    private final boolean approved;
    private final String message;

    public IdentityVerificationResponse(
            BigDecimal similarity,
            boolean approved,
            String message) {

        this.similarity = similarity;
        this.approved = approved;
        this.message = message;
    }

    public BigDecimal getSimilarity() {
        return similarity;
    }

    public boolean isApproved() {
        return approved;
    }

    public String getMessage() {
        return message;
    }
}
