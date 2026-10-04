package com.financiaplus.backend.dto;

import com.financiaplus.backend.entity.BankCustomer;

import java.math.BigDecimal;
import java.time.LocalDate;

public class BankCustomerFinancialResponse {

    private final String documentNumber;
    private final BigDecimal creditScore;
    private final BigDecimal monthlyIncome;
    private final LocalDate customerSince;

    public BankCustomerFinancialResponse(BankCustomer customer) {
        this.documentNumber = customer.getDocumentNumber();
        this.creditScore = customer.getCreditScore();
        this.monthlyIncome = customer.getMonthlyIncome();
        this.customerSince = customer.getCustomerSince();
    }

    public String getDocumentNumber() {
        return documentNumber;
    }

    public BigDecimal getCreditScore() {
        return creditScore;
    }

    public BigDecimal getMonthlyIncome() {
        return monthlyIncome;
    }

    public LocalDate getCustomerSince() {
        return customerSince;
    }
}
