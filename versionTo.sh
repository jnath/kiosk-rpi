#!/bin/bash


BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

POKY_DIR=${POKY_DIR:-${BASE_DIR}/poky}
META_LIST=${META_LIST:-${BASE_DIR}/meta-*}

for META_DIR in $META_LIST; do
	META_DIR=$(realpath "${META_DIR}")
  GIT_DIR="$META_DIR/.git"

  if [ -d "$GIT_DIR" ]; then
    echo -e "\e[32m Go to $1 version for $(basename $META_DIR). \e[0m"
    cd $META_DIR
    git checkout $1 || git checkout master
    echo -e "\n"
  fi
done

echo -e "\e[32m Go to $1 version for poky \e[0m"

cd $POKY_DIR

git checkout $1 || git checkout master

