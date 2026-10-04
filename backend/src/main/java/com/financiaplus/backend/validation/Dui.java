package com.financiaplus.backend.validation;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/*
 * Validates a Salvadoran identity document number (DUI):
 * eight digits, a hyphen and a check digit.
 */
@Documented
@Constraint(validatedBy = DuiValidator.class)
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Dui {

    String message() default
            "El DUI no es válido. Usa el formato 00000000-0.";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
