#!/bin/bash

docker exec mysql_container mysqldump -u root -p5555 sales > ./backup/sales.sql

echo "Data export completed. File saved as sales.sql"
