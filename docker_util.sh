#!/bin/bash

IMG_NAME="ubuntu_img"
CONTAINER="ubuntu_container" 
SCRIPT_DIR=$(cd $(dirname $0); pwd)

PrintHelp()
{
    echo "   <option>"
    echo "      -r docker build & run"
    echo "      -s start"
    echo "      -e exec"
    echo "      -c commit"
    echo "      -g add group"
}

if [ $# -eq 0 ];then
    PrintHelp
    exit 0
fi

RUN=0
GROUP=0
START=0
EXEC=0
COMMIT=0

while getopts secgr OPT
  do
  case $OPT in
    r)  RUN=1
    ;;
    g)  GROUP=1
    ;;
    s)  START=1
    ;;
    e)  EXEC=1
    ;;
    c)  COMMIT=1
    ;;
    \?) PrintHelp
    ;;
  esac
done

if [ ${RUN} -eq 1 ];then
  docker build -t ${IMG_NAME} --build-arg DUSER="${USER}_" .
  docker run -td \
      --name ${CONTAINER} \
      -u ${UID}:`id -g` \
      -v ${HOME}:${HOME} \
      -v ${HOME}/.cache:${HOME}_/.cache \
      --workdir=`pwd` \
      ${IMG_NAME} 
  docker ps -a
fi
if [ ${GROUP} -eq 1 ];then
  sudo gpasswd -a ${USER} docker
  getent group docker
fi
if [ ${START} -eq 1 ];then
  docker start ubuntu_container
fi
if [ ${EXEC} -eq 1 ];then
  echo "${USER}_"
  docker exec -it ubuntu_container /bin/bash
fi
if [ ${COMMIT} -eq 1 ];then
  echo "todo"
fi

