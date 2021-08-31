#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)
rm ${SCRIPT_DIR}/tool/installer.sh
sudo --preserve-env=USER docker build -t yamaimg --build-arg DUSER="${USER}_" .

sudo docker run -td \
    --name yamaenv \
    -u $UID:`id -g` \
    -v ${HOME}:${HOME} \
    -v ${HOME}/.cache:${HOME}_/.cache \
    --workdir=`pwd` \
    yamaimg

sudo docker ps -a

