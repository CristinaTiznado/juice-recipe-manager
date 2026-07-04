<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
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
        <h1>Login</h1>
        <form:form action="/login" method="POST" modelAttribute="usuarioLogin">
            
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

            <button type="submit" class="btn-primary btn-block">Login</button>
        </form:form>
    </div>
</body>
</html>