package com.financiaplus.backend.repository;

import com.financiaplus.backend.entity.Client;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ClientRepository extends JpaRepository<Client, Long> {

    Optional<Client> findByDocumentNumber(String documentNumber);

    Optional<Client> findByEmail(String email);

    boolean existsByDocumentNumber(String documentNumber);

    boolean existsByEmail(String email);
}