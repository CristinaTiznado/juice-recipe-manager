package com.cristina_tiznado.jugos.servicios;

import java.util.HashMap;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.cristina_tiznado.jugos.modelos.Usuario;
import com.cristina_tiznado.jugos.modelos.UsuarioLogin;
import com.cristina_tiznado.jugos.repositorios.RepositorioUsuarios;

@Service
public class ServicioUsuario {

    @Autowired
    private RepositorioUsuarios repositorioUsuarios;

    // SELECT
    public List<Usuario> obtenerTodosLosUsuarios() {
        return (List<Usuario>) this.repositorioUsuarios.findAll();
    }

    public Usuario obtenerUsuarioPorId(Long id) {
        return this.repositorioUsuarios.findById(id).orElse(null);
    }

    public Usuario obtenerUsuarioPorEmail(String correo) {
        return this.repositorioUsuarios.findByCorreo(correo).orElse(null);
    }

    // INSERT
    public Usuario crearUsuario(Usuario usuario) {

        String newPassword = BCrypt.hashpw(usuario.getPassword(), BCrypt.gensalt());
        usuario.setPassword(newPassword);

        return this.repositorioUsuarios.save(usuario);
    }

    // UPDATE
    public Usuario modificarUsuario(Usuario usuario) {
        return this.repositorioUsuarios.save(usuario);
    }

    // -----------------------------------------------

    public BindingResult validarRegistro(BindingResult validaciones, Usuario usuario) {

        if (this.obtenerUsuarioPorEmail(usuario.getCorreo()) != null) {
            validaciones.rejectValue("correo", "correoExiste", "El correo ya está registrado.");
        } else if (!usuario.getPassword().equals(usuario.getConfirmarPassword())) {
            validaciones.rejectValue("confirmarPassword", "passwordNoCoincide", "Las contraseñas no coinciden.");
        }

        return validaciones;
    }

    public HashMap<String, Object> validarLogin(BindingResult validaciones, UsuarioLogin usuarioLogin) {

        HashMap<String, Object> resultado = new HashMap<>();

        Usuario usuarioDB = this.obtenerUsuarioPorEmail(usuarioLogin.getCorreo());

        if (usuarioDB == null) {
            validaciones.rejectValue("correo", "emailInexistente",
                    "El correo electronico ingresado no corresponde a un usuario.");
        } else {
            if (!BCrypt.checkpw(usuarioLogin.getPassword(), usuarioDB.getPassword())) {
                validaciones.rejectValue("password", "passwordIncorrecta", "Contraseña incorrecta");
            } else {
                resultado.put("usuario", usuarioDB);
            }
        }

        resultado.put("validaciones", validaciones);

        return resultado;
    }
}
