package com.financiaplus.backend.service;

import com.financiaplus.backend.dto.CreditScoreResponse;
import com.financiaplus.backend.entity.BankCustomer;
import com.financiaplus.backend.repository.BankCustomerRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;

@Service
public class CreditScoreService {

    /*
     * Assumption for the technical test: applicants who are not
     * existing bank customers have no credit history, so they
     * receive a base score that allows them to continue.
     */
    private static final BigDecimal DEFAULT_SCORE =
            new BigDecimal("7.50");

    private final BankCustomerRepository bankCustomerRepository;

    public CreditScoreService(
            BankCustomerRepository bankCustomerRepository) {

        this.bankCustomerRepository = bankCustomerRepository;
    }

    @Transactional(readOnly = true)
    public CreditScoreResponse getCreditScore(String documentNumber) {

        BigDecimal score = bankCustomerRepository
                .findByDocumentNumber(documentNumber)
                .map(BankCustomer::getCreditScore)
                .orElse(DEFAULT_SCORE);

        return new CreditScoreResponse(score);
    }
}
