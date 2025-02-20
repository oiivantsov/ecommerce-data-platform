COPY "DimDate" FROM '/data/DimDate.csv' DELIMITER ',' CSV HEADER;
SELECT * FROM "DimDate" LIMIT 5;

COPY "DimCategory" FROM '/data/DimCategory.csv' DELIMITER ',' CSV HEADER;
SELECT * FROM "DimCategory" LIMIT 5;

COPY "DimCountry" FROM '/data/DimCountry.csv' DELIMITER ',' CSV HEADER;
SELECT * FROM "DimCountry" LIMIT 5;

COPY "FactSales" FROM '/data/FactSales.csv' DELIMITER ',' CSV HEADER;
SELECT * FROM "FactSales" LIMIT 5;