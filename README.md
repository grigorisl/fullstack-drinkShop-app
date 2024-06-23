# fullstack-drinkShop-app

This repository contains a full-stack application with separate folders for the frontend (Angular) and backend (Java).
Τhe user must login to MySQL Workbence as a local instance to be able to create another user.

## Database Setup

1. In the `sql-scripts` folder, the `create-drinkShop-user.sql` file contains the name and password of the database user.
2. In the same folder, the `create_tables_drinkShop.sql` file contains the SQL commands to create the tables and relationships for the database.
3. If the user runs these two files, the application database is created.

### Steps to Set Up the Database

1. **Log in to MySQL Workbench as a local instance.**
2. **Run the `create-drinkShop-user.sql` script to create the database user:**
3. **Run the `create_tables_drinkShop.sql` script to create the tables and relationships:**

## Backend

The backend of this application is built using Java and should be running at `http://localhost:8080`.

## Frontend

The frontend of this application is built using Angular and should be running at `http://localhost:4200`.
