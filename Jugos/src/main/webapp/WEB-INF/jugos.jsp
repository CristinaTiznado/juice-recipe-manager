<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catálogo - FreshJuice</title>
    <link rel="stylesheet" href="/css/style.css">
    <!-- Iconos modernos Lucide -->
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
        <!-- BARRA LATERAL (Sidebar) -->
        <aside class="sidebar">
            <a href="/jugos" class="brand-logo">
                <i data-lucide="citrus" stroke-width="2.5"></i> FreshJuice
            </a>
            
            <nav class="nav-menu">
                <a href="/jugos" class="nav-item active">
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

        <!-- CONTENIDO PRINCIPAL -->
        <main class="main-area">
            <div style="display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 40px; flex-wrap: wrap; gap: 16px;">
                <div>
                    <h1 style="font-size: 36px; margin: 0 0 8px 0;">Recetas Disponibles</h1>
                    <p style="margin: 0;">¡Hola de nuevo, ${usuarioLogueado.nombre}! Descubre lo que la comunidad ha mezclado.</p>
                </div>
                
                <!-- Buscador -->
                <form action="/jugos" method="GET" style="display: flex; gap: 8px;">
                    <input type="text" name="filtro" value="${filtroBusqueda}" class="input-field" placeholder="Buscar ingrediente..." style="width: 250px;">
                    <button type="submit" class="btn btn-primary" style="width: auto; padding: 10px 16px;">
                        <i data-lucide="search" width="18"></i>
                    </button>
                    <c:if test="${not empty filtroBusqueda}">
                        <a href="/jugos" class="btn btn-outline" style="padding: 10px 16px;">Limpiar</a>
                    </c:if>
                </form>
            </div>
            
            <!-- CATÁLOGO (List View) -->
            <div class="list-view">
                <c:forEach var="jugo" items="${listaJugos}">
                    <article class="list-item">
                        <img src="${jugo.url}" alt="${jugo.nombre}" class="list-item-img" onerror="this.src='/img/placeholder.jpg'">
                        
                        <div class="list-item-content">
                            <div class="list-item-header">
                                <h3 class="list-item-title">${jugo.nombre}</h3>
                                <span class="author-tag">
                                    <i data-lucide="user" width="14"></i> ${jugo.creador.nombre}
                                </span>
                            </div>
                            
                            <p class="list-item-desc">${jugo.descripcion}</p>
                            
                            <div class="list-item-actions">
                                <a href="/detalle/${jugo.id}" class="btn btn-primary" style="width: auto;">Ver Receta</a>
                                
                                <c:if test="${jugo.creador.id == usuarioLogueado.id}">
                                    <form action="/eliminar/${jugo.id}" method="POST" onsubmit="return confirm('¿Estás seguro de eliminar esta receta?');" style="margin: 0;">
                                        <input type="hidden" name="_method" value="DELETE"/>
                                        <button type="submit" class="btn btn-outline" style="color: #ef4444; border-color: #fca5a5;">
                                            <i data-lucide="trash-2" width="18"></i>
                                        </button>
                                    </form>
                                </c:if>
                            </div>
                        </div>
                    </article>
                </c:forEach>
                
                <!-- Mensaje cuando no hay resultados -->
                <c:if test="${empty listaJugos}">
                    <div style="text-align: center; padding: 60px; background: white; border-radius: var(--radius-xl); border: 1px dashed var(--border-soft);">
                        <i data-lucide="grape" width="48" height="48" style="color: var(--border-soft); margin-bottom: 16px;"></i>
                        <h3 style="margin-top: 0;">No hay jugos por aquí</h3>
                        <p>Intenta buscar otra cosa o crea una receta nueva.</p>
                    </div>
                </c:if>
            </div>

            <!-- INTERFAZ DE PAGINACIÓN (Sticky) -->
            <c:if test="${totalPages > 1}">
                <div class="pagination">
                    
                    <!-- Botón Anterior -->
                    <c:choose>
                        <c:when test="${currentPage > 0}">
                            <a href="/jugos?page=${currentPage - 1}${not empty filtroBusqueda ? '&filtro='.concat(filtroBusqueda) : ''}" class="page-link">
                                <i data-lucide="chevron-left" width="18"></i> Anterior
                            </a>
                        </c:when>
                        <c:otherwise>
                            <span class="page-link disabled"><i data-lucide="chevron-left" width="18"></i> Anterior</span>
                        </c:otherwise>
                    </c:choose>

                    <!-- Números de Página central -->
                    <div class="page-numbers">
                        <c:forEach begin="0" end="${totalPages - 1}" var="i">
                            <a href="/jugos?page=${i}${not empty filtroBusqueda ? '&filtro='.concat(filtroBusqueda) : ''}" 
                               class="page-link ${currentPage == i ? 'active' : ''}">
                                ${i + 1}
                            </a>
                        </c:forEach>
                    </div>

                    <!-- Botón Siguiente -->
                    <c:choose>
                        <c:when test="${currentPage < totalPages - 1}">
                            <a href="/jugos?page=${currentPage + 1}${not empty filtroBusqueda ? '&filtro='.concat(filtroBusqueda) : ''}" class="page-link">
                                Siguiente <i data-lucide="chevron-right" width="18"></i>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <span class="page-link disabled">Siguiente <i data-lucide="chevron-right" width="18"></i></span>
                        </c:otherwise>
                    </c:choose>
                    
                </div>
            </c:if>

        </main>
    </div>

    <!-- SCRIPTS -->
    <script>
        // Inicializar iconos de Lucide
        lucide.createIcons();

        // Lógica del menú móvil (Hamburguesa)
        document.addEventListener('DOMContentLoaded', () => {
            const menuToggle = document.getElementById('menu-toggle');
            const sidebar = document.querySelector('.sidebar');
            const overlay = document.getElementById('sidebar-overlay');

            if(menuToggle && sidebar && overlay) {
                // Abrir menú
                menuToggle.addEventListener('click', () => {
                    sidebar.classList.add('open');
                    overlay.classList.add('open');
                });

                // Cerrar menú al hacer clic en el fondo oscuro
                overlay.addEventListener('click', () => {
                    sidebar.classList.remove('open');
                    overlay.classList.remove('open');
                });
            }
        });
    </script>
</body>
</html>