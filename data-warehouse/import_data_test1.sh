#!/bin/bash

docker exec -it postgres_container psql -U db_owner -d test1 -f /data/import_data.sql