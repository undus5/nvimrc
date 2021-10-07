# vimrc

## Installation

for Linux

```
git clone https://github.com/dodowhat/vimrc.git ~/.vim_runtime

ln -s ~/.vim_runtime/vimrc ~/.vimrc
```

for Windows (PowerShell)

```
git clone https://github.com/dodowhat/vimrc.git ~/.vim_runtime

Copy-Item "~\.vim_runtime\vimrc" -Destination "~\.vimrc"

# If Vim version >= 8.2
New-Item -ItemType file ~\.gvimrc
```

for Neovim, The config file is located at:

```
Unix			~/.config/nvim/init.vim		(or init.lua)
Windows			~/AppData/Local/nvim/init.vim	(or init.lua)
```
