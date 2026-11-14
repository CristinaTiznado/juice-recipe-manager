<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FreshJuice - Iniciar Sesión</title>
    <link rel="stylesheet" href="/css/style.css">
    <script src="https://unpkg.com/lucide@latest"></script>
</head>
<body>
    <div class="auth-wrapper">
        <!-- ENCABEZADO EXCLUSIVO PARA MÓVILES -->
        <div class="mobile-auth-header">
            <i data-lucide="citrus" width="32" height="32"></i> FreshJuice
        </div>

        <!-- Panel Decorativo Izquierdo -->
        <div class="auth-image-panel">
            <div style="position: relative; z-index: 10;">
                <h1 style="font-size: 48px; color: white; display: flex; align-items: center; gap: 16px;">
                    <i data-lucide="citrus" width="48" height="48"></i> FreshJuice
                </h1>
                <p style="font-size: 18px; opacity: 0.9; margin-top: 16px; font-family: 'Nunito', sans-serif;">
                    Administra tus recetas y descubre nuevas mezclas.
                </p>
            </div>
        </div>

        <!-- Panel del Formulario Derecho -->
        <div class="auth-form-panel">
            <div class="form-box">
                <h1>Hola de nuevo 👋</h1>
                <p>Ingresa a tu cuenta para continuar</p>
                
                <form:form action="/login" method="POST" modelAttribute="usuarioLogin">
                    
                    <div class="input-group">
                        <form:label path="correo">Correo electrónico</form:label>
                        <form:input type="email" path="correo" class="input-field" placeholder="tu@correo.com" />
                        <form:errors path="correo" cssStyle="color: #ef4444; font-size: 13px; margin-top: 4px; display: block;"/>
                    </div>

                    <div class="input-group">
                        <form:label path="password">Contraseña</form:label>
                        <form:input type="password" path="password" class="input-field" placeholder="••••••••" />
                        <form:errors path="password" cssStyle="color: #ef4444; font-size: 13px; margin-top: 4px; display: block;"/>
                    </div>

                    <button type="submit" class="btn btn-primary" style="margin-top: 16px;">
                        Iniciar Sesión
                    </button>
                    
                    <p style="text-align: center; margin-top: 32px; font-size: 14px;">
                        ¿No tienes una cuenta? <a href="/register" style="color: var(--brand-dark); font-weight: 700; text-decoration: none;">Regístrate aquí</a>
                    </p>
                </form:form>
            </div>
        </div>
    </div>
    <script>lucide.createIcons();</script>
</body>
</html>