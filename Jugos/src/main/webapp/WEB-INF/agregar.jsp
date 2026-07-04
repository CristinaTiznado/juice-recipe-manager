<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Jugo</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <nav class="navbar">
        <h2>Jugos</h2>
        <div class="nav-links">
            <a href="/preparados">Jugos preparados</a>
            <a href="/jugos">Jugos</a>
            <a href="/formulario/agregar">Agregar jugo</a>
            <a href="/logout">Logout</a>
        </div>
    </nav>

    <div class="form-container">
        <h1>Agregar jugo</h1>
        <form:form action="/agregar" method="POST" modelAttribute="jugo">
            
            <form:label path="nombre">Nombre</form:label>
            <div class="input-error-wrapper">
                <form:input type="text" path="nombre" />
                <form:errors path="nombre"/>
            </div>

            <form:label path="descripcion">Descripción</form:label>
            <div class="input-error-wrapper">
                <form:textarea path="descripcion" rows="3"/>
                <form:errors path="descripcion"/>
            </div>

            <form:label path="ingredientes">Ingredientes</form:label>
            <div class="input-error-wrapper">
                <form:textarea path="ingredientes" rows="3"/>
                <form:errors path="ingredientes"/>
            </div>

            <form:label path="instrucciones">Instrucciones</form:label>
            <div class="input-error-wrapper">
                <form:textarea path="instrucciones" rows="4"/>
                <form:errors path="instrucciones"/>
            </div>

            <form:label path="url">URL a imagen</form:label>
            <div class="input-error-wrapper">
                <form:input type="text" path="url" />
                <form:errors path="url"/>
            </div>

            <button type="submit" class="btn-primary btn-block">Agregar</button>
        </form:form>
    </div>
</body>
</html>