# NoSQL Module for E-Commerce Data Platform

## Overview
This module utilizes **MongoDB** to handle **NoSQL data** for an e-commerce platform. It includes importing product catalog data, running queries, and exporting data for further processing.

---

## **Setup & Running the Container**

1. Ensure **Docker** is installed.
2. Start the **MongoDB container** using Docker Compose:
   ```sh
   docker-compose up -d
   ```

---

## **Import Data into MongoDB**

To import a **JSON file** with the product catalog into MongoDB, run:
```sh
./import_json.sh
```
This will insert the product catalog into the MongoDB database.

---

## **Explore the Data**

To connect to the MongoDB shell and explore data, use:
```sh
./connect_mongo.sh
```

### **Example MongoDB Queries**

#### **List all databases and collections** in MongoDB:
```js
show dbs;
use catalog;
show collections;
```

#### **Display the first five documents** from the `electronics` collection:
```js
db.electronics.find().limit(5).pretty();
```

#### **Querying the collection:**
- **Count the number of laptops** in the collection:
  ```js
  db.electronics.countDocuments({ category: "laptop" });
  ```
- **Count the number of smartphones** with a **6-inch screen size**:
  ```js
  db.electronics.countDocuments({ category: "smartphone", screen_size: 6 });
  ```
- **Compute the average screen size of smartphones**:
  ```js
  db.electronics.aggregate([
      { $match: { category: "smartphone" } },
      { $group: { _id: null, avgScreenSize: { $avg: "$screen_size" } } }
  ]);
  ```

---

## **Export Data for Further Processing**

To export MongoDB data into **CSV format**, run:
```sh
./export_csv.sh
```
This will save the exported data into the `exports` folder for further analysis.

---



