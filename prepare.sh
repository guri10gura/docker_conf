#!/bin/bash

docker build -t yamaimg .

docker run -td --name yamaenv yamaimg

docker ps -a

