#!/bin/bash

docker exec -it mysql_container mysql -u root -p5555 -e "
USE sales; 
SHOW TABLES; 
SELECT COUNT(*) FROM sales_data;
SHOW INDEX FROM sales_data;
"