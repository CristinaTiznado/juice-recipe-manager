package com.cristina_tiznado.jugos.servicios;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.cristina_tiznado.jugos.modelos.Jugo;
import com.cristina_tiznado.jugos.modelos.Usuario;
import com.cristina_tiznado.jugos.repositorios.RepositorioJugos;
import com.cristina_tiznado.jugos.repositorios.RepositorioUsuarios;

@Service
public class ServicioJugo {

    @Autowired
    private RepositorioJugos repositorioJugos;

    // SELECT
    public List<Jugo> obtenerTodosLosJugos() {
        return this.repositorioJugos.findAllByOrderByNombreAsc();
    }

    public Jugo obtenerJugoPorId(Long id) {
        return this.repositorioJugos.findById(id).orElse(null);
    }

    public Jugo obtenerPorNombre(String nombre) {
        return this.repositorioJugos.findByNombre(nombre).orElse(null);
    }

    public List<Jugo> buscarPorIngrediente(String ingrediente) {
        if (ingrediente == null || ingrediente.trim().isEmpty()) {
            return obtenerTodosLosJugos();
        }
        return repositorioJugos.findByIngredientesContainingIgnoreCaseOrderByNombreAsc(ingrediente);
    }

    public Boolean buscarJugoEnLista(Jugo jugo, Usuario usuario) {

        for (Jugo j : usuario.getJugosPreparados()) {
            // Comparamos el valor numérico exacto de los IDs
            if (j.getId() != null && j.getId().longValue() == jugo.getId().longValue()) {
                return true;
            }
        }
        return false;
    }

    // INSERT
    public Jugo crearJugo(Jugo jugo, BindingResult validaciones) {

        if (this.obtenerPorNombre(jugo.getNombre()) != null) {
            validaciones.rejectValue("nombre", "nombreExiste", "Este nombre de jugo ya existe.");
        }

        if (validaciones.hasErrors()) {
            return null;
        }

        return this.repositorioJugos.save(jugo);
    }

    // UPDATE
    public Jugo modificarJugo(Jugo jugo) {
        return this.repositorioJugos.save(jugo);
    }

    // DELETE
    public void eliminarJugo(Long id) {
        this.repositorioJugos.deleteById(id);
    }
}
