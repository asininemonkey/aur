#!/usr/bin/env bash

set -e

export HOME=/home/$(whoami) # GitHub Actions Override

SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir --mode 0700 --parents \
    ${HOME}/.gnupg \
    ${HOME}/packages \
    ${HOME}/repo

gpg --batch --receive-keys '78CEAA8CB72E4467' # mullvad-vpn
gpg --batch --receive-keys 'AC2D62742012EA22' # 1password

for PACKAGE in $(cat "${SCRIPT_PATH}/packages.txt")
do
    git -C ${HOME}/packages clone https://aur.archlinux.org/${PACKAGE}.git
    cd ${HOME}/packages/${PACKAGE}
    makepkg
    cp ${HOME}/packages/${PACKAGE}/*.pkg.tar.zst ${HOME}/repo/
done

repo-add ${HOME}/repo/aur.db.tar.gz ${HOME}/repo/*.pkg.tar.zst
