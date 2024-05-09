#!/usr/bin/env bash

sdir=$(dirname $(realpath ${BASH_SOURCE[0]}))
svimrc=$sdir/vimrc
dvimrc=~/.vimrc
nvimconfd=~/.config/nvim
rootconfd=/root/.config

ln -sf $svimrc $dvimrc
mkdir -p $nvimconfd
ln -sf $svimrc $nvimconfd/init.vim

sudo -v > /dev/null 2>&1
if [[ $? == 0 && ${EUID} != 0 ]]; then
    sudo ln -sf $dvimrc /root
    sudo mkdir -p $rootconfd
    sudo ln -sf $nvimconfd $rootconfd
fi
