package com.financiaplus.backend.repository;

import com.financiaplus.backend.entity.CreditApplication;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CreditApplicationRepository
        extends JpaRepository<CreditApplication, Long> {

    List<CreditApplication> findByClientId(Long clientId);

    List<CreditApplication> findByClientIdOrderByCreatedAtDesc(
            Long clientId
    );
}