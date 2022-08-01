#!/bin/bash

MONGODB1=mongo1
MONGODB2=mongo2
MONGODB3=mongo3

echo "**********************************************"

mongosh ${MONGODB1}:27017 <<EOF
var cfg = {
    "_id": "rs0",
    "members": [
        {
            "_id": 0,
            "host": "${MONGODB1}:27017",
            "priority": 2
        },
        {
            "_id": 1,
            "host": "${MONGODB2}:27017",
            "priority": 0
        },
        {
            "_id": 2,
            "host": "${MONGODB3}:27017",
            "priority": 0
        }
    ]
};
rs.initiate(cfg);
rs.reconfig(cfg);
quit();
