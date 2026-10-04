package com.financiaplus.backend.dto;

import java.math.BigDecimal;

public class CreditScoreResponse {

    private final BigDecimal score;

    public CreditScoreResponse(BigDecimal score) {
        this.score = score;
    }

    public BigDecimal getScore() {
        return score;
    }
}