package com.cristina_tiznado.jugos.servicios;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

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

    @Autowired
    private RepositorioUsuarios repositorioUsuarios;

    // SELECT
    public Page<Jugo> obtenerTodosLosJugos(Pageable pageable) {
        return this.repositorioJugos.findAllByOrderByNombreAsc(pageable);
    }

    public Jugo obtenerJugoPorId(Long id) {
        return this.repositorioJugos.findById(id).orElse(null);
    }

    public Jugo obtenerPorNombre(String nombre) {
        return this.repositorioJugos.findByNombre(nombre).orElse(null);
    }

    public Page<Jugo> buscarPorIngrediente(String ingrediente, Pageable pageable) {
        if (ingrediente == null || ingrediente.trim().isEmpty()) {
            return obtenerTodosLosJugos(pageable);
        }
        return repositorioJugos.findByIngredientesContainingIgnoreCaseOrderByNombreAsc(ingrediente, pageable);
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
    Jugo jugoAEliminar = this.repositorioJugos.findById(id).orElse(null);
    
    if (jugoAEliminar != null) {
        Iterable<Usuario> todosLosUsuarios = this.repositorioUsuarios.findAll();
        
        for (Usuario usuario : todosLosUsuarios) {
            if (usuario.getJugosPreparados().contains(jugoAEliminar)) {
                usuario.getJugosPreparados().remove(jugoAEliminar);
                this.repositorioUsuarios.save(usuario); 
            }
        }
        
        this.repositorioJugos.delete(jugoAEliminar);
    }
}
}
