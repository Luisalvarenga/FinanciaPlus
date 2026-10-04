package com.financiaplus.backend.service;

import com.financiaplus.backend.dto.GeolocationResponse;
import com.financiaplus.backend.exception.GeolocationException;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestClientResponseException;

@Service
public class GeolocationService {

    private final RestClient restClient;

    public GeolocationService(RestClient.Builder restClientBuilder) {
        this.restClient = restClientBuilder
                .baseUrl("https://ipapi.co")
                .build();
    }

    public GeolocationResponse getLocation(String ipAddress) {

        if (isLoopbackAddress(ipAddress)) {
            throw new GeolocationException(
                    "Geolocation cannot be resolved from a local loopback address.",
                    null
            );
        }

        try {
            GeolocationResponse response = restClient
                    .get()
                    .uri("/{ip}/json/", ipAddress)
                    .retrieve()
                    .body(GeolocationResponse.class);

            if (response == null) {
                throw new GeolocationException(
                        "Geolocation provider returned an empty response.",
                        null
                );
            }

            if (response.getCountry() == null
                    || response.getRegion() == null
                    || response.getCity() == null) {

                throw new GeolocationException(
                        "Geolocation provider returned incomplete location data.",
                        null
                );
            }

            return response;

        } catch (RestClientResponseException exception) {

            throw new GeolocationException(
                    "Geolocation provider returned HTTP "
                            + exception.getStatusCode().value()
                            + ".",
                    exception
            );

        } catch (RestClientException exception) {

            throw new GeolocationException(
                    "Geolocation provider is currently unavailable.",
                    exception
            );
        }
    }

    private boolean isLoopbackAddress(String ipAddress) {
        return "127.0.0.1".equals(ipAddress)
                || "::1".equals(ipAddress)
                || "0:0:0:0:0:0:0:1".equals(ipAddress);
    }
}