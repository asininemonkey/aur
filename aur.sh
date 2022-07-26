#!/usr/bin/env bash

set -e

export HOME=/home/$(whoami) # GitHub Actions Override

mkdir --mode 0700 --parents \
    ${HOME}/.gnupg \
    ${HOME}/packages \
    ${HOME}/repo

echo 'allow-preset-passphrase' > ${HOME}/.gnupg/gpg-agent.conf

gpg-agent --daemon

echo -n "${GPG_PASSPHRASE}" | /usr/lib/gnupg/gpg-preset-passphrase --preset 'A0F6F29445A54D625A7E845B6AACFF99D222A382'

echo -n "${GPG_PRIVATE_KEY_B64}" | base64 --decode | gpg --batch --import

for PACKAGE in \
    amazon-ecr-credential-helper \
    aws-cli-v2-bin \
    chrome-gnome-shell \
    cider-git \
    code-marketplace \
    kind-bin \
    macchina-bin \
    paru-bin
do
    git -C ${HOME}/packages clone https://aur.archlinux.org/${PACKAGE}.git
    cd ${HOME}/packages/${PACKAGE}
    makepkg --sign
    cp ${HOME}/packages/${PACKAGE}/*.pkg.tar.zst ${HOME}/repo/
    cp ${HOME}/packages/${PACKAGE}/*.pkg.tar.zst.sig ${HOME}/repo/
done

repo-add --sign ${HOME}/repo/aur.db.tar.gz ${HOME}/repo/*.pkg.tar.zst

aws s3 sync --delete --storage-class ONEZONE_IA ${HOME}/repo s3://jcardoso-repo-aur
