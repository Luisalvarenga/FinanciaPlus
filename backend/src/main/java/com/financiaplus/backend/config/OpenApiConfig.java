package com.financiaplus.backend.config;

import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.security.SecurityRequirement;
import io.swagger.v3.oas.models.security.SecurityScheme;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/*
 * API documentation, available at /swagger-ui.html.
 *
 * Declares the JWT bearer scheme so protected endpoints can be
 * tried from the browser: log in with /api/auth/login, press
 * "Authorize" and paste the token.
 */
@Configuration
public class OpenApiConfig {

    private static final String BEARER_SCHEME = "bearerAuth";

    @Bean
    public OpenAPI financiaPlusOpenApi() {

        return new OpenAPI()
                .info(new Info()
                        .title("FinanciaPlus API")
                        .version("1.0")
                        .description(
                                "Onboarding digital y originación de "
                                        + "productos: lista negra AML, "
                                        + "clientes del banco y score "
                                        + "crediticio, solicitudes con "
                                        + "geolocalización por IP."
                        )
                )
                .components(new Components()
                        .addSecuritySchemes(
                                BEARER_SCHEME,
                                new SecurityScheme()
                                        .type(SecurityScheme.Type.HTTP)
                                        .scheme("bearer")
                                        .bearerFormat("JWT")
                        )
                )
                .addSecurityItem(
                        new SecurityRequirement()
                                .addList(BEARER_SCHEME)
                );
    }
}
