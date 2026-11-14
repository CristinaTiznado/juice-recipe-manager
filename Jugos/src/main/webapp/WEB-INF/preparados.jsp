<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mis Preparados - FreshJuice</title>
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
                <a href="/jugos/preparados" class="nav-item active">
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
            <div style="margin-bottom: 40px;">
                <h1 style="font-size: 36px; margin: 0 0 8px 0;">Jugos Preparados</h1>
                <p style="margin: 0;">Tu historial de recetas que ya has degustado.</p>
            </div>
            
            <div class="list-view">
                <c:forEach var="jugo" items="${jugosPreparados}">
                    <article class="list-item">
                        <img src="${jugo.url}" alt="${jugo.nombre}" class="list-item-img" onerror="this.src='/img/placeholder.jpg'">
                        
                        <div class="list-item-content">
                            <div class="list-item-header">
                                <h3 class="list-item-title">${jugo.nombre}</h3>
                            </div>
                            
                            <p class="list-item-desc">${jugo.descripcion}</p>
                            
                            <div class="list-item-actions">
                                <a href="/detalle/${jugo.id}" class="btn btn-primary" style="width: auto;">
                                    <i data-lucide="eye" width="18"></i> Ver Receta
                                </a>
                                <span class="btn btn-secondary" style="background-color: var(--brand-light); color: var(--brand-dark); pointer-events: none;">
                                    <i data-lucide="check" width="18"></i> Completado
                                </span>
                            </div>
                        </div>
                    </article>
                </c:forEach>
                
                <c:if test="${empty jugosPreparados}">
                    <div style="text-align: center; padding: 60px; background: white; border-radius: var(--radius-xl); border: 1px dashed var(--border-soft);">
                        <i data-lucide="blender" width="48" height="48" style="color: var(--border-soft); margin-bottom: 16px;"></i>
                        <h3 style="margin-top: 0;">Aún no has preparado nada</h3>
                        <p>Ve al catálogo y marca un jugo como preparado para verlo aquí.</p>
                        <a href="/jugos" class="btn btn-primary" style="margin-top: 16px; width: auto;">Ir al Catálogo</a>
                    </div>
                </c:if>
            </div>
        </main>
    </div>

    <!-- SCRIPTS -->
    <script>
        lucide.createIcons();

        // Lógica del menú móvil (Hamburguesa)
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