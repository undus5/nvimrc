#!/usr/bin/env bash

sdir=$(dirname $(realpath ${BASH_SOURCE[0]}))
nvimdir=~/.config/nvim

ln -sf $sdir/vimrc ~/.vimrc

mkdir -p $nvimdir
ln -sf $sdir/vimrc $nvimdir/init.vim

