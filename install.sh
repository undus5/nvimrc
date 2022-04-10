#!/usr/bin/env bash

# Vim

runtime_path=~/.vim_runtime
vimrc_source=$runtime_path/vimrc
vimrc_destination=~/.vimrc
gvimrc_destination=~/.gvimrc

if [[ ! -f $vimrc_destination ]]; then
    ln -s $vimrc_source $vimrc_destination
fi
touch $gvimrc_destination

# Neovim

nvim_config_dir=~/.config/nvim

if [[ ! -d $nvim_config_dir ]]; then
    mkdir -p $nvim_config_dir
fi

nvimrc_destination=$nvim_config_dir/init.vim
gnvimrc_source=$runtime_path/ginit.vim
gnvimrc_destination=$nvim_config_dir/ginit.vim

if [[ ! -f $nvimrc_destination ]]; then
    ln -s $vimrc_source $nvimrc_destination
fi
if [[ ! -f $gnvimrc_destination ]]; then
    ln -s $gnvimrc_source $gnvimrc_destination
fi

