# ETL Data Migration Module

## Overview
This module implements an ETL pipeline using Python to **extract, transform, and load** data from an **OLTP MySQL database** to a **PostgreSQL Data Warehouse**. The main goal is to synchronize old data in the Data Warehouse with new updates from the OLTP database.

---

## **Setup & Running the Environment**

1. **Start the required services** using Docker Compose:
   ```sh
   docker-compose up -d
   ```
   This will launch:
   - **MySQL (OLTP)** – Source transactional database.
   - **PostgreSQL (Data Warehouse)** – Destination database.
   - **Python container** – Runs the ETL pipeline.

2. **Verify Initial Data Load**
   - During Docker setup, **data is automatically loaded into MySQL**.
   - Run the following script to create tables and load initial data into **PostgreSQL**:
     ```sh
     ./table_and_data_psql.sh
     ```

---

## **Exploring Initial Data**

### **1 - Connect to Databases**
- **Connect to MySQL:**
  ```sh
  ./mysql_connect.sh
  ```
- **Connect to PostgreSQL:**
  ```sh
  ./psql_connect.sh
  ```

### **2 - Verify Database Connections from Python**
Once inside the **Python container**, test database connectivity:
```sh
./python_connect.sh
python mysqlconnect.py  # Test MySQL connection
python postgresqlconnect.py  # Test PostgreSQL connection
```
These scripts will be automatically available in the Python container.

---

## **Running the ETL Pipeline**

To migrate data from **MySQL (OLTP) → PostgreSQL (Data Warehouse)**, run:
```sh
python automation.py
```

### **What Happens During Migration?**
✅ Extracts **new transactional data** from MySQL.  
✅ Transforms the data to match the Data Warehouse schema.  
✅ Loads the transformed data into PostgreSQL.  
✅ Ensures **MySQL and PostgreSQL are synchronized**.

---

## **Monitoring & Debugging**

- Check MySQL logs:
  ```sh
  docker logs <mysql_container_id>
  ```
- Check PostgreSQL logs:
  ```sh
  docker logs <postgres_container_id>
  ```
- Check Python ETL logs:
  ```sh
  docker logs <python_container_id>
  ```
