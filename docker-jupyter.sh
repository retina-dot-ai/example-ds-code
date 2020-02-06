#!/bin/bash

echo "docker pull retina/example-docker-jupyter:latest"
docker pull retina/example-docker-jupyter:latest

docker run --rm -it \
  -e JUPYTER_ENABLE_LAB=yes \
  -p 8888:8888 \
  -v `pwd`/notebooks:/home/jovyan/notebooks \
  retina/example-docker-jupyter
