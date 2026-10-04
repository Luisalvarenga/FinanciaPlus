package com.financiaplus.backend.repository;

import com.financiaplus.backend.entity.BlacklistedPerson;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;

public interface BlacklistedPersonRepository
        extends JpaRepository<BlacklistedPerson, Long> {

    boolean existsByDocumentNumber(String documentNumber);

    boolean existsByFullNameIgnoreCaseAndBirthDate(
            String fullName,
            LocalDate birthDate
    );

    List<BlacklistedPerson> findByFullNameContainingIgnoreCase(
            String fullName
    );
}
