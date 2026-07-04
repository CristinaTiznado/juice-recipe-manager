package com.cristina_tiznado.jugos.repositorios;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.cristina_tiznado.jugos.modelos.Jugo;

@Repository
public interface RepositorioJugos extends CrudRepository<Jugo, Long>{

    List<Jugo> findAllByOrderByNombreAsc();
    
    List<Jugo> findByIngredientesContainingIgnoreCaseOrderByNombreAsc(String ingrediente);
    
    Optional<Jugo> findByNombre(String nombre);
}
