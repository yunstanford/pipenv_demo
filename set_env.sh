#!/bin/sh -e

CUR_DIR=`pwd`

# install pipsi
export PIPSI_HOME="$CUR_DIR/.local"
export PIPSI_BIN_DIR="$CUR_DIR/bin"

# check if cache exists
if [ -d "$PIPSI_HOME" ]; then
  echo "Found Cache, you're good to go! :)"
  exit
fi

curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | python

PIPSI_EXECUTABLE=$PIPSI_BIN_DIR/pipsi
export PATH=$PIPSI_BIN_DIR:$PATH

# install pipenv
$PIPSI_EXECUTABLE install pew
$PIPSI_EXECUTABLE install pipenv

# install Tox automation for easy testing
$PIPSI_EXECUTABLE install tox

# Export PATH for CMD Usage
export PATH=$PIPSI_BIN_DIR:$PATH

# Attach virtualenv to current project
export PIPENV_VENV_IN_PROJECT="1"
