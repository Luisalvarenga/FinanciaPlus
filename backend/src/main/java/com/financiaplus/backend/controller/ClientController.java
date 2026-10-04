package com.financiaplus.backend.controller;

import com.financiaplus.backend.dto.ClientResponse;
import com.financiaplus.backend.dto.IdentityVerificationResponse;
import com.financiaplus.backend.dto.UpdateProfileRequest;
import com.financiaplus.backend.security.AuthenticatedClient;
import com.financiaplus.backend.service.ClientService;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/clients")
public class ClientController {

    private final ClientService clientService;

    public ClientController(ClientService clientService) {
        this.clientService = clientService;
    }

    @GetMapping("/me")
    public ResponseEntity<ClientResponse> getCurrentClient(
            Authentication authentication) {

        return ResponseEntity.ok(
                clientService.getClient(
                        AuthenticatedClient.id(authentication)
                )
        );
    }

    @PutMapping("/me")
    public ResponseEntity<ClientResponse> updateProfile(
            @Valid @RequestBody UpdateProfileRequest request,
            Authentication authentication) {

        return ResponseEntity.ok(
                clientService.updateProfile(
                        AuthenticatedClient.id(authentication),
                        request
                )
        );
    }

    @PostMapping("/me/identity-verification")
    public ResponseEntity<IdentityVerificationResponse> verifyIdentity(
            Authentication authentication) {

        return ResponseEntity.ok(
                clientService.verifyIdentity(
                        AuthenticatedClient.id(authentication)
                )
        );
    }
}
