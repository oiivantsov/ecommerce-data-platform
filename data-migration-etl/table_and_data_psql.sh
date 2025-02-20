#!/bin/bash

docker exec -it postgres_server psql -U db_owner -d sales -f /data/create-table-psql.sql
docker exec -it postgres_server psql -U db_owner -d sales -f /data/import-data-psql.sql