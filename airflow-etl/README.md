# ETL Pipeline Using Apache Airflow

## Overview
This module sets up **Apache Airflow** to create, run, and monitor a **data pipeline** that processes **web server logs** and persist the transformed data for futher processing.

---

## **Setup & Installation**

### **1 - Generate & Configure Fernet Key**
Before running Airflow, you need a **Fernet key** to encrypt sensitive data. You can:
- **Generate a Fernet key** using Python:
  ```sh
  python fernet_key.py
  ```
- Add the **Fernet key** to `docker-compose.yml` under:
  ```yaml
  environment:
    - AIRFLOW__CORE__FERNET_KEY=YOUR_GENERATED_KEY_HERE
  ```
- or you can use a dummy key for testing (already included in `docker-compose.yml`).


### **2 - Set Up Environment Variables**
Run the following command to set ownership for Airflow:
```sh
./ownership.sh
```
This ensures correct file permissions inside the containers.

---

## **Start Airflow Services**

### **1 - Initialize Airflow Database & Create a User**
Run the following command **before starting Airflow**:
```sh
docker-compose up airflow-init
```
This initializes the database and creates an **admin user** for Airflow.

### **2️ - Start Airflow Services**
After initialization, start the services:
```sh
docker-compose up -d
```
This will launch:
- **PostgreSQL** – Airflow metadata database.
- **Airflow Webserver** – UI for managing DAGs.
- **Airflow Scheduler** – Executes scheduled tasks.

---

## **Running a DAG**

### **1️ - Access the Airflow UI**
- Open a browser and go to **http://localhost:8080**.
- Log in with the default credentials:
  ```
  Username: airflow
  Password: airflow
  ```
- Navigate to **DAGs** and trigger the [`process_web_log` DAG](./dags/process_web_log.py).

### **2️ - Check for New DAG Files**
Staging area with result data should be available in [staging area - dags/capstone folder](./dags/capstone/):
```sh
./dags/capstone/
```
If permission issues occur, run:
```sh
chmod -R 777 ./dags ./logs
```

Note: This repository already contains initial and processed files in the [staging area](./dags/capstone/), so you don't need to delete these files as they will be automatically replaced once the DAG completes.

---

## **Troubleshooting**

### **1️ - Check Running Containers**
```sh
docker ps
```

### **2️ - View Logs for Debugging**
- **PostgreSQL Logs:**
  ```sh
  docker logs airflow-postgres
  ```
- **Airflow Scheduler Logs:**
  ```sh
  docker logs airflow-scheduler
  ```
- **Airflow Webserver Logs:**
  ```sh
  docker logs airflow-webserver
  ```

### **3️ - Restarting Airflow Services**
If needed, restart all services:
```sh
docker-compose down
docker-compose up -d
```
