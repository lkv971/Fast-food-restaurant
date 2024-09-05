# Fast Food Restaurant 

## Overview

This repository contains all the necessary files and scripts to manage, transform, and analyze data for a fast-food restaurant chain. The project encompasses various aspects of data management, including raw data handling, database management, ELT (Extract, Load, Transform) processes, data transformation, backups, and reporting. The repository is organized into several folders, each serving a specific purpose in the overall data management and analytics workflow.

## Folder Structure

### 1. `raw data/`
This folder contains the raw data files used for the initial data ingestion into the SQL Server database. These files are in CSV format and include:
- `ingredients.csv`: Information about the ingredients used in menu items.
- `menu_items.csv`: Details of menu items offered at the restaurant.
- `menuitem.csv`: Additional data on menu items.
- `portion_uom_types.csv`: Defines the unit of measurement types used for portions.
- `pos_ordersale.csv`: Point-of-sale order and sales data.
- `recipes.csv`: Recipes for menu items.
- `store_restaurant.csv`: Data related to store locations.
- `sub_recipe_ingr_assignments.csv`: Assignment of ingredients to sub-recipes.
- `sub_recipes.csv`: Details of sub-recipes used in main recipes.

### 2. `rdbms scripts/`
This folder contains SQL scripts for managing the relational database management system (RDBMS) in SQL Server:
- `create_db_tables.sql`: Script to create the necessary database tables.
- `insert_data.sql`: Script to insert data into the database tables.
- `triggers.sql`: Script to create triggers for various database operations.

### 3. `sql server jobs/`
This folder contains SQL scripts to automate database maintenance tasks via SQL Server jobs:
- `daily_data_insert_fastfood_db.sql`: Script for daily data insertion into the database.
- `differential_daily_fastfood_backup.sql`: Script to perform a daily differential backup of the database.
- `full_weekly_backup_fastfood.sql`: Script to perform a full weekly backup of the database.

### 4. `database/`
This folder contains a single file related to the overall database schema:
- `FastFoodDB.sql`: Script to create the complete Fast Food Database, including tables, views, and stored procedures.

### 5. `ELT Transformation notebooks/`
This folder contains a Jupyter notebook for data transformation using PySpark:
- `FastFoodRestaurantTransformation.ipynb`: Notebook that transforms the ingested data from SQL Server to a Microsoft Fabric lakehouse. The transformed data is then loaded into both a Microsoft Fabric warehouse and the lakehouse.

### 6. `ELT Pipeline diagrams/`
This folder contains a diagram that illustrates the ELT pipeline:
- `fast_food_pipeline.png`: A screenshot depicting the data flow from SQL Server to the Microsoft Fabric lakehouse, where it is transformed using PySpark and subsequently loaded into the warehouse and lakehouse.

### 7. `warehouse/`
This folder contains SQL scripts related to the data warehouse:
- `scripts.sql`: Contains SQL scripts used in the Microsoft Fabric warehouse for data querying and management.

### 8. `powerbi reports/`
This folder contains Power BI reports that provide visual analytics on the fast-food restaurant's sales data:
- `Fast Food sales report.pbix`: The Power BI Desktop file with interactive visuals.
- `Fast Food sales report.pdf`: A PDF version of the Power BI report, containing the same visuals.

## How to Use This Repository

1. **Database Setup**:
   - Use the scripts in the `rdbms scripts/` folder to create and populate the SQL Server database.
   - Run `create_db_tables.sql` to create the necessary tables.
   - Run `insert_data.sql` to insert the initial data from the `raw data/` folder.
   - Optionally, set up triggers using `triggers.sql`.

2. **Database Maintenance**:
   - Schedule SQL Server jobs using the scripts in the `sql server jobs/` folder to automate daily data insertion and backups.

3. **Data Transformation**:
   - Open and run the `FastFoodRestaurantTransformation.ipynb` notebook in the `ELT Transformation notebooks/` folder. This notebook ingests data from SQL Server, transforms it using PySpark, and loads it into the Microsoft Fabric lakehouse and warehouse.

4. **Reporting**:
   - Use the Power BI report files in the `powerbi reports/` folder to analyze the sales data. The `.pbix` file can be opened with Power BI Desktop, and the `.pdf` file provides a non-interactive version of the report.

## ELT Pipeline Diagram

Refer to the `fast_food_pipeline.png` file in the `ELT Pipeline diagrams/` folder to understand the data flow and transformation process from ingestion to reporting.