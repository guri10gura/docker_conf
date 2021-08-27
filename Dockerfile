FROM ubuntu:18.04

LABEL version=1.0

RUN apt-get update \
    && apt-get install -y \
    build-essential \
    subversion \
    git \
    vim \
    python3 \
    python3-pip \
    tmux 

RUN pip3 install cmake --upgrade

