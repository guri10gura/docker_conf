#!/bin/bash

docker build -t ub-img .

docker run -td --name ub-env ub-img

docker ps -a


