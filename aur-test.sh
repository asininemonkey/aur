#!/usr/bin/env bash

set -e

export HOME=/home/$(whoami) # GitHub Actions Override

mkdir --mode 0700 --parents \
    ${HOME}/.gnupg \
    ${HOME}/packages \
    ${HOME}/repo

for PACKAGE in $(cat packages.txt)
do
    git -C ${HOME}/packages clone https://aur.archlinux.org/${PACKAGE}.git
    cd ${HOME}/packages/${PACKAGE}
    makepkg
    cp ${HOME}/packages/${PACKAGE}/*.pkg.tar.zst ${HOME}/repo/
done

repo-add ${HOME}/repo/aur.db.tar.gz ${HOME}/repo/*.pkg.tar.zst
