#!/usr/bin/env bash

sdir=$(dirname $(realpath ${BASH_SOURCE[0]}))
svimrc=$sdir/vimrc
dvimrc=~/.vimrc
nvimconfd=~/.config/nvim

ln -sf $svimrc $dvimrc
mkdir -p $nvimconfd
ln -sf $svimrc $nvimconfd/init.vim

