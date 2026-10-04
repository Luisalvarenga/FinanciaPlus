package com.financiaplus.backend.config;

import com.financiaplus.backend.entity.BankCustomer;
import com.financiaplus.backend.entity.BlacklistedPerson;
import com.financiaplus.backend.entity.Client;
import com.financiaplus.backend.entity.Gender;
import com.financiaplus.backend.repository.BankCustomerRepository;
import com.financiaplus.backend.repository.BlacklistedPersonRepository;
import com.financiaplus.backend.repository.ClientRepository;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;

/*
 * Seed data for the technical test.
 *
 * Simulates the AML blacklist, the bank's existing customer
 * base and a set of app accounts so every scenario can be
 * reproduced. The accounts share the password configured in
 * app.seed.default-password.
 *
 * Each record is inserted only when its document number is
 * missing, so new entries can be added without resetting
 * the database.
 */
@Component
public class DataSeeder implements CommandLineRunner {

    private final BlacklistedPersonRepository blacklistedPersonRepository;
    private final BankCustomerRepository bankCustomerRepository;
    private final ClientRepository clientRepository;
    private final PasswordEncoder passwordEncoder;
    private final String defaultPassword;

    public DataSeeder(
            BlacklistedPersonRepository blacklistedPersonRepository,
            BankCustomerRepository bankCustomerRepository,
            ClientRepository clientRepository,
            PasswordEncoder passwordEncoder,
            @Value("${app.seed.default-password}")
            String defaultPassword) {

        this.blacklistedPersonRepository = blacklistedPersonRepository;
        this.bankCustomerRepository = bankCustomerRepository;
        this.clientRepository = clientRepository;
        this.passwordEncoder = passwordEncoder;
        this.defaultPassword = defaultPassword;
    }

    @Override
    @Transactional
    public void run(String... args) {

        /*
         * One account per scenario. They only hold the sign-up
         * data, so the onboarding flow can be exercised with each:
         *
         *   ana.martinez    existing customer, score 8.50 -> approved
         *   luis.hernandez  existing customer, score 5.50 -> rejected
         *   sofia.rivas     existing customer, score 7.00 -> approved
         *   diego.castro    existing customer, score 6.99 -> rejected
         *   carlos.mendoza  blacklisted                   -> rejected
         *   maria.lopez     not a customer                -> approved
         *   pedro.ramos     biometric match below 80%     -> blocked
         */
        account(
                "Ana",
                "Martinez",
                "11111111-6",
                "ana.martinez@example.com",
                "7000-1111"
        );
        account(
                "Luis",
                "Hernandez",
                "22222222-2",
                "luis.hernandez@example.com",
                "7000-2222"
        );
        account(
                "Sofia",
                "Rivas",
                "55555555-0",
                "sofia.rivas@example.com",
                "7000-5555"
        );
        account(
                "Diego",
                "Castro",
                "66666666-6",
                "diego.castro@example.com",
                "7000-6666"
        );
        account(
                "Carlos",
                "Mendoza",
                "99999999-4",
                "carlos.mendoza@example.com",
                "7000-9999"
        );
        account(
                "Maria",
                "Lopez",
                "33333333-8",
                "maria.lopez@example.com",
                "7000-3333"
        );
        account(
                "Pedro",
                "Ramos",
                "44444444-4",
                "pedro.ramos@example.com",
                "7000-4444"
        );

        blacklistedPerson(
                "Carlos Mendoza",
                "99999999-4",
                LocalDate.of(1975, 3, 14),
                "Investigación por lavado de dinero."
        );
        blacklistedPerson(
                "Roberto Salazar",
                "88888888-8",
                LocalDate.of(1982, 11, 2),
                "Lista de sanciones internacionales."
        );

        customer(
                "11111111-6",
                "Ana",
                "Martinez",
                "Colonia Escalon, San Salvador",
                LocalDate.of(1990, 5, 20),
                Gender.FEMALE,
                "ana.martinez@example.com",
                "7000-1111",
                "8.50",
                "1800.00",
                LocalDate.of(2018, 1, 15)
        );
        customer(
                "22222222-2",
                "Luis",
                "Hernandez",
                "Santa Tecla, La Libertad",
                LocalDate.of(1985, 9, 8),
                Gender.MALE,
                "luis.hernandez@example.com",
                "7000-2222",
                "5.50",
                "650.00",
                LocalDate.of(2021, 6, 1)
        );

        // Boundary cases for the minimum score of 7.0.
        customer(
                "55555555-0",
                "Sofia",
                "Rivas",
                "Antiguo Cuscatlan, La Libertad",
                LocalDate.of(1993, 2, 11),
                Gender.FEMALE,
                "sofia.rivas@example.com",
                "7000-5555",
                "7.00",
                "1100.00",
                LocalDate.of(2020, 3, 9)
        );
        customer(
                "66666666-6",
                "Diego",
                "Castro",
                "Soyapango, San Salvador",
                LocalDate.of(1988, 7, 25),
                Gender.MALE,
                "diego.castro@example.com",
                "7000-6666",
                "6.99",
                "900.00",
                LocalDate.of(2019, 10, 21)
        );
    }

    private void account(
            String firstName,
            String lastName,
            String documentNumber,
            String email,
            String phone) {

        if (clientRepository.existsByDocumentNumber(documentNumber)
                || clientRepository.existsByEmail(email)) {
            return;
        }

        Client client = new Client();

        client.setFirstName(firstName);
        client.setLastName(lastName);
        client.setDocumentNumber(documentNumber);
        client.setEmail(email);
        client.setPhone(phone);
        client.setPasswordHash(
                passwordEncoder.encode(defaultPassword)
        );

        clientRepository.save(client);
    }

    private void blacklistedPerson(
            String fullName,
            String documentNumber,
            LocalDate birthDate,
            String reason) {

        if (blacklistedPersonRepository
                .existsByDocumentNumber(documentNumber)) {
            return;
        }

        blacklistedPersonRepository.save(
                new BlacklistedPerson(
                        fullName,
                        documentNumber,
                        birthDate,
                        reason
                )
        );
    }

    private void customer(
            String documentNumber,
            String firstName,
            String lastName,
            String address,
            LocalDate birthDate,
            Gender gender,
            String email,
            String phone,
            String creditScore,
            String monthlyIncome,
            LocalDate customerSince) {

        if (bankCustomerRepository
                .findByDocumentNumber(documentNumber)
                .isPresent()) {
            return;
        }

        BankCustomer customer = new BankCustomer();

        customer.setDocumentNumber(documentNumber);
        customer.setFirstName(firstName);
        customer.setLastName(lastName);
        customer.setAddress(address);
        customer.setBirthDate(birthDate);
        customer.setGender(gender);
        customer.setEmail(email);
        customer.setPhone(phone);
        customer.setCreditScore(new BigDecimal(creditScore));
        customer.setMonthlyIncome(new BigDecimal(monthlyIncome));
        customer.setCustomerSince(customerSince);

        bankCustomerRepository.save(customer);
    }
}
