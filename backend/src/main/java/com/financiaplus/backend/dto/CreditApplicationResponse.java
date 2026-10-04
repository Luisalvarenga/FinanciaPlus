package com.financiaplus.backend.dto;

import com.financiaplus.backend.entity.ApplicationStatus;
import com.financiaplus.backend.entity.CreditApplication;
import com.financiaplus.backend.entity.RiskLevel;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class CreditApplicationResponse {

    private Long id;
    private Long clientId;
    private BigDecimal requestedAmount;
    private BigDecimal creditScore;
    private Boolean amlMatch;
    private ApplicationStatus status;
    private String ipAddress;
    private String country;
    private String region;
    private String city;
    private Integer riskScore;
    private RiskLevel riskLevel;
    private LocalDateTime createdAt;

    public CreditApplicationResponse(CreditApplication application) {
        this.id = application.getId();
        this.clientId = application.getClient().getId();
        this.requestedAmount = application.getRequestedAmount();
        this.creditScore = application.getCreditScore();
        this.amlMatch = application.getAmlMatch();
        this.status = application.getStatus();
        this.ipAddress = application.getIpAddress();
        this.country = application.getCountry();
        this.region = application.getRegion();
        this.city = application.getCity();
        this.riskScore = application.getRiskScore();
        this.riskLevel = application.getRiskLevel();
        this.createdAt = application.getCreatedAt();
    }

    public Integer getRiskScore() {
        return riskScore;
    }

    public RiskLevel getRiskLevel() {
        return riskLevel;
    }

    public Long getId() {
        return id;
    }

    public Long getClientId() {
        return clientId;
    }

    public BigDecimal getRequestedAmount() {
        return requestedAmount;
    }

    public BigDecimal getCreditScore() {
        return creditScore;
    }

    public Boolean getAmlMatch() {
        return amlMatch;
    }

    public ApplicationStatus getStatus() {
        return status;
    }

    public String getIpAddress() {
        return ipAddress;
    }

    public String getCountry() {
        return country;
    }

    public String getRegion() {
        return region;
    }

    public String getCity() {
        return city;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }
}