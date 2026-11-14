<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro - FreshJuice</title>
    <link rel="stylesheet" href="/css/style.css">
    <script src="https://unpkg.com/lucide@latest"></script>
</head>
<body>
    <div class="auth-wrapper">
        <!-- ENCABEZADO EXCLUSIVO PARA MÓVILES -->
        <div class="mobile-auth-header">
            <i data-lucide="citrus" width="32" height="32"></i> FreshJuice
        </div>

        <!-- Panel Decorativo -->
        <div class="auth-image-panel">
            <div style="position: relative; z-index: 10;">
                <h1 style="font-size: 48px; color: white; display: flex; align-items: center; gap: 16px;">
                    <i data-lucide="citrus" width="48" height="48"></i> FreshJuice
                </h1>
                <p style="font-size: 18px; opacity: 0.9; margin-top: 16px; font-family: 'Nunito', sans-serif;">
                    Únete a la comunidad y comparte tus mejores mezclas de jugos con el mundo.
                </p>
            </div>
        </div>

        <!-- Formulario de Registro -->
        <div class="auth-form-panel">
            <div class="form-box">
                <h1>Crear cuenta</h1>
                <p>Completa tus datos para comenzar</p>
                
                <form:form action="/register" method="POST" modelAttribute="usuario">
                    
                    <div style="display: flex; gap: 16px;">
                        <div class="input-group" style="flex: 1;">
                            <form:label path="nombre">Nombre</form:label>
                            <form:input type="text" path="nombre" class="input-field" placeholder="Tu nombre" />
                            <form:errors path="nombre" cssStyle="color: #ef4444; font-size: 13px; margin-top: 4px; display: block;"/>
                        </div>
                        <div class="input-group" style="flex: 1;">
                            <form:label path="apellido">Apellido</form:label>
                            <form:input type="text" path="apellido" class="input-field" placeholder="Tu apellido" />
                            <form:errors path="apellido" cssStyle="color: #ef4444; font-size: 13px; margin-top: 4px; display: block;"/>
                        </div>
                    </div>

                    <div class="input-group">
                        <form:label path="correo">Correo electrónico</form:label>
                        <form:input type="email" path="correo" class="input-field" placeholder="ejemplo@correo.com" />
                        <form:errors path="correo" cssStyle="color: #ef4444; font-size: 13px; margin-top: 4px; display: block;"/>
                    </div>

                    <div class="input-group">
                        <form:label path="password">Contraseña</form:label>
                        <form:input type="password" path="password" class="input-field" placeholder="Crea una contraseña" />
                        <form:errors path="password" cssStyle="color: #ef4444; font-size: 13px; margin-top: 4px; display: block;"/>
                    </div>

                    <div class="input-group">
                        <form:label path="confirmarPassword">Confirmar contraseña</form:label>
                        <form:input type="password" path="confirmarPassword" class="input-field" placeholder="Repite tu contraseña" />
                        <form:errors path="confirmarPassword" cssStyle="color: #ef4444; font-size: 13px; margin-top: 4px; display: block;"/>
                    </div>

                    <button type="submit" class="btn btn-primary" style="margin-top: 8px;">
                        <i data-lucide="user-plus" width="18"></i> Registrarse
                    </button>
                    
                    <p style="text-align: center; margin-top: 24px; font-size: 14px;">
                        ¿Ya tienes una cuenta? <a href="/" style="color: var(--brand-dark); font-weight: 700; text-decoration: none;">Inicia sesión</a>
                    </p>
                </form:form>
            </div>
        </div>
    </div>
    <script>lucide.createIcons();</script>
</body>
</html>