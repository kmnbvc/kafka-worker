#!/bin/bash

set -e
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

mvn clean package -f $SCRIPT_DIR/../pom.xml
docker-compose -f $SCRIPT_DIR/../docker-compose.yaml up -d --build
