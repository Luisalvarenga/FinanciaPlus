package com.financiaplus.backend.service;

import com.financiaplus.backend.dto.LoginRequest;
import com.financiaplus.backend.dto.LoginResponse;
import com.financiaplus.backend.dto.RegisterRequest;
import com.financiaplus.backend.entity.Client;
import com.financiaplus.backend.exception.InvalidCredentialsException;
import com.financiaplus.backend.repository.ClientRepository;
import com.financiaplus.backend.security.JwtService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AuthService {

    private final ClientRepository clientRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;

    public AuthService(
            ClientRepository clientRepository,
            PasswordEncoder passwordEncoder,
            JwtService jwtService) {

        this.clientRepository = clientRepository;
        this.passwordEncoder = passwordEncoder;
        this.jwtService = jwtService;
    }

    @Transactional
    public LoginResponse register(RegisterRequest request) {

        String email = normalizeEmail(request.getEmail());

        if (clientRepository.existsByDocumentNumber(request.getDocumentNumber())) {
            throw new IllegalArgumentException(
                    "Ya existe un cliente con este número de documento."
            );
        }

        if (clientRepository.existsByEmail(email)) {
            throw new IllegalArgumentException(
                    "Ya existe un cliente con este correo."
            );
        }

        Client client = new Client();

        client.setFirstName(request.getFirstName());
        client.setLastName(request.getLastName());
        client.setDocumentNumber(request.getDocumentNumber());
        client.setEmail(email);
        client.setPhone(request.getPhone());
        client.setPasswordHash(
                passwordEncoder.encode(request.getPassword())
        );

        Client savedClient = clientRepository.save(client);

        return toLoginResponse(savedClient);
    }

    @Transactional(readOnly = true)
    public LoginResponse login(LoginRequest request) {

        // Same error for an unknown email and a wrong password,
        // so the response does not reveal which accounts exist.
        Client client = clientRepository
                .findByEmail(normalizeEmail(request.getEmail()))
                .filter(found -> passwordEncoder.matches(
                        request.getPassword(),
                        found.getPasswordHash()
                ))
                .orElseThrow(() -> new InvalidCredentialsException(
                        "Correo o contraseña incorrectos."
                ));

        return toLoginResponse(client);
    }

    private LoginResponse toLoginResponse(Client client) {

        return new LoginResponse(
                jwtService.generateToken(
                        String.valueOf(client.getId())
                )
        );
    }

    private String normalizeEmail(String email) {
        return email.trim().toLowerCase();
    }
}
