package com.cristina_tiznado.jugos.controladores;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cristina_tiznado.jugos.modelos.Jugo;
import com.cristina_tiznado.jugos.modelos.Usuario;
import com.cristina_tiznado.jugos.servicios.ServicioJugo;
import com.cristina_tiznado.jugos.servicios.ServicioUsuario;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorJugo {

    @Autowired
    private ServicioJugo servicioJugo;

    @Autowired
    private ServicioUsuario servicioUsuario;

    // ------------------------------------

    // INICIO

    @GetMapping("/jugos")
    public String jugos(HttpSession sesion, Model modelo, @RequestParam(value="filtro", required=false) String filtro){

        Usuario u = (Usuario) sesion.getAttribute("usuario");
        if(u == null){
            return "redirect:/";
        }

        modelo.addAttribute("usuarioLogueado", u);
        modelo.addAttribute("listaJugos", this.servicioJugo.buscarPorIngrediente(filtro));
        modelo.addAttribute("filtro", filtro);

        return "jugos.jsp";
    }

    // AGREGAR NUEVO JUGO

    @GetMapping("/formulario/agregar")
    public String formularioAgregar(HttpSession sesion, Model modelo){
        
        Usuario u = (Usuario) sesion.getAttribute("usuario");
        if(u == null){
            return "redirect:/";
        }

        modelo.addAttribute("jugo", new Jugo());

        return "agregar.jsp";
    }

    @PostMapping("/agregar")
    public String agregar(@Valid @ModelAttribute("jugo") Jugo jugo, BindingResult validaciones, HttpSession sesion){

        if(validaciones.hasErrors()){
            return "agregar.jsp";
        }

        Usuario u = (Usuario) sesion.getAttribute("usuario");
        jugo.setCreador(u);

        Jugo jugoNuevo = this.servicioJugo.crearJugo(jugo, validaciones);

        if(jugoNuevo == null){
            return "agregar.jsp";
        }

        return "redirect:/jugos";
    }

    // EDITAR JUGO
    @GetMapping("/formulario/editar/{id}")
    public String formularioEditar(@PathVariable("id") Long id, HttpSession sesion, Model modelo){

        Usuario u = (Usuario) sesion.getAttribute("usuario");
        if(u == null){
            return "redirect:/";
        }

        modelo.addAttribute("jugo", this.servicioJugo.obtenerJugoPorId(id));

        return "editar.jsp";
    }

    @PutMapping("/editar")
    public String editar(@Valid @ModelAttribute("jugo") Jugo jugo, BindingResult validaciones){

        if(validaciones.hasErrors()){
            return "editar.jsp";
        }

        Jugo jugoOriginal = this.servicioJugo.obtenerJugoPorId(jugo.getId());
        
        jugo.setCreador(jugoOriginal.getCreador());
        
        jugo.setPreparadores(jugoOriginal.getPreparadores());

        this.servicioJugo.modificarJugo(jugo);

        return "redirect:/jugos";
    }

    // ELIMINAR JUGO
    @DeleteMapping("/eliminar/{id}")
    public String eliminar(@PathVariable("id") Long id){

        this.servicioJugo.eliminarJugo(id);

        return "redirect:/jugos";
    }

    // DETALLE JUGO
    @GetMapping("/detalle/{id}")
    public String detalle(HttpSession sesion, @PathVariable("id") Long id, Model modelo){

        Usuario u = (Usuario) sesion.getAttribute("usuario");
        if(u == null){
            return "redirect:/";
        }

        Usuario usuarioDB = this.servicioUsuario.obtenerUsuarioPorId(u.getId());
        Jugo jugo = this.servicioJugo.obtenerJugoPorId(id);

        modelo.addAttribute("jugo", jugo);
        modelo.addAttribute("usuarioLogueado", usuarioDB);
        modelo.addAttribute("yaPreparado", this.servicioJugo.buscarJugoEnLista(jugo, usuarioDB));

        return "detalle.jsp";
    }

    // PREPARAR JUGO
    @GetMapping("/preparar/{id}")
    public String prepararJugo(@PathVariable("id") Long id, HttpSession sesion){

        Usuario usuario = (Usuario) sesion.getAttribute("usuario");
        Usuario usuarioDB = this.servicioUsuario.obtenerUsuarioPorId(usuario.getId());
        Jugo jugo = this.servicioJugo.obtenerJugoPorId(id);

        if(!usuarioDB.getJugosPreparados().contains(jugo)){
            usuarioDB.getJugosPreparados().add(jugo);

            this.servicioUsuario.modificarUsuario(usuarioDB);
        }

        return "redirect:/detalle/" + id;
    }

    // VISTA JUGOS PREPARADOS
    @GetMapping("/jugos/preparados")
    public String jugosPreparados(HttpSession sesion, Model modelo){

        Usuario u = (Usuario) sesion.getAttribute("usuario");
        if(u == null){
            return "redirect:/";
        }

        Usuario usuarioDB = this.servicioUsuario.obtenerUsuarioPorId(u.getId());

        modelo.addAttribute("usuarioLogueado", usuarioDB);
        modelo.addAttribute("jugosPreparados", usuarioDB.getJugosPreparados());

        return "preparados.jsp";
    }
}
