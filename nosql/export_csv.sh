#!/bin/bash

docker exec -it mongodb_container mongoexport --db=catalog \
    --collection=electronics \
    --type=csv \
    --fields=_id,type,model \
    --out=/data/export/electronics.csv