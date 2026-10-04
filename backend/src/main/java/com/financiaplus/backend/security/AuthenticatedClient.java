package com.financiaplus.backend.security;

import org.springframework.security.core.Authentication;

/*
 * The JWT subject is the client id, which
 * JwtAuthenticationFilter exposes as the principal name.
 */
public final class AuthenticatedClient {

    private AuthenticatedClient() {
    }

    public static Long id(Authentication authentication) {
        return Long.valueOf(authentication.getName());
    }
}
