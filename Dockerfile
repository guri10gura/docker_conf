FROM ubuntu:20.04

LABEL version=1.0

RUN apt-get update \
    && apt-get install -y \
    build-essential \
    git \
    neovim \
    python3 \
    python3-neovim \
    python3-pip \
    subversion \
    tmux \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install cmake --upgrade

ARG DUSER=user
ARG DPASS=${DUSER}
RUN useradd -U -m --groups sudo ${DUSER} \
    && echo ${DUSER}:${DPASS} | chpasswd

COPY tool home/${DUSER}/tool

USER ${DUSER}

