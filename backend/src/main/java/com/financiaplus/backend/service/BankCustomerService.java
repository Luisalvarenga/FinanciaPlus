package com.financiaplus.backend.service;

import com.financiaplus.backend.dto.BankCustomerFinancialResponse;
import com.financiaplus.backend.dto.BankCustomerGeneralResponse;
import com.financiaplus.backend.entity.BankCustomer;
import com.financiaplus.backend.exception.ResourceNotFoundException;
import com.financiaplus.backend.repository.BankCustomerRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BankCustomerService {

    private final BankCustomerRepository bankCustomerRepository;

    public BankCustomerService(
            BankCustomerRepository bankCustomerRepository) {

        this.bankCustomerRepository = bankCustomerRepository;
    }

    @Transactional(readOnly = true)
    public BankCustomerGeneralResponse getGeneralData(
            String documentNumber) {

        return new BankCustomerGeneralResponse(
                findCustomer(documentNumber)
        );
    }

    @Transactional(readOnly = true)
    public BankCustomerFinancialResponse getFinancialData(
            String documentNumber) {

        return new BankCustomerFinancialResponse(
                findCustomer(documentNumber)
        );
    }

    private BankCustomer findCustomer(String documentNumber) {

        return bankCustomerRepository
                .findByDocumentNumber(documentNumber)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Cliente del banco no encontrado."
                ));
    }
}
