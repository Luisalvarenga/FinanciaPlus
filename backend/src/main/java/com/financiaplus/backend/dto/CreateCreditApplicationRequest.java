package com.financiaplus.backend.dto;

import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotNull;

import java.math.BigDecimal;

/*
 * The client is not part of the request: it is taken
 * from the authenticated session.
 */
public class CreateCreditApplicationRequest {

    // Daily transaction limit requested for the debit card.
    @NotNull(message = "El límite diario es obligatorio.")
    @DecimalMin(
            value = "0.01",
            message = "El límite diario debe ser mayor que cero."
    )
    private BigDecimal requestedAmount;

    public BigDecimal getRequestedAmount() {
        return requestedAmount;
    }

    public void setRequestedAmount(BigDecimal requestedAmount) {
        this.requestedAmount = requestedAmount;
    }
}
