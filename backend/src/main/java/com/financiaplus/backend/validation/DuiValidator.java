package com.financiaplus.backend.validation;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

import java.util.regex.Pattern;

public class DuiValidator
        implements ConstraintValidator<Dui, String> {

    private static final Pattern FORMAT =
            Pattern.compile("\\d{8}-\\d");

    @Override
    public boolean isValid(
            String value,
            ConstraintValidatorContext context) {

        // Presence is validated separately with @NotBlank.
        if (value == null || value.isBlank()) {
            return true;
        }

        return isValidDui(value);
    }

    /*
     * The first eight digits are weighted from 9 down to 2.
     * The check digit is 10 minus the last digit of that sum,
     * or 0 when the result is 10.
     */
    public static boolean isValidDui(String value) {

        if (!FORMAT.matcher(value).matches()) {
            return false;
        }

        int sum = 0;

        for (int index = 0; index < 8; index++) {
            int digit = value.charAt(index) - '0';
            sum += digit * (9 - index);
        }

        int expectedCheckDigit = (10 - (sum % 10)) % 10;
        int checkDigit = value.charAt(9) - '0';

        return checkDigit == expectedCheckDigit;
    }
}
