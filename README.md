# fullstack-drinkShop-app

# Overview

This repository contains a full-stack eCommerce Drink Shop application where users can browse a variety of drinks, add them to their cart, and purchase them. Registered users receive a 10% discount on their purchases.

The application is built with Angular for the frontend, Java (Spring Boot) for the backend, and MySQL for the database. The project is divided into two main folders:

Frontend (Angular): Manages the user interface and interacts with the backend.
Backend (Java + Spring Boot): Handles business logic, user authentication, and database interaction.

# Features

Browse Products: Users can browse a list of available drinks.
Add to Cart: Users can add drinks to their shopping cart.
Discount for Registered Users: Users who register and log in receive a 10% discount on their purchases.
User Authentication: The application supports user registration and login.
Secure Payment Process.

# Tech Stack

Frontend: Angular (TypeScript, HTML, CSS)
Backend: Java (Spring Boot)
Database: MySQL
Build Tools: Maven (for backend), npm (for frontend)
Version Control: Git, GitHub

# Prerequisites

Before running the application, ensure you have the following installed:

Node.js (for the frontend)
npm (for managing Angular dependencies)
Java JDK 11 or higher (for the backend)
Maven (for building the backend)
MySQL (for the database)

# Database Setup

The application requires a MySQL database. Follow these steps to set up the database:

Log in to MySQL:
Log in to MySQL Workbench or your terminal as a user with rights to create users and databases.

Run SQL scripts:
Navigate to the sql-scripts folder in the project.

Execute the create-drinkShop-user.sql script to create a database user.

Execute the create_tables_drinkShop.sql script to create the necessary tables and relationships.

This will create the required database schema for the application.

## Backend

The backend of this application is built using Java and should be running at `http://localhost:8080`.

## Frontend

The frontend of this application is built using Angular and should be running at `http://localhost:4200`.
