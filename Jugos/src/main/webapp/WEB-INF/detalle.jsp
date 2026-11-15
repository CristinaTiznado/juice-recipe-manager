<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalle - ${jugo.nombre}</title>
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
                <a href="/formulario/agregar" class="nav-item">
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
                <a href="/jugos" style="color: var(--text-body); text-decoration: none; display: inline-flex; align-items: center; gap: 8px; font-weight: 600;">
                    <i data-lucide="arrow-left" width="18"></i> Volver al catálogo
                </a>
            </div>

            <div class="detail-card">
                <!-- ÁREA 1: Encabezado -->
                <div class="detail-header">
                    <span class="author-tag" style="margin-bottom: 16px;">
                        <i data-lucide="user" width="14"></i> Receta de ${jugo.creador.nombre} ${jugo.creador.apellido}
                    </span>
                    <h1 style="font-size: 36px; margin: 0;">${jugo.nombre}</h1>
                </div>
                
                <!-- ÁREA 2: Imagen -->
                <div class="detail-image">
                    <img src="${jugo.url}" alt="${jugo.nombre}" class="detail-img" onerror="this.src='/img/placeholder.jpg'">
                </div>
                
                <!-- ÁREA 3: Contenido y Botones -->
                <div class="detail-body">
                    <div class="content-section">
                        <h4>Descripción</h4>
                        <p>${jugo.descripcion}</p>
                    </div>
                    
                    <div class="content-section">
                        <h4>Ingredientes</h4>
                        <p>${jugo.ingredientes}</p>
                    </div>
                    
                    <div class="content-section">
                        <h4>Instrucciones paso a paso</h4>
                        <p>${jugo.instrucciones}</p>
                    </div>
                    
                    <!-- Botones Corregidos -->
                    <div class="form-actions" style="margin-top: 32px; padding-top: 24px; border-top: 1px solid var(--border-soft);">
                        <c:choose>
                            <c:when test="${yaPreparado}">
                                <button class="btn btn-secondary" disabled style="background-color: var(--brand-light); color: var(--brand-dark); opacity: 1; border: none; width: 100%; justify-content: center;">
                                    <i data-lucide="check" width="18"></i> Ya preparado
                                </button>
                            </c:when>
                            <c:otherwise>
                                <!-- Se agregó 'display: flex' al form para que el botón se centre perfecto -->
                                <form id="form-preparar" action="/preparar/${jugo.id}" method="GET" style="margin: 0; width: 100%; display: flex;">
                                    <button type="submit" class="btn btn-primary" style="width: 100%; justify-content: center;">
                                        <i data-lucide="blender" width="18"></i> Preparar
                                    </button>
                                </form>
                            </c:otherwise>
                        </c:choose>

                        <c:if test="${jugo.creador.id == usuarioLogueado.id}">
                            <a href="/formulario/editar/${jugo.id}" class="btn btn-outline" style="width: 100%; justify-content: center;">
                                <i data-lucide="edit" width="18"></i> Editar
                            </a>
                        </c:if>
                    </div>
                </div>
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
    <script src="/js/preparar.js"></script>
</body>
</html>