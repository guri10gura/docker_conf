FROM ubuntu:20.04

LABEL version=1.0

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y \
    build-essential \
    curl \
    git \
    python3 \
    python3-neovim \
    python3-pip \
    software-properties-common \
    subversion \
    tmux \
    && add-apt-repository ppa:neovim-ppa/stable \
    && apt-get update \
    && apt-get install -y \
    neovim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install cmake --upgrade
RUN pip3 install --user pynvim
RUN pip3 install msgpack
RUN pip3 install Send2Trash

ARG DUSER=user
ARG DPASS=${DUSER}
RUN useradd -U -m --groups sudo ${DUSER} \
    && echo ${DUSER}:${DPASS} | chpasswd

COPY tool /home/${DUSER}/tool

RUN /home/${DUSER}/tool/startup.sh
RUN rm /home/${DUSER}/tool/startup.sh
RUN chown -Rf ${DUSER}:${DUSER} /home/${DUSER}/tool
RUN chmod -Rf +x /home/${DUSER}/tool

USER ${DUSER}

