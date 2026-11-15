🌍 *Leer en [Español](README-es.md)*

# 🍊 FreshJuice - Recipe Management System

![Java](https://img.shields.io/badge/Java_17-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![Spring Boot](https://img.shields.io/badge/Spring_Boot-6DB33F?style=for-the-badge&logo=spring&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white)
![JSP](https://img.shields.io/badge/JSP-007396?style=for-the-badge&logo=java&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white)

**FreshJuice** is a Full Stack Java web application designed with a modern SaaS-style architecture. It allows users to create, explore, and save healthy juice and smoothie recipes. Originally developed as part of the Full Stack Java Bootcamp by **Skillnest** and **Banco de Chile**, the project was completely refactored with a custom responsive UI, CSS variables, and server-side pagination to ensure scalability.


## ✨ Key Features

* 🔐 **Authentication**: Secure user registration and login.
* 📱 **Responsive UI**: Asymmetrical layout featuring a fixed desktop sidebar and a mobile hamburger menu. Built completely from scratch with modern CSS and Flexbox/Grid.
* 🗂️ **Server-Side Pagination**: Implemented using Spring Data JPA `Pageable` to efficiently handle large catalogs without compromising performance.
* 📝 **Recipe Management (CRUD)**: Users can add, edit, and delete their own recipes, complete with image URLs and step-by-step instructions.
* ✅ **History Tracking**: Users can mark recipes as "prepared" and view them in a dedicated history dashboard.
* 🎨 **Empty States**: Custom illustrations and messages when no recipes are found or when the user history is empty, improving UX.


## 📸 Project Demos

See FreshJuice in action! Below are the full navigation flows for both Desktop and Mobile interfaces, including user authentication, catalog pagination, and CRUD operations.

*Desktop Experience*<br>

https://github.com/user-attachments/assets/e9f8e21d-1216-4c16-99ad-b773b00d11b3

<br>

*Mobile Experience*<br>

https://github.com/user-attachments/assets/6a46ebc3-1ccf-4793-9536-a1609d7afd46

### Empty States
Custom illustrations and messages when no recipes are found or when the user history is empty, improving UX.

*Empty Dashboard*<br>
<img src="assets/Empty-State-Dashboard.png" width="260">

*Empty History*<br>
<img src="assets/Empty-State-Preparados.png" width="260">

*Empty Dashboard Mobile Version*<br>
<img src="assets/Empty-State-Dashboard-Mobil.png" width="260">

*Empty History Mobile Version*<br>
<img src="assets/Empty-State-Preparados-Mobil.png" width="260">


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
* * **History Management:** Allow users to remove recipes directly from their "Prepared" history list.

---
*Developed by **Cristina Tiznado** for portfolio display.*
