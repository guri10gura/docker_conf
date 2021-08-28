#!/bin/bash

DIR=$(cd $(dirname $0); pwd)

DATE=`date '+%Y%m%d-%H%M%S'`

touch ${DIR}/${DATE}.txt

