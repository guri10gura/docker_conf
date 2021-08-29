#!/bin/bash

DIR=$(cd $(dirname $0); pwd)

DATE=`date '+%Y%m%d-%H%M%S'`

pushd ${DIR}
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
  bash ./installer.sh ~/.cache/dein
popd

