package com.financiaplus.backend.controller;

import com.financiaplus.backend.dto.BankCustomerFinancialResponse;
import com.financiaplus.backend.dto.BankCustomerGeneralResponse;
import com.financiaplus.backend.security.AuthenticatedClient;
import com.financiaplus.backend.service.BankCustomerService;
import com.financiaplus.backend.service.ClientService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/bank-customers")
public class BankCustomerController {

    private final BankCustomerService bankCustomerService;
    private final ClientService clientService;

    public BankCustomerController(
            BankCustomerService bankCustomerService,
            ClientService clientService) {

        this.bankCustomerService = bankCustomerService;
        this.clientService = clientService;
    }

    @GetMapping("/{documentNumber}")
    public ResponseEntity<BankCustomerGeneralResponse> getGeneralData(
            @PathVariable String documentNumber,
            Authentication authentication) {

        clientService.requireOwnDocument(
                AuthenticatedClient.id(authentication),
                documentNumber
        );

        return ResponseEntity.ok(
                bankCustomerService.getGeneralData(documentNumber)
        );
    }

    @GetMapping("/{documentNumber}/financial")
    public ResponseEntity<BankCustomerFinancialResponse> getFinancialData(
            @PathVariable String documentNumber,
            Authentication authentication) {

        clientService.requireOwnDocument(
                AuthenticatedClient.id(authentication),
                documentNumber
        );

        return ResponseEntity.ok(
                bankCustomerService.getFinancialData(documentNumber)
        );
    }
}
