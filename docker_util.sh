#!/bin/bash

CONTAINER_NAME="ubuntu_container"

PrintHelp()
{
    echo "   <option>"
    echo "      -s start"
    echo "      -e exec"
    echo "      -c commit"
    echo "      -g add group"
}

if [ $# -eq 0 ];then
    PrintHelp
    exit 0
fi

GROUP=0
START=0
EXEC=0
COMMIT=0

while getopts secg OPT
  do
  case $OPT in
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

if [ ${GROUP} -eq 1 ];then
  sudo gpasswd -a ${USER} docker
  getent group docker
fi
if [ ${START} -eq 1 ];then
  docker start ubuntu_container
fi
if [ ${EXEC} -eq 1 ];then
  docker exec -it ubuntu_container bash
fi
if [ ${COMMIT} -eq 1 ];then
  echo "todo"
fi

