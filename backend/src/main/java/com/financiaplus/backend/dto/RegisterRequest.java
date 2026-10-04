package com.financiaplus.backend.dto;

import com.financiaplus.backend.validation.Dui;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public class RegisterRequest {

    @NotBlank(message = "El nombre es obligatorio.")
    @Size(max = 100, message = "El nombre no debe superar 100 caracteres.")
    private String firstName;

    @NotBlank(message = "El apellido es obligatorio.")
    @Size(max = 100, message = "El apellido no debe superar 100 caracteres.")
    private String lastName;

    @NotBlank(message = "El número de documento es obligatorio.")
    @Dui
    private String documentNumber;

    @NotBlank(message = "El correo es obligatorio.")
    @Email(message = "El correo no es válido.")
    @Size(max = 150, message = "El correo no debe superar 150 caracteres.")
    private String email;

    @NotBlank(message = "El teléfono es obligatorio.")
    @Size(max = 20, message = "El teléfono no debe superar 20 caracteres.")
    private String phone;

    @NotBlank(message = "La contraseña es obligatoria.")
    @Size(
            min = 8,
            max = 72,
            message = "La contraseña debe tener entre 8 y 72 caracteres."
    )
    private String password;

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getDocumentNumber() {
        return documentNumber;
    }

    public void setDocumentNumber(String documentNumber) {
        this.documentNumber = documentNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
