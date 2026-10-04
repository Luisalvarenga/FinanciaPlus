package com.financiaplus.backend.controller;

import com.financiaplus.backend.dto.CreditScoreResponse;
import com.financiaplus.backend.security.AuthenticatedClient;
import com.financiaplus.backend.service.ClientService;
import com.financiaplus.backend.service.CreditScoreService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/credit-score")
public class CreditScoreController {

    private final CreditScoreService creditScoreService;
    private final ClientService clientService;

    public CreditScoreController(
            CreditScoreService creditScoreService,
            ClientService clientService) {

        this.creditScoreService = creditScoreService;
        this.clientService = clientService;
    }

    @GetMapping("/{documentNumber}")
    public ResponseEntity<CreditScoreResponse> getCreditScore(
            @PathVariable String documentNumber,
            Authentication authentication) {

        clientService.requireOwnDocument(
                AuthenticatedClient.id(authentication),
                documentNumber
        );

        return ResponseEntity.ok(
                creditScoreService.getCreditScore(documentNumber)
        );
    }
}
