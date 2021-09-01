#!/bin/bash

DIR=$(cd $(dirname $0); pwd)
HOME_DIR=${DIR}/..

pushd ${DIR}
  git clone https://github.com/guri10gura/dotfiles
  cd ${HOME_DIR}
  rm -r ./tool/dotfiles/.git
  cp -r ./tool/dotfiles/. .
  rm -r ./tool/dotfiles
  ls -al ${HOME_DIR}
popd

