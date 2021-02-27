# vimrc

## Installation

For Linux

```
git clone https://github.com/dodowhat/vimrc.git ~/.vim_runtime

ln -s ~/.vim_runtime/vimrc ~/.vimrc
```

For Windows (PowerShell)

```
git clone https://github.com/dodowhat/vimrc.git ~/.vim_runtime

Copy-Item "~\.vim_runtime\vimrc" -Destination "~\.vimrc"

# If Vim version >= 8.2
New-Item -ItemType file ~\.gvimrc
```