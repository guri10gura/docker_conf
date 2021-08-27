FROM ubuntu:20.04

LABEL version=1.0

RUN apt-get update \
    && apt-get install -y \
    build-essential \
    git \
    python3 \
    python3-pip \
    subversion \
    tmux \
    vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install cmake --upgrade


ARG DOCKER_USER=user
ARG DOCKER_GROUP=user
ARG DOCKER_PASS=user
RUN groupadd -r user && useradd -m -g ${DOCKER_GROUP} --groups sudo ${DOCKER_USER} \
    && echo ${DOCKER_USER}:${DOCKER_PASS} | chpasswd
USER ${DOCKER_USER}

