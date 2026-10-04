package com.financiaplus.backend.security;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.crypto.SecretKey;
import java.nio.charset.StandardCharsets;
import java.util.Date;

@Service
public class JwtService {

    private final SecretKey signingKey;
    private final long expirationMillis;

    public JwtService(
            @Value("${app.jwt.secret}")
            String secret,
            @Value("${app.jwt.expiration-minutes:60}")
            long expirationMinutes) {

        this.signingKey = Keys.hmacShaKeyFor(
                secret.getBytes(StandardCharsets.UTF_8)
        );
        this.expirationMillis = expirationMinutes * 60 * 1000;
    }

    public String generateToken(String subject) {

        Date now = new Date();

        return Jwts.builder()
                .subject(subject)
                .issuedAt(now)
                .expiration(
                        new Date(now.getTime() + expirationMillis)
                )
                .signWith(signingKey)
                .compact();
    }

    public String extractSubject(String token) {

        return Jwts.parser()
                .verifyWith(signingKey)
                .build()
                .parseSignedClaims(token)
                .getPayload()
                .getSubject();
    }

    public boolean isValid(String token) {

        try {
            extractSubject(token);
            return true;
        } catch (Exception exception) {
            return false;
        }
    }
}
