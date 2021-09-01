#!/bin/bash

IMG_NAME="ubuntu_img"
CONTAINER="ubuntu_container" 
SCRIPT_DIR=$(cd $(dirname $0); pwd)

rm ${SCRIPT_DIR}/tool/installer.sh
sudo --preserve-env=USER docker build -t ${IMG_NAME} --build-arg DUSER="${USER}_" .

sudo docker run -td \
    --name ${CONTAINER} \
    -u ${UID}:`id -g` \
    -v ${HOME}:${HOME} \
    -v ${HOME}/.cache:${HOME}_/.cache \
    --workdir=`pwd` \
    ${IMG_NAME} 

sudo docker ps -a

