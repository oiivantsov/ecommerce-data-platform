# Spark Module for Search Term Analysis & Sales Prediction

## Overview
This module leverages **Apache Spark with PySpark** to analyze popular search terms from company's web service and use a regression model to predict next year's sales. Spark runs in **local mode** by default, but the module is scalable and can be extended for distributed processing by adding nodes.

---

## **Setup & Running the Environment**

### **1️ - Start the Spark Environment**
Run the following command to launch the **Jupyter/PySpark Notebook container**:
```sh
docker-compose up -d
```
All Jupyter notebooks are automatically mounted into the container.

### **2️ - Access Jupyter Notebooks**
Once the container is running, find the Jupyter Notebook link using the `grep` command, or just search in `docker logs jupyter`:
```sh
docker logs jupyter 2>&1 | grep -o 'http://127.0.0.1:8888/lab?token=[^ ]*'
```

Now you can connect to Jupyter Notebook in your browser:
```
http://localhost:8888...
```

---

## **Exploring Notebooks & Running Spark Jobs**

### **1️ - Navigate to the Notebook Directory**
The Jupyter environment contains preloaded notebooks:
```sh
./notebooks/
```

### **2️ - Running Spark Jobs**
Execute PySpark commands inside Jupyter Notebook to process the dataset.

---

## **Scalability & Distributed Processing**
This module is built to be scalable. Although it runs in local mode by default, you can:
- Switch to cluster mode to run Spark jobs on multiple nodes.
- Extend the environment by adding new worker nodes for distributed processing.