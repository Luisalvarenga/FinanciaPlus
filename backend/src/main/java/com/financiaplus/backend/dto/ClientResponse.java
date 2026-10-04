package com.financiaplus.backend.dto;

import com.financiaplus.backend.entity.Client;
import com.financiaplus.backend.entity.Gender;

import java.math.BigDecimal;
import java.time.LocalDate;

public class ClientResponse {

    private Long id;
    private String firstName;
    private String lastName;
    private String documentNumber;
    private String email;
    private String phone;
    private String address;
    private LocalDate birthDate;
    private Gender gender;
    private boolean profileComplete;
    private boolean identityVerified;
    private BigDecimal biometricScore;

    public ClientResponse(Client client) {
        this.id = client.getId();
        this.firstName = client.getFirstName();
        this.lastName = client.getLastName();
        this.documentNumber = client.getDocumentNumber();
        this.email = client.getEmail();
        this.phone = client.getPhone();
        this.address = client.getAddress();
        this.birthDate = client.getBirthDate();
        this.gender = client.getGender();
        this.profileComplete = client.isProfileComplete();
        this.identityVerified = client.isIdentityVerified();
        this.biometricScore = client.getBiometricScore();
    }

    public Long getId() {
        return id;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getDocumentNumber() {
        return documentNumber;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public String getAddress() {
        return address;
    }

    public LocalDate getBirthDate() {
        return birthDate;
    }

    public Gender getGender() {
        return gender;
    }

    public boolean isProfileComplete() {
        return profileComplete;
    }

    public boolean isIdentityVerified() {
        return identityVerified;
    }

    public BigDecimal getBiometricScore() {
        return biometricScore;
    }
}
