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
set fileencodings=utf-8,gb18030
set fileformats=unix,dos
" disable backup and swap
set nobackup
set nowritebackup
set noswapfile
" enable undo dir
"set undofile
"set undodir=~/.vimundos
let mapleader = "\<Space>"
" don't use Ex mode, use Q for formatting.
nnoremap Q gq


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
nmap <silent> <Leader>/ :nohlsearch<CR>


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
set relativenumber
augroup toggle_relative_number
autocmd InsertEnter * :setlocal norelativenumber
autocmd InsertLeave * :setlocal relativenumber


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
" use spaces instead of tabs
set expandtab
" indent by spaces when hitting tab
set softtabstop=4
" show existing tab with spaces width
set tabstop=4
" when indenting with ‘>’, use spaces width
set shiftwidth=4

autocmd FileType * setlocal formatoptions-=ro

autocmd FileType yaml setlocal ts=2 sts=2 sw=2
autocmd FileType toml setlocal ts=2 sts=2 sw=2
autocmd FileType json setlocal ts=2 sts=2 sw=2


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearence
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" don't redraw while executing macros (good performance config)
set lazyredraw

" enable syntax highlighting
syntax enable

" colorscheme
colorscheme desert
set background=dark

" always show the status line
set laststatus=2
" g Ctrl-g
set statusline=\ %F%m%r%h%w%=%y\ %{&encoding}\/%{&fileformat}\ %p%%,%c,%L\ 
" set the window’s title, reflecting the file currently being edited
set title

" the number of screen lines to keep around the cursor
set scrolloff=7
set sidescrolloff=5

" display command line’s tab complete options as a menu
set wildmenu
" ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" fonts
if has("win32")
    set gfn=JetBrains\ Mono\ NL:h12
    set gfw=Sarasa\ Mono\ SC:h14
elseif has("linux")
    set gfn=JetBrains\ Mono\ NL\ 12
endif

" disable markdown folding
let vim_markdown_folding_disabled = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keymappings
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

"nnoremap <Leader>w :w<CR>

" buffer and cope
map <C-l> :bnext<CR>
map <C-h> :bprevious<CR>
map <C-j> :cnext<CR>
map <C-k> :cprevious<CR>

" clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" align code
vmap <Leader>t :!column -t -o " "<CR>

" toggle dark/light
nmap <Leader>i :call ToggleTheme()<CR>
function ToggleTheme()
    if &background == "dark"
        set background=light
    elseif &background == "light"
        set background=dark
    endif
endfunction
