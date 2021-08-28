#!/bin/bash

docker build -t yamaimg .

docker run -td \
    --name yamaenv  \
    -v ${HOME}/work:/home/user/work \
    yamaimg

docker ps -a

