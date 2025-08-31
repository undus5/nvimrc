""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
" let backspace acts normally
set backspace=indent,eol,start
" auto read when a file is changed from the outside
set autoread
" a buffer becomes hidden when it is abandoned
set hidden
" disable beep on errors
set noerrorbells
" flash the screen instead of beeping on errors
set visualbell
set t_vb=
" enable mouse for scrolling and resizing
set mouse=a
" encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,gb18030,default,latin1
set fileformats=unix,dos
" disable backup and swap
set nobackup
set nowritebackup
set noswapfile
" don't use Ex mode, use Q for formatting.
nnoremap Q gq
" don't redraw while executing macros (good performance config)
set lazyredraw
" map leader key to space
let mapleader = "\<Space>"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" find the next match as we type the search
set incsearch
" highlight searches by default
set hlsearch
" ignore case when searching ...
set ignorecase
" ... unless you type a capital.
set smartcase

" display command line’s tab complete options as a menu
set wildmenu
" add current working dir and it's subdirs to PATH
set path+=**
" ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class
if has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
    set wildignore+=node_modules\*,vendor\*
    set wildignore+=public\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
    set wildignore+=*/node_modules/*,*/vendor/*
    set wildignore+=*/public/*
endif

" clear search highlight
nmap <silent> <Leader><CR> :nohlsearch<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" smart auto indentation (instead of old smartindent option)
filetype plugin on
filetype indent on
" no wrap lines
set nowrap
" avoid wrapping a line in the middle of a word
set linebreak
" new lines inherit the indentation of previous lines
set autoindent
autocmd FileType * setlocal formatoptions-=ro
" use spaces instead of tabs
set expandtab
" indent by spaces when hitting tab
set softtabstop=4
" show existing tab with spaces width
set tabstop=4
" when indenting with ‘>’, use spaces width
set shiftwidth=4

autocmd FileType yaml setlocal ts=2 sts=2 sw=2
autocmd FileType toml setlocal ts=2 sts=2 sw=2
autocmd FileType json setlocal ts=2 sts=2 sw=2


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Emacs keybindings for command-line
" start of line
:cnoremap <C-A>  <Home>
" back one character
:cnoremap <C-B>  <Left>
" delete character under cursor
:cnoremap <C-D>  <Del>
" end of line
:cnoremap <C-E>  <End>
" forward one character
:cnoremap <C-F>  <Right>
" recall newer command-line
:cnoremap <C-N>  <Down>
" recall previous (older) command-line
:cnoremap <C-P>  <Up>
" back one word
:cnoremap <Esc><C-B> <S-Left>
" forward one word
:cnoremap <Esc><C-F> <S-Right>

" buffer and cope
map <C-l> :bnext<CR>
map <C-h> :bprevious<CR>
map <C-j> :cnext<CR>
map <C-k> :cprevious<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cursor
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" always show cursor position
set ruler
" highlight cursor line and column
set cursorline
set cursorcolumn
" highlight limit column
set colorcolumn=81

" reletive line number
set number


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Netrw
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" disable .netrwhist file
let g:netrw_dirhistmax=0
" autoclose netrw buffer
let g:netrw_fastbrowse = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearence
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" always show the status line
set laststatus=2
" g Ctrl-g
set statusline=\ %F%m%r%h%w%=[%p%%\/%L]\ [%{&encoding}\/%{&fileformat}]\ %y\ 
" set the window’s title, reflecting the file currently being edited
set title

" the number of screen lines to keep around the cursor
set scrolloff=7
set sidescrolloff=5

" fonts
if has("win32")
    set gfn=JetBrains\ Mono\ NL:h12
    set gfw=Sarasa\ Mono\ SC:h14
elseif has("linux")
    set gfn=JetBrains\ Mono\ NL\ 12
endif

" disable markdown folding
let vim_markdown_folding_disabled = 1

" enable syntax highlighting
syntax on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" built-in colors which support both light && dark modes:
" vim & nvim : quiet lunaperche
" vim        : retrobox wildcharm
" set colorscheme or turn off syntax highlighting

"set background=dark

"try
"    colorscheme quiet
"catch
"    syntax off
"endtry

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let s:vim_runtime = fnamemodify(resolve(expand('<sfile>:p')), ':h')
"execute 'set runtimepath+=' . s:vim_runtime
"execute 'source ' . s:vim_runtime . '/vimrc'
"call pathogen#infect(s:vim_runtime.'/plugins_vim/{}')

