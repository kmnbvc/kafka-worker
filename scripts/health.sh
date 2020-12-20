#!/bin/bash

connectors=`curl localhost:8083/connectors | jq`

if [[ -z connectors ]]
then
  curl -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:8083/connectors/ -d @register-postgres.json
fi