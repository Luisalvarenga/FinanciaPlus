package com.financiaplus.backend.dto;

public class AmlCheckResponse {

    private boolean match;
    private String message;

    public AmlCheckResponse(boolean match, String message) {
        this.match = match;
        this.message = message;
    }

    public boolean isMatch() {
        return match;
    }

    public String getMessage() {
        return message;
    }
}