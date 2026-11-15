🌍 *Leer en [Español](README-es.md)*

# 🍊 FreshJuice - Recipe Management System

![Java](https://img.shields.io/badge/Java_17-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![Spring Boot](https://img.shields.io/badge/Spring_Boot-6DB33F?style=for-the-badge&logo=spring&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white)
![JSP](https://img.shields.io/badge/JSP-007396?style=for-the-badge&logo=java&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white)

**FreshJuice** is a Full Stack Java web application designed with a modern SaaS-style architecture. It allows users to create, explore, and track healthy juice and smoothie recipes. Originally developed as part of the Full Stack Java Bootcamp by **Skillnest** and **Banco de Chile**, the project was completely refactored with a custom responsive UI, CSS variables, and server-side pagination to ensure scalability.


## ✨ Key Features

* 🔐 **Authentication**: Secure user registration and login.
* 📱 **Responsive UI**: Asymmetrical layout featuring a fixed desktop sidebar and a mobile hamburger menu. Built completely from scratch with modern CSS and Flexbox/Grid.
* 🗂️ **Server-Side Pagination**: Implemented using Spring Data JPA `Pageable` to efficiently handle large catalogs without compromising performance.
* 📝 **Recipe Management (CRUD)**: Users can add, edit, and delete their own recipes, complete with image URLs and step-by-step instructions.
* ✅ **History Tracking**: Users can mark recipes as "prepared" and view them in a dedicated history dashboard.
* 🎨 **Empty States**: Custom illustrations and messages when no recipes are found or when the user history is empty, improving UX.


## 📸 Screenshots

### Mobile Views
A fully native-like mobile experience featuring a custom responsive header, full-width forms, and an interactive sidebar menu.

| Mobile Dashboard | Hamburger Menu | Mobile Login | Mobile Register |
| :---: | :---: | :---: | :---: |
| <img src="assets/Dashboard-Mobil.png" width="220"> | <img src="assets/Menu-Mobil.png" width="220"> | <img src="assets/Mobile-Login.png" width="220"> | <img src="assets/Mobile-Register.png" width="220"> |

### Authentication
| Login | Register |
| :---: | :---: |
| <img src="assets/Login.png" width="400"> | <img src="assets/Registro.png" width="400"> |

### Dashboard & Catalog
The main catalog features server-side pagination, a search filter, and dynamic author tags.

| Dashboard | Dashboard (Created Recipes) |
| :---: | :---: |
| <img src="assets/Dashboard.png" width="400"> | <img src="assets/Dashboard-con-recetas-creadas.png" width="400"> |

### Recipe Details
Responsive grid layout that adapts perfectly from desktop to mobile, intelligently repositioning the image under the title on smaller screens.

| Standard Detail | Created Recipe (Edit/Delete) | Prepared Recipe State |
| :---: | :---: | :---: |
| <img src="assets/Detalle-Receta.png" width="260"> | <img src="assets/Detalle-Receta-Creada.png" width="260"> | <img src="assets/Detalle-Receta-Preparada.png" width="260"> |

### CRUD Operations
| Add Recipe | Edit Recipe | Delete Confirmation |
| :---: | :---: | :---: |
| <img src="assets/Agregar.png" width="260"> | <img src="assets/Editar.png" width="260"> | <img src="assets/Confirmacion-Eliminar-Receta.png" width="260"> |

### User History & Empty States
| Prepared Juices | Empty Dashboard | Empty History |
| :---: | :---: | :---: |
| <img src="assets/Preparados.png" width="260"> | <img src="assets/Empty-State-Dashboard.png" width="260"> | <img src="assets/Empty-State-Preparados.png" width="260"> |


## 🛠️ Tech Stack

* **Backend:** Java 17, Spring Boot, Spring MVC, Spring Data JPA, Hibernate, Bean Validation.
* **Frontend:** JSP, JSTL, Custom CSS3 (Variables, Flexbox, Grid), JavaScript (DOM manipulation for mobile menu).
* **Database:** MySQL.
* **Icons:** [Lucide Icons](https://lucide.dev/).


## ⚙️ Database Configuration

1. Open your MySQL manager.
2. Create the database by running:
   ```sql
   CREATE DATABASE jugos_db;
   ```
3. Verify that the `src/main/resources/application.properties` file has your local credentials:
   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/jugos_db
   spring.datasource.username=root
   spring.datasource.password=YOUR_PASSWORD
   spring.jpa.hibernate.ddl-auto=update
   ```
   *(Hibernate will create the `usuarios`, `jugos`, and `jugos_preparados` tables automatically).*

## 🏃‍♂️ Steps to run

1. Clone this repository:
   ```bash
   git clone https://github.com/CristinaTiznado/juice-recipe-manager.git
   ```
2. Navigate to the project directory:
   ```bash
   cd Jugos
   ```
3. Start the application:
   ```bash
   mvn spring-boot:run
   ```
4. Open in your browser: **`http://localhost:8080`**

## 🎯 Future Enhancements

* **Image Uploads:** Migrate from URL-based images to local storage file uploads.
* **User Profiles:** A dedicated "My Profile" section for users to manage their personal information and view their authored recipes.
* **Likes & Favorites:** Allow users to "like" recipes and easily track their favorites.
* **Recipe Collections:** Enable users to create custom lists to group recipes by type (e.g., "Summer Smoothies", "Detox Plans").

---
*Developed by **Cristina Tiznado** for portfolio display.*