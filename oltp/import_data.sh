#!/bin/bash

docker exec mysql_container mysql -u root -p5555 -D sales --local-infile=1 -e "
LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/oltpdata.csv'
INTO TABLE sales_data
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';
"
echo "Checking the data in the table (if 2605, then data is loaded)"
docker exec -it mysql_container mysql -u root -p5555 -D sales -e "SELECT COUNT(*) FROM sales_data; SELECT * FROM sales_data LIMIT 5;"

