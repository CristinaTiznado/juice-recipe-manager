🌍 *Read in [English](README.md)*

# 🍊 FreshJuice - Sistema de Gestión de Recetas

![Java](https://img.shields.io/badge/Java_17-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![Spring Boot](https://img.shields.io/badge/Spring_Boot-6DB33F?style=for-the-badge&logo=spring&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white)
![JSP](https://img.shields.io/badge/JSP-007396?style=for-the-badge&logo=java&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white)

**FreshJuice** es una aplicación web Full Stack en Java diseñada con una arquitectura moderna estilo SaaS. Permite a los usuarios crear, explorar y hacer seguimiento de recetas de jugos y batidos saludables. Desarrollado originalmente como parte del Bootcamp Full Stack Java de **Skillnest** y **Banco de Chile**, el proyecto fue refactorizado por completo con una interfaz responsiva personalizada, variables CSS y paginación desde el servidor para garantizar escalabilidad.


## ✨ Características Principales

* 🔐 **Autenticación**: Registro e inicio de sesión de usuarios seguro.
* 📱 **Diseño Responsivo**: Interfaz asimétrica con barra lateral fija en escritorio y menú hamburguesa en dispositivos móviles. Construido desde cero con CSS moderno, Flexbox y Grid.
* 🗂️ **Paginación desde el Servidor**: Implementada utilizando `Pageable` de Spring Data JPA para manejar grandes catálogos eficientemente sin comprometer el rendimiento.
* 📝 **Gestión de Recetas (CRUD)**: Los usuarios pueden agregar, editar y eliminar sus propias recetas, incluyendo URLs de imágenes e instrucciones paso a paso.
* ✅ **Historial (Mis Preparados)**: Los usuarios pueden marcar recetas como "preparadas" y visualizarlas en un panel de historial dedicado.
* 🎨 **Estados Vacíos**: Ilustraciones y mensajes personalizados cuando no se encuentran recetas o cuando el historial del usuario está vacío, mejorando la experiencia de usuario (UX).


## 📸 Vistas del Proyecto

### Vistas Móviles
Una experiencia móvil completamente nativa que cuenta con un encabezado responsivo personalizado, formularios de ancho completo y un menú lateral interactivo.

| Dashboard Móvil | Menú Hamburguesa | Login Móvil | Registro Móvil |
| :---: | :---: | :---: | :---: |
| <img src="assets/Dashboard-Mobil.png" width="220"> | <img src="assets/Menu-Mobil.png" width="220"> | <img src="assets/Mobile-Login.png" width="220"> | <img src="assets/Mobile-Register.png" width="220"> |

### Autenticación
| Iniciar Sesión | Registro |
| :---: | :---: |
| <img src="assets/Login.png" width="400"> | <img src="assets/Registro.png" width="400"> |

### Dashboard & Catálogo
El catálogo principal cuenta con paginación desde el servidor, filtro de búsqueda y etiquetas dinámicas de autor.

| Dashboard | Dashboard (Recetas Propias) |
| :---: | :---: |
| <img src="assets/Dashboard.png" width="400"> | <img src="assets/Dashboard-con-recetas-creadas.png" width="400"> |

### Detalle de Receta
Diseño de cuadrícula responsivo que se adapta perfectamente de escritorio a móvil, reubicando inteligentemente la imagen debajo del título en pantallas pequeñas.

| Detalle Estándar | Receta Creada (Opciones Editar/Eliminar) | Estado Receta Preparada |
| :---: | :---: | :---: |
| <img src="assets/Detalle-Receta.png" width="260"> | <img src="assets/Detalle-Receta-Creada.png" width="260"> | <img src="assets/Detalle-Receta-Preparada.png" width="260"> |

### Operaciones CRUD
| Agregar Receta | Editar Receta | Confirmar Eliminación |
| :---: | :---: | :---: |
| <img src="assets/Agregar.png" width="260"> | <img src="assets/Editar.png" width="260"> | <img src="assets/Confirmacion-Eliminar-Receta.png" width="260"> |

### Historial de Usuario & Estados Vacíos
| Jugos Preparados | Dashboard Vacío | Historial Vacío |
| :---: | :---: | :---: |
| <img src="assets/Preparados.png" width="260"> | <img src="assets/Empty-State-Dashboard.png" width="260"> | <img src="assets/Empty-State-Preparados.png" width="260"> |


## 🛠️ Tecnologías

* **Backend:** Java 17, Spring Boot, Spring MVC, Spring Data JPA, Hibernate, Bean Validation.
* **Frontend:** JSP, JSTL, CSS3 Personalizado (Variables, Flexbox, Grid), JavaScript (Manipulación del DOM para el menú móvil).
* **Base de Datos:** MySQL.
* **Íconos:** [Lucide Icons](https://lucide.dev/).


## ⚙️ Configuración de la Base de Datos

1. Abre tu gestor de MySQL.
2. Crea la base de datos ejecutando:
   ```sql
   CREATE DATABASE jugos_db;
   ```
3. Verifica que el archivo `src/main/resources/application.properties` tenga tus credenciales locales:
   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/jugos_db
   spring.datasource.username=root
   spring.datasource.password=TU_CONTRASEÑA
   spring.jpa.hibernate.ddl-auto=update
   ```
   *(Hibernate creará las tablas `usuarios`, `jugos` y `jugos_preparados` automáticamente).*

## 🏃‍♂️ Pasos para ejecutar

1. Clona este repositorio:
   ```bash
   git clone https://github.com/CristinaTiznado/juice-recipe-manager.git
   ```
2. Navega al directorio del proyecto:
   ```bash
   cd Jugos
   ```
3. Inicia la aplicación:
   ```bash
   mvn spring-boot:run
   ```
4. Abre en tu navegador: **`http://localhost:8080`**

## 🎯 Mejoras Futuras

* **Carga de Imágenes:** Migrar de imágenes basadas en URL a carga de archivos en almacenamiento local.
* **Perfiles de Usuario:** Una sección dedicada de "Mi Perfil" para que los usuarios gestionen su información personal y vean las recetas que han creado.
* **Me Gusta y Favoritos:** Permitir a los usuarios dar "me gusta" a las recetas y llevar un registro fácil de sus favoritas.
* **Colecciones de Recetas:** Permitir a los usuarios crear listas personalizadas para agrupar recetas por tipo (ej., "Batidos de Verano", "Planes Detox").

---
*Desarrollado por **Cristina Tiznado** para muestra de portafolio.*