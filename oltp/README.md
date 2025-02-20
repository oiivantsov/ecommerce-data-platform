# OLTP Module for E-Commerce Data Platform

## Overview
This module is responsible for managing the **OLTP (Online Transaction Processing) database** for an **E-Commerce website**. It includes schema design, data population, and data export for further processing in the data warehouse.

## Installation & Setup

### 1. Run MySQL and phpMyAdmin using Docker
Execute the following command to start the required services:
```sh
docker-compose up -d
```
This will start MySQL and phpMyAdmin for monitoring the database.

### 2. Database Schema
During installation, the following schema will be automatically loaded into the `sales` database with index on the `timestamp` field.

#### Create Table
```sql
CREATE TABLE IF NOT EXISTS sales_data (
    product_id INT NOT NULL,
    customer_id INT NOT NULL,
    price INT NOT NULL,
    quantity INT NOT NULL,
    timestamp DATETIME NOT NULL,
    PRIMARY KEY (product_id, customer_id)
);

CREATE INDEX idx_timestamp ON sales_data (timestamp);
```

### 3. Import Data
Use the provided script to load CSV data into the OLTP table:
```sh
./import_data.sh
```

### 4. Verify Data Import
To check if the data has been successfully loaded, run:
```sh
./check.sh
```

### 5. Backup and Export Data
To export the database with data for further processing, use:
```sh
./export_data.sh
```

## Exploring the Database
You can always connect to the MySQL service running inside Docker and explore the data:
```sh
docker exec -it <mysql_container> mysql -u<mysql_user> -p<mysql_password> -D sales
```
Replace `<mysql_container>` with the actual running container ID/name and user credentials from [docker-compose file](docker-compose.yml).

