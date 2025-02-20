#!/bin/bash

docker exec -it postgres_container psql -U db_owner -d postgres -c "CREATE DATABASE test1;"
docker exec -it postgres_container psql -U db_owner -d test1 -f /schema/CREATE-SCRIPT.sql