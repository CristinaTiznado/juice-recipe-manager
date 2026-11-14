package com.cristina_tiznado.jugos.repositorios;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.cristina_tiznado.jugos.modelos.Jugo;

@Repository
public interface RepositorioJugos extends CrudRepository<Jugo, Long>, PagingAndSortingRepository<Jugo, Long> {

    Page<Jugo> findAllByOrderByNombreAsc(Pageable pageable);
    
    Page<Jugo> findByIngredientesContainingIgnoreCaseOrderByNombreAsc(String ingrediente, Pageable pageable);
    
    Optional<Jugo> findByNombre(String nombre);
}
