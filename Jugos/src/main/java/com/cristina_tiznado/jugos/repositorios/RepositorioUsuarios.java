package com.cristina_tiznado.jugos.repositorios;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.cristina_tiznado.jugos.modelos.Usuario;

@Repository
public interface RepositorioUsuarios extends CrudRepository<Usuario, Long>{

    Optional<Usuario> findByCorreo(String correo);
}
