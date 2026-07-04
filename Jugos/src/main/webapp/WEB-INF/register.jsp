<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <nav class="navbar">
        <h2>Pinturas</h2>
        <div class="nav-links">
            <a href="/">Login</a>
            <a href="/register">Registro</a>
        </div>
    </nav>

    <div class="form-container">
        <h1>Registro</h1>
        <form:form action="/register" method="POST" modelAttribute="usuario">
            
            <form:label path="nombre">Nombre</form:label>
            <div class="input-error-wrapper">
                <form:input type="text" path="nombre"/>
                <form:errors path="nombre"/>
            </div>

            <form:label path="apellido">Apellido</form:label>
            <div class="input-error-wrapper">
                <form:input type="text" path="apellido"/>
                <form:errors path="apellido"/>
            </div>

            <form:label path="correo">Correo</form:label>
            <div class="input-error-wrapper">
                <form:input type="email" path="correo"/>
                <form:errors path="correo"/>
            </div>

            <form:label path="password">Contraseña</form:label>
            <div class="input-error-wrapper">
                <form:input type="password" path="password"/>
                <form:errors path="password"/>
            </div>

            <form:label path="confirmarPassword">Confirmar contraseña</form:label>
            <div class="input-error-wrapper">
                <form:input type="password" path="confirmarPassword"/>
                <form:errors path="confirmarPassword"/>
            </div>

            <button type="submit" class="btn-primary btn-block">Registrarse</button>
        </form:form>
    </div>
</body>
</html>