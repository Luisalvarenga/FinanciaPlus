package com.financiaplus.backend.service;

import com.financiaplus.backend.dto.AmlCheckResponse;
import com.financiaplus.backend.dto.BlacklistedPersonResponse;
import com.financiaplus.backend.repository.BlacklistedPersonRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;

@Service
public class AmlService {

    private final BlacklistedPersonRepository blacklistedPersonRepository;

    public AmlService(
            BlacklistedPersonRepository blacklistedPersonRepository) {

        this.blacklistedPersonRepository = blacklistedPersonRepository;
    }

    @Transactional(readOnly = true)
    public AmlCheckResponse checkClient(String documentNumber) {

        return toResponse(
                blacklistedPersonRepository
                        .existsByDocumentNumber(documentNumber)
        );
    }

    /*
     * Check used by the application flow.
     *
     * A person matches by document number, or by full name
     * plus birth date. The birth date avoids rejecting
     * applicants who only share a name with a listed person.
     */
    @Transactional(readOnly = true)
    public AmlCheckResponse checkPerson(
            String documentNumber,
            String fullName,
            LocalDate birthDate) {

        boolean match =
                blacklistedPersonRepository
                        .existsByDocumentNumber(documentNumber)
                        || blacklistedPersonRepository
                        .existsByFullNameIgnoreCaseAndBirthDate(
                                fullName,
                                birthDate
                        );

        return toResponse(match);
    }

    @Transactional(readOnly = true)
    public List<BlacklistedPersonResponse> searchByName(String name) {

        if (name == null || name.isBlank()) {
            return List.of();
        }

        return blacklistedPersonRepository
                .findByFullNameContainingIgnoreCase(name.trim())
                .stream()
                .map(BlacklistedPersonResponse::new)
                .toList();
    }

    private AmlCheckResponse toResponse(boolean match) {

        return new AmlCheckResponse(
                match,
                match
                        ? "Se encontró una coincidencia en la lista AML."
                        : "Sin coincidencias en la lista AML."
        );
    }
}
