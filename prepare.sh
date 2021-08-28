#!/bin/bash
sudo --preserve-env=USER docker build -t yamaimg --build-arg DUSER="${USER}_" .

sudo docker run -td \
    --name yamaenv \
    -u $UID:`id -g` \
    -v $HOME:$HOME \
    --workdir=`pwd` \
    yamaimg

sudo docker ps -a

