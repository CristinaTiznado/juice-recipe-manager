<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nueva Receta - FreshJuice</title>
    <link rel="stylesheet" href="/css/style.css">
    <script src="https://unpkg.com/lucide@latest"></script>
</head>
<body>
    <!-- HEADER MÓVIL (Solo visible en pantallas pequeñas) -->
    <header class="mobile-header">
        <a href="/jugos" class="brand-logo-mobile">
            <i data-lucide="citrus" stroke-width="2.5"></i> FreshJuice
        </a>
        <button id="menu-toggle" class="btn-icon">
            <i data-lucide="menu" width="28" height="28"></i>
        </button>
    </header>

    <!-- FONDO OSCURO PARA EL MENÚ MÓVIL -->
    <div id="sidebar-overlay" class="sidebar-overlay"></div>

    <div class="app-container">
        <!-- Sidebar Navigation -->
        <aside class="sidebar">
            <a href="/jugos" class="brand-logo">
                <i data-lucide="citrus" stroke-width="2.5"></i> FreshJuice
            </a>
            
            <nav class="nav-menu">
                <a href="/jugos" class="nav-item">
                    <i data-lucide="library"></i> Catálogo
                </a>
                <a href="/jugos/preparados" class="nav-item">
                    <i data-lucide="check-square"></i> Mis Preparados
                </a>
                <a href="/formulario/agregar" class="nav-item active">
                    <i data-lucide="plus-circle"></i> Nueva Receta
                </a>
            </nav>
            
            <div class="nav-footer">
                <a href="/logout" class="nav-item" style="color: #ef4444;">
                    <i data-lucide="log-out"></i> Cerrar Sesión
                </a>
            </div>
        </aside>

        <!-- Main Content Area -->
        <main class="main-area">
            <div style="margin-bottom: 32px;">
                <h1 style="font-size: 36px; margin: 0 0 8px 0;">Agregar nueva receta</h1>
                <p style="margin: 0;">Comparte tu mejor mezcla con la comunidad.</p>
            </div>

            <!-- Formulario en tarjeta ancha -->
            <div style="background: var(--surface); border-radius: var(--radius-xl); padding: 40px; box-shadow: var(--shadow-soft); max-width: 700px;">
                
                <form:form action="/agregar" method="POST" modelAttribute="jugo">
                    
                    <div class="input-group">
                        <form:label path="nombre">Nombre del jugo</form:label>
                        <form:input type="text" path="nombre" class="input-field" placeholder="Ej. Jugo Verde Detox" />
                        <form:errors path="nombre" cssStyle="color: #ef4444; font-size: 13px; margin-top: 4px; display: block;"/>
                    </div>

                    <div class="input-group">
                        <form:label path="descripcion">Breve descripción</form:label>
                        <form:textarea path="descripcion" class="input-field" rows="3" placeholder="¿Para qué es bueno este jugo?" />
                        <form:errors path="descripcion" cssStyle="color: #ef4444; font-size: 13px; margin-top: 4px; display: block;"/>
                    </div>

                    <div class="input-group">
                        <form:label path="ingredientes">Ingredientes principales</form:label>
                        <form:textarea path="ingredientes" class="input-field" rows="3" placeholder="Ej. 2 Manzanas, 1 Apio, 1 trozo de jengibre..." />
                        <form:errors path="ingredientes" cssStyle="color: #ef4444; font-size: 13px; margin-top: 4px; display: block;"/>
                    </div>

                    <div class="input-group">
                        <form:label path="instrucciones">Instrucciones de preparación</form:label>
                        <form:textarea path="instrucciones" class="input-field" rows="4" placeholder="Paso a paso para prepararlo..." />
                        <form:errors path="instrucciones" cssStyle="color: #ef4444; font-size: 13px; margin-top: 4px; display: block;"/>
                    </div>

                    <div class="input-group" style="margin-bottom: 32px;">
                        <form:label path="url">URL de la imagen</form:label>
                        <form:input type="text" path="url" class="input-field" placeholder="https://ejemplo.com/imagen.jpg" />
                        <form:errors path="url" cssStyle="color: #ef4444; font-size: 13px; margin-top: 4px; display: block;"/>
                    </div>

                    <div class="form-actions">
                        <button type="submit" class="btn btn-primary">
                            <i data-lucide="save" width="18"></i> Guardar Receta
                        </button>
                        <a href="/jugos" class="btn btn-outline">Cancelar</a>
                    </div>
                </form:form>
            </div>
        </main>
    </div>
    <script>
        lucide.createIcons();

        document.addEventListener('DOMContentLoaded', () => {
            const menuToggle = document.getElementById('menu-toggle');
            const sidebar = document.querySelector('.sidebar');
            const overlay = document.getElementById('sidebar-overlay');

            if(menuToggle && sidebar && overlay) {
                menuToggle.addEventListener('click', () => {
                    sidebar.classList.add('open');
                    overlay.classList.add('open');
                });

                overlay.addEventListener('click', () => {
                    sidebar.classList.remove('open');
                    overlay.classList.remove('open');
                });
            }
        });
    </script>
</body>
</html>