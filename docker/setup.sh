#!/bin/bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

docker build -t vnc_image $DIR

docker rm -f vnc_container || echo "Previous container not found"
docker run -d --name vnc_container -ti vnc_image bash

sleep 1

docker exec -ti vnc_container zsh