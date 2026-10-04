package com.financiaplus.backend.controller;

import com.financiaplus.backend.config.RequestIpResolver;
import com.financiaplus.backend.dto.CreateCreditApplicationRequest;
import com.financiaplus.backend.dto.CreditApplicationResponse;
import com.financiaplus.backend.security.AuthenticatedClient;
import com.financiaplus.backend.service.CreditApplicationService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/credit-applications")
public class CreditApplicationController {

    private final CreditApplicationService creditApplicationService;
    private final RequestIpResolver requestIpResolver;

    public CreditApplicationController(
            CreditApplicationService creditApplicationService,
            RequestIpResolver requestIpResolver) {

        this.creditApplicationService = creditApplicationService;
        this.requestIpResolver = requestIpResolver;
    }

    @GetMapping
    public ResponseEntity<List<CreditApplicationResponse>> getApplications(
            Authentication authentication) {

        return ResponseEntity.ok(
                creditApplicationService.getApplications(
                        AuthenticatedClient.id(authentication)
                )
        );
    }

    @PostMapping
    public ResponseEntity<CreditApplicationResponse> createApplication(
            @Valid @RequestBody CreateCreditApplicationRequest request,
            HttpServletRequest httpRequest,
            Authentication authentication) {

        String ipAddress = requestIpResolver.resolve(httpRequest);

        CreditApplicationResponse response =
                creditApplicationService.createApplication(
                        AuthenticatedClient.id(authentication),
                        request,
                        ipAddress
                );

        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(response);
    }
}
