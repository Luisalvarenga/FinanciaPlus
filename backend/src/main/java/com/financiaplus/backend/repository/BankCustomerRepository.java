package com.financiaplus.backend.repository;

import com.financiaplus.backend.entity.BankCustomer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface BankCustomerRepository
        extends JpaRepository<BankCustomer, Long> {

    Optional<BankCustomer> findByDocumentNumber(String documentNumber);
}
