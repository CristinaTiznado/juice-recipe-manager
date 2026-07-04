<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jugos</title>
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
        <h2>Bienvenido de vuelta ${usuarioLogueado.nombre} ${usuarioLogueado.apellido}</h2>
        
        <form action="/jugos" method="GET" class="search-bar">
            <input type="text" name="filtro" value="${filtroBusqueda}" placeholder="Buscar por ingrediente (Ej. Naranja)">
            <button type="submit" class="btn-primary">Filtrar</button>
            <c:if test="${not empty filtroBusqueda}">
                <a href="/jugos" class="btn-primary" style="background-color: #666; text-decoration: none;">Limpiar</a>
            </c:if>
        </form>
        
        <div class="lista-jugos">
            <c:forEach var="jugo" items="${listaJugos}">
                <div class="card-jugo">
                    <h3>${jugo.nombre}</h3>
                    <img src="${jugo.url}" alt="Imagen de ${jugo.nombre}">
                    <div class="card-actions">
                        <a href="/detalle/${jugo.id}" class="btn-primary">Detalle</a>
                        
                        <c:if test="${jugo.creador.id == usuarioLogueado.id}">
                            <form action="/eliminar/${jugo.id}" method="POST">
                                <input type="hidden" name="_method" value="DELETE"/>
                                <button type="submit" class="btn-danger">Eliminar</button>
                            </form>
                        </c:if>
                    </div>
                </div>
            </c:forEach>
            <c:if test="${empty listaJugos}">
                <p>No se encontraron jugos.</p>
            </c:if>
        </div>
    </div>
</body>
</html>