#!/usr/bin/env bash

# Vim

runtime_path="~\.vim_runtime"
vimrc_source="${runtime_path}\vimrc"
vimrc_destination="~\.vimrc"
gvimrc_destination="~\.gvimrc"

ln -s $vimrc_source $vimrc_destination
touch $gvimrc_destination

# Neovim

nvim_config_dir="~/.config/nvim"

if [[ ! -d $nvim_config_dir ]]; then
    mkdir -p $nvim_config_dir
fi

nvimrc_destination="${nvim_config_dir}\init.vim"
gnvimrc_source="${runtime_path}\ginit.vim"
gnvimrc_destination="${nvim_config_dir}\ginit.vim"

ln -s $vimrc_source $nvimrc_destination
ln -s $gnvimrc_source $gnvimrc_destination

