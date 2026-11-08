🌍 Leer en [Español](README-es.md)*

# 🍹 Juices - Recipe Management System

> *Project developed as a certification exam for the Full Stack Java Bootcamp taught by Skillnest and sponsored by Banco de Chile.*

## 📝 Brief Description

This Full Stack web application developed in **Spring Boot** (MVC architecture) allows users to manage and share juice recipes. The platform features an authentication system where registered users can publish their own recipes, search for juices using specific filters, and keep a personal record of the recipes they have "prepared".

## 🚀 Main Features

- **Authentication and Security:** Secure registration and login. Passwords are encrypted using BCrypt. Views and routes are protected through active session validation.
- **Recipe Management (CRUD):** Users can create, view, edit, and delete their own juice recipes. Each recipe includes a description, ingredients, detailed instructions, and an image.
- **Dynamic Search:** Built-in search engine that allows filtering the complete list of juices based on a specific ingredient.
- **Preparation Tracking:** Transactional logic that allows users to mark a juice as "prepared". These recipes are saved in a personal record (*Prepared Juices* view), managing a *Many-To-Many* database relationship.
- **Data Validation (Backend):** Strict use of Jakarta Validation (`@Valid`, `@NotBlank`, `@Size`, `@Pattern`) to ensure data integrity (valid image URLs, unique emails, matching passwords, and minimum lengths for instructions).

## 🛠️ Tech Stack

- **Backend:** Java 17, Spring Boot (Web, Data JPA, Validation).
- **Database:** MySQL, Hibernate (Spring Data JPA).
- **Frontend:** JSP (JavaServer Pages), JSTL, HTML5, CSS3.
- **Security:** jBcrypt.
- **Dependency Manager:** Maven.

## 📋 Requirements

To run this project locally, you need:
- **Java Development Kit (JDK)** 17 or higher.
- **Maven**.
- **MySQL Server**.

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
   git clone https://github.com/CristinaTiznado/ExamenJugos.git
   ```
2. Navigate to the project directory:
   ```bash
   cd Jugos
   ```
3. Install dependencies and compile:
   ```bash
   mvn clean install
   ```
4. Start the application:
   ```bash
   mvn spring-boot:run
   ```
5. Open in your browser: **`http://localhost:8080`**

## 💡 App Usage

1. **Registration:** Create an account or log in.
2. **Explore and Filter:** Go to `/jugos` to see all recipes. Use the search bar to filter by an ingredient (e.g., "apple").
3. **Publish:** Go to "Add juice" and fill out the form with your recipe's instructions.
4. **Prepare:** Enter the details of a juice created by another user and click "Prepare" to save it to your history.
5. **My History:** Review your preparations in the "Prepared Juices" section.
