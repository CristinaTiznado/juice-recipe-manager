package com.cristina_tiznado.jugos.modelos;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "jugos")
public class Jugo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Por favor, proporciona un nombre.")
    @Size(min = 5, message = "Debe contener al menos 5 caracteres.")
    private String nombre;

    @NotBlank(message = "Por favor, proporcione una descripcion.")
    @Size(min = 10, message = "Debe contener al menos 10 caracteres.")
    private String descripcion;

    @NotBlank(message = "Por favor, proporcione los ingredientes.")
    @Size(min = 10, message = "Debe contener al menos 10 caracteres.")
    private String ingredientes;

    @NotBlank(message = "Por favor, proporcione las instrucciones.")
    @Size(min = 10, message = "Debe contener al menos 10 caracteres.")
    private String instrucciones;

    @NotBlank(message = "Por favor, proporcione la URL.")
    @Pattern(regexp = "^(.*\\.(?i)(jpg|jpeg|png|gif|bmp))$", message = "La URL de la imagen debe de terminar con la extensión de algún formato de imagen.")
    private String url;

    @ManyToOne
    @JoinColumn(name = "id_usuario")
    private Usuario creador;

    @ManyToMany
    @JoinTable(name = "jugos_preparados", joinColumns = @JoinColumn(name = "id_jugo"), inverseJoinColumns = @JoinColumn(name = "id_usuario"))
    private List<Usuario> preparadores;

    public Jugo(){}

    public Jugo(String nombre, String descripcion, String ingredientes, String instrucciones, String url) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.ingredientes = ingredientes;
        this.instrucciones = instrucciones;
        this.url = url;
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

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getIngredientes() {
        return ingredientes;
    }

    public void setIngredientes(String ingredientes) {
        this.ingredientes = ingredientes;
    }

    public String getInstrucciones() {
        return instrucciones;
    }

    public void setInstrucciones(String instrucciones) {
        this.instrucciones = instrucciones;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Usuario getCreador() {
        return creador;
    }

    public void setCreador(Usuario creador) {
        this.creador = creador;
    }

    public List<Usuario> getPreparadores() {
        return preparadores;
    }

    public void setPreparadores(List<Usuario> preparadores) {
        this.preparadores = preparadores;
    }

    @Override
    public String toString() {
        return "Jugo [id=" + id + ", nombre=" + nombre + ", descripcion=" + descripcion + ", ingredientes="
                + ingredientes + ", instrucciones=" + instrucciones + ", url=" + url + ", creador=" + creador.getId()
                + ", preparadores=" + preparadores.toString() + "]";
    }
}
