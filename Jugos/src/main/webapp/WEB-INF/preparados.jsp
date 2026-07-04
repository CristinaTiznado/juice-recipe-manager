<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jugos Preparados</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <nav class="navbar">
        <h2>Jugos</h2>
        <div class="nav-links">
            <a href="/jugos/preparados" class="active-link">Jugos preparados</a>
            <a href="/jugos">Jugos</a>
            <a href="/formulario/agregar">Agregar jugo</a>
            <a href="/logout">Logout</a>
        </div>
    </nav>

    <div class="main-content">
        <h2>Jugos que has preparado</h2>
        
        <div class="lista-jugos">
            <c:forEach var="jugo" items="${jugosPreparados}">
                <div class="card-jugo">
                    <h3>${jugo.nombre}</h3>
                    <img src="${jugo.url}" alt="Imagen de ${jugo.nombre}">
                    <div class="card-actions">
                        <a href="/detalle/${jugo.id}" class="btn-primary">Detalle</a>
                    </div>
                </div>
            </c:forEach>
            
            <c:if test="${empty jugosPreparados}">
                <p>Aún no has marcado ningún jugo como preparado.</p>
            </c:if>
        </div>
    </div>
</body>
</html>