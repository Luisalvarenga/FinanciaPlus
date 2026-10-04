package com.financiaplus.backend.dto;

import com.financiaplus.backend.entity.BankCustomer;
import com.financiaplus.backend.entity.Gender;

import java.time.LocalDate;

public class BankCustomerGeneralResponse {

    private final String documentNumber;
    private final String firstName;
    private final String lastName;
    private final String address;
    private final LocalDate birthDate;
    private final Gender gender;
    private final String email;
    private final String phone;

    public BankCustomerGeneralResponse(BankCustomer customer) {
        this.documentNumber = customer.getDocumentNumber();
        this.firstName = customer.getFirstName();
        this.lastName = customer.getLastName();
        this.address = customer.getAddress();
        this.birthDate = customer.getBirthDate();
        this.gender = customer.getGender();
        this.email = customer.getEmail();
        this.phone = customer.getPhone();
    }

    public String getDocumentNumber() {
        return documentNumber;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
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

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }
}
