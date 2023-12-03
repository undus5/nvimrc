# vimrc

## Installation

### Linux

```
git clone https://github.com/undus5/vimrc.git ~/.vim_runtime

# for vim
ln -sf ~/.vim_runtime/vimrc ~/.vimrc

# for neovim
ln -sf ~/.vim_runtime/vimrc ~/.config/nvim/init.vim
```

or basic version only:

```
curl -fsSL https://github.com/undus5/vimrc/raw/main/base.vim -o ~/.vimrc
```

### Windows

```
# destination path must be ~/.vim_runtime (hard coded)
git clone https://github.com/undus5/vimrc.git ~/.vim_runtime

# copy ~/.vim_runtime/vimrc to:

# for vim
~/_vimrc

# for neovim
~/AppData/Local/nvim/init.vim
```
