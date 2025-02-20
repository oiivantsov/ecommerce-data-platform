#!/bin/bash

docker exec -it mongodb_container mongoimport \
    --db catalog \
    --collection electronics \
    --type json \
    --file /data/import/catalog.json
