#!/bin/bash

CONTAINER_NAME="ubuntu_container"

PrintHelp()
{
    echo "   <option>"
    echo "      -s start"
    echo "      -e exec"
    echo "      -c commit"
}

if [ $# -eq 0 ];then
    PrintHelp
    exit 0
fi

START=0
EXEC=0
COMMIT=0

while getopts sec OPT
  do
  case $OPT in
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

if [ ${START} -eq 1 ];then
  docker start ubuntu_container
fi
if [ ${EXEC} -eq 1 ];then
  docker exec -it ubuntu_container bash
fi
if [ ${COMMIT} -eq 1 ];then
  echo "todo"
fi

