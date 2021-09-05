#!/bin/bash

IMG_NAME="ubuntu_img"
CONTAINER="ubuntu_container" 
SCRIPT_DIR=$(cd $(dirname $0); pwd)

docker build -t ${IMG_NAME} --build-arg DUSER="${USER}_" .

docker run -td \
    --name ${CONTAINER} \
    -u ${UID}:`id -g` \
    -v ${HOME}:${HOME} \
    -v ${HOME}/.cache:${HOME}_/.cache \
    --workdir=`pwd` \
    ${IMG_NAME} 

docker ps -a

