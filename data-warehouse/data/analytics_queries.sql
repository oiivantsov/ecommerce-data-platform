-- Purpose: Contains the queries for the analytics dashboard.

-- Query 1: Total sales by country and category using GROUPING SETS
SELECT country, category, SUM(amount) AS totalsales
FROM "FactSales" as fs
LEFT JOIN "DimCountry" as dc ON fs."country_id" = dc."country_id"
LEFT JOIN "DimCategory" as dcat ON fs."category_id" = dcat."category_id"
GROUP BY GROUPING SETS ((country, category), (country), (category), ())
ORDER BY country, category;

-- Query 2: Total sales by year, country, and total sales using ROLLUP
SELECT year, country, SUM(amount) AS totalsales
FROM "FactSales" as fs
LEFT JOIN "DimDate" as dd ON fs."dateid" = dd."dateid"
LEFT JOIN "DimCountry" as dc ON fs."countryid" = dc."countryid"
GROUP BY ROLLUP (year, country)
ORDER BY year, country;

-- Query 3: Total sales by year, country, and average sales using CUBE
SELECT year, country, AVG(amount) AS averagesales
FROM "FactSales" as fs
LEFT JOIN "DimDate" as dd ON fs."dateid" = dd."dateid"
LEFT JOIN "DimCountry" as dc ON fs."countryid" = dc."countryid"
GROUP BY CUBE (year, country)
ORDER BY year, country;

-- Query 4: Materialized view for total sales by country
CREATE MATERIALIZED VIEW "total_sales_per_country" AS
SELECT country, SUM(amount) AS totalsales
FROM "FactSales" as fs
LEFT JOIN "DimCountry" as dc ON fs."countryid" = dc."countryid"
GROUP BY country;