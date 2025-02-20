#!/bin/bash

docker exec -it postgres_container psql -U db_owner -d postgres -c "CREATE DATABASE staging;"
docker exec -it postgres_container psql -U db_owner -d staging -f /schema/star_schema_generated.sql