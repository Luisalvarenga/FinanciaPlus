package com.financiaplus.backend.config;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class RequestIpResolver {

    private final boolean allowForwardedFor;
    private final String developmentFallbackIp;

    public RequestIpResolver(
            @Value("${app.request-ip.allow-forwarded-for:false}")
            boolean allowForwardedFor,
            @Value("${app.request-ip.development-fallback-ip:}")
            String developmentFallbackIp) {

        this.allowForwardedFor = allowForwardedFor;
        this.developmentFallbackIp = developmentFallbackIp;
    }

    public String resolve(HttpServletRequest request) {

        if (allowForwardedFor) {

            String forwardedFor =
                    request.getHeader("X-Forwarded-For");

            if (forwardedFor != null
                    && !forwardedFor.isBlank()) {

                return forwardedFor.split(",")[0].trim();
            }
        }

        String remoteAddress = request.getRemoteAddr();

        if (isLoopbackAddress(remoteAddress)
                && developmentFallbackIp != null
                && !developmentFallbackIp.isBlank()) {

            return developmentFallbackIp;
        }

        return remoteAddress;
    }

    private boolean isLoopbackAddress(String ipAddress) {
        return "127.0.0.1".equals(ipAddress)
                || "::1".equals(ipAddress)
                || "0:0:0:0:0:0:0:1".equals(ipAddress);
    }
}