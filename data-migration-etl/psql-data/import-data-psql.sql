COPY "sales_data" FROM '/data/sales.csv' DELIMITER ',' CSV HEADER;
SELECT * FROM "sales_data" LIMIT 5;