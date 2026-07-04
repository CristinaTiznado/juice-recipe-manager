<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalle Jugo</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <nav class="navbar">
        <h2>Jugos</h2>
        <div class="nav-links">
            <a href="/jugos/preparados">Jugos preparados</a>
            <a href="/jugos">Jugos</a>
            <a href="/formulario/agregar">Agregar jugo</a>
            <a href="/logout">Logout</a>
        </div>
    </nav>

    <div class="main-content">
        <h1>${jugo.nombre} - Agregado por ${jugo.creador.nombre} ${jugo.creador.apellido}</h1>
        
        <div class="detalle-layout">
            <div class="detalle-texto">
                <h4>Descripción</h4>
                <p>${jugo.descripcion}</p>
                
                <h4>Ingredientes</h4>
                <p>${jugo.ingredientes}</p>
                
                <h4>Instrucciones</h4>
                <p>${jugo.instrucciones}</p>
                
                <div class="detalle-acciones">
                    <c:if test="${jugo.creador.id == usuarioLogueado.id}">
                        <a href="/formulario/editar/${jugo.id}" class="btn-primary">Editar</a>
                    </c:if>

                    <c:choose>
                        <c:when test="${yaPreparado}">
                            <span class="btn-disabled">Ya preparé este jugo</span>
                        </c:when>
                        <c:otherwise>
                            <form id="form-preparar" action="/preparar/${jugo.id}" method="GET" >
                                <button type="submit" class="btn-primary">Preparar jugo</button>
                            </form>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            
            <div class="detalle-imagen">
                <img src="${jugo.url}" alt="${jugo.nombre}">
            </div>
        </div>
    </div>

    <script src="/js/preparar.js"></script>
</body>
</html>