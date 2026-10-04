package com.financiaplus.backend.controller;

import com.financiaplus.backend.dto.AmlCheckResponse;
import com.financiaplus.backend.dto.BlacklistedPersonResponse;
import com.financiaplus.backend.service.AmlService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/aml")
public class AmlController {

    private final AmlService amlService;

    public AmlController(AmlService amlService) {
        this.amlService = amlService;
    }

    @GetMapping("/check/{documentNumber}")
    public ResponseEntity<AmlCheckResponse> checkAml(
            @PathVariable String documentNumber) {

        AmlCheckResponse response =
                amlService.checkClient(documentNumber);

        return ResponseEntity.ok(response);
    }

    @GetMapping("/search")
    public ResponseEntity<List<BlacklistedPersonResponse>> searchByName(
            @RequestParam String name) {

        return ResponseEntity.ok(
                amlService.searchByName(name)
        );
    }
}
