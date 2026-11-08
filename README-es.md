# 🍹 Jugos - Sistema de Gestión de Recetas

> *Proyecto desarrollado como examen de certificación para el Bootcamp Full Stack Java impartido por Skillnest y patrocinado por Banco de Chile.*

## 📝 Descripción Breve

Esta aplicación web Full Stack desarrollada en **Spring Boot** (arquitectura MVC) permite a los usuarios gestionar y compartir recetas de jugos. La plataforma cuenta con un sistema de autenticación donde los usuarios registrados pueden publicar sus propias recetas, buscar jugos mediante filtros específicos y mantener un registro personal de las recetas que han "preparado".

## 🚀 Funcionalidades Principales

* **Autenticación y Seguridad:** Registro e inicio de sesión seguros. Las contraseñas están encriptadas usando BCrypt. Las vistas y rutas están protegidas mediante validación de sesión activa.
* **Gestión de Recetas (CRUD):** Los usuarios pueden crear, visualizar, editar y eliminar sus propias recetas de jugos. Cada receta incluye descripción, ingredientes, instrucciones detalladas y una imagen.
* **Búsqueda Dinámica:** Motor de búsqueda integrado que permite filtrar la lista completa de jugos basándose en un ingrediente específico.
* **Seguimiento de Preparaciones:** Lógica transaccional que permite a los usuarios marcar un jugo como "preparado". Estas recetas se guardan en un registro personal (vista de *Jugos Preparados*), manejando una relación de base de datos *Many-To-Many*.
* **Validación de Datos (Backend):** Uso estricto de Jakarta Validation (`@Valid`, `@NotBlank`, `@Size`, `@Pattern`) para garantizar la integridad de los datos (URLs de imágenes válidas, correos únicos, contraseñas coincidentes y longitudes mínimas en las instrucciones).

## 🛠️ Stack Tecnológico

* **Backend:** Java 17, Spring Boot (Web, Data JPA, Validation).
* **Base de Datos:** MySQL, Hibernate (Spring Data JPA).
* **Frontend:** JSP (JavaServer Pages), JSTL, HTML5, CSS3.
* **Seguridad:** jBcrypt.
* **Gestor de Dependencias:** Maven.

## 📋 Requisitos

Para correr este proyecto en local, necesitas:
* **Java Development Kit (JDK)** 17 o superior.
* **Maven**.
* **MySQL Server**.

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
   spring.datasource.password=TU_PASSWORD
   spring.jpa.hibernate.ddl-auto=update
   ```
   *(Hibernate creará las tablas `usuarios`, `jugos` y `jugos_preparados` automáticamente).*

## 🏃‍♂️ Pasos para ejecutar

1. Clona este repositorio:
   ```bash
   git clone https://github.com/CristinaTiznado/ExamenJugos.git
   ```
2. Navega al directorio del proyecto:
   ```bash
   cd Jugos
   ```
3. Instala las dependencias y compila:
   ```bash
   mvn clean install
   ```
4. Inicia la aplicación:
   ```bash
   mvn spring-boot:run
   ```
5. Abre en tu navegador: **`http://localhost:8080`**

## 💡 Uso de la App

1. **Registro:** Crea una cuenta o inicia sesión.
2. **Explorar y Filtrar:** Ve a `/jugos` para ver todas las recetas. Usa la barra de búsqueda para filtrar por un ingrediente (ej: "manzana").
3. **Publicar:** Ve a "Agregar jugo" y completa el formulario con las instrucciones de tu receta.
4. **Preparar:** Entra al detalle de un jugo creado por otro usuario y haz clic en "Preparar" para guardarlo en tu historial.
5. **Mi Historial:** Revisa tus preparaciones en la sección de "Jugos Preparados".
