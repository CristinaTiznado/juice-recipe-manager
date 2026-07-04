package com.cristina_tiznado.jugos.modelos;

import jakarta.validation.constraints.NotBlank;

public class UsuarioLogin {

    @NotBlank(message = "Por favor, proporciona un correo electronico.")
    private String correo;

    @NotBlank(message = "Por favor, proporciona una contraseña.")
    private String password;

    public UsuarioLogin(){}

    public UsuarioLogin(@NotBlank(message = "Por favor, proporciona un correo electronico.") String correo,
            @NotBlank(message = "Por favor, proporciona una contraseña.") String password) {
        this.correo = correo;
        this.password = password;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "UsuarioLogin [correo=" + correo + ", password=" + password + "]";
    }
}
