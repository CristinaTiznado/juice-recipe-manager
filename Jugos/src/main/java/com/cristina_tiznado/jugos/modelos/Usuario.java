package com.cristina_tiznado.jugos.modelos;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "usuarios")
public class Usuario implements Cloneable{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Por favor, proporciona un nombre.")
    @Size(min = 3, message = "Debe contener al menos 3 caracteres.")
    private String nombre;

    @NotBlank(message = "Por favor, proporciona un apellido.")
    @Size(min = 3, message = "Debe contener al menos 3 caracteres.")
    private String apellido;

    @NotBlank(message = "Por favor, proporciona un correo electronico.")
    @Email(message = "Por favor, proporciona un correo valido.")
    private String correo;

    @NotBlank(message = "Por favor, proporciona una contraseña.")
    @Size(min = 8, message = "La contraseña debe tener al menos 8 caracteres.")
    private String password;

    @Transient
    private String confirmarPassword;

    @OneToMany(mappedBy = "creador")
    private List<Jugo> jugosCreados;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "jugos_preparados", joinColumns = @JoinColumn(name = "id_usuario"), inverseJoinColumns = @JoinColumn(name = "id_jugo"))
    private List<Jugo> jugosPreparados;

    public Usuario(){}

    public Usuario(String nombre, String apellido, String correo, String password) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo = correo;
        this.password = password;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
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

    public String getConfirmarPassword() {
        return confirmarPassword;
    }

    public void setConfirmarPassword(String confirmarPassword) {
        this.confirmarPassword = confirmarPassword;
    }

    public List<Jugo> getJugosCreados() {
        return jugosCreados;
    }

    public void setJugosCreados(List<Jugo> jugosCreados) {
        this.jugosCreados = jugosCreados;
    }

    public List<Jugo> getJugosPreparados() {
        return jugosPreparados;
    }

    public void setJugosPreparados(List<Jugo> jugosPreparados) {
        this.jugosPreparados = jugosPreparados;
    }

    @Override
    public String toString() {
        return "Usuario [id=" + id + ", nombre=" + nombre + ", apellido=" + apellido + ", correo=" + correo
                + ", password=" + password + ", confirmarPassword=" + confirmarPassword + ", jugosCreados="
                + jugosCreados.toString() + ", jugosPreparados=" + jugosPreparados.toString() + "]";
    }

    @Override
    public Usuario clone(){
        try {
            return (Usuario) super.clone();
        } catch (Exception e) {
            return null;
        }
    }
}
