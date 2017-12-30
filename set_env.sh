#!/bin/sh -e

CUR_DIR=`pwd`

# install pipsi
export PIPSI_HOME="$CUR_DIR/.local"
export PIPSI_BIN_DIR="$CUR_DIR/bin"
curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | python

PIPSI_EXECUTABLE=$PIPSI_BIN_DIR/pipsi

# install pipenv
$PIPSI_EXECUTABLE install pew
$PIPSI_EXECUTABLE install pipenv
