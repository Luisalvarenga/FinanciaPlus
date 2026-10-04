package com.financiaplus.backend.dto;

import com.financiaplus.backend.entity.BlacklistedPerson;

import java.time.LocalDate;

public class BlacklistedPersonResponse {

    private final String fullName;
    private final String documentNumber;
    private final LocalDate birthDate;
    private final String reason;

    public BlacklistedPersonResponse(BlacklistedPerson person) {
        this.fullName = person.getFullName();
        this.documentNumber = person.getDocumentNumber();
        this.birthDate = person.getBirthDate();
        this.reason = person.getReason();
    }

    public String getFullName() {
        return fullName;
    }

    public String getDocumentNumber() {
        return documentNumber;
    }

    public LocalDate getBirthDate() {
        return birthDate;
    }

    public String getReason() {
        return reason;
    }
}
