![VIM](https://dnp4pehkvoo6n.cloudfront.net/43c5af597bd5c1a64eb1829f011c208f/as/Ultimate%20Vimrc.svg)

# The Ultimate vimrc

Over the last 10 years, I have used and tweaked Vim. This configuration is the ultimate vimrc (or at least my version of it).

There are two versions:

* **The Basic**: If you want something small just copy [basic.vim](https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim) into your ~/.vimrc and you will have a good basic setup
* **The Awesome**: Includes a ton of useful plugins, color schemes, and configurations

I would, of course, recommend using the awesome version.


## How to install the Awesome version?
### Install for your own user only
The awesome version includes a lot of great plugins, configurations and color schemes that make Vim a lot better. To install it simply do following from your terminal:

	git clone --depth=1 https://github.com/dodowhat/vimrc.git ~/.vim_runtime
	cp ~/.vim_runtime/vimrc ~/.vimrc
	
## Fonts

I recommend using [IBM Plex Mono font](https://github.com/IBM/plex) (it's an open-source and awesome font that can make your code beautiful). The Awesome vimrc is already setup to try to use it.

Some other fonts that Awesome will try to use:

* [Hack](http://sourcefoundry.org/hack/)
* [Source Code Pro](https://adobe-fonts.github.io/source-code-pro/)

## How to install the Basic version?

The basic version is just one file and no plugins. Just copy [basic.vim](https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim) and paste it into your vimrc.

The basic version is useful to install on remote servers where you don't need many plugins, and you don't do many edits.

	git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
    cat ~/.vim_runtime/vimrcs/basic.vim ~/.vimrc


## How to install on Windows?

Use [gitforwindows](http://gitforwindows.org/) to checkout the repository and run the installation instructions above. No special instructions needed ;-)


## How to install on Linux

If you have vim aliased as `vi` instead of `vim`, make sure to either alias it: `alias vi=vim`. Otherwise, `apt-get install vim`


## How to update to latest version?

Just do a git rebase!

    cd ~/.vim_runtime
    git pull --rebase
    python update_plugins.py


## Some screenshots

Colors when editing a Python file:

![Screenshot 1](https://dnp4pehkvoo6n.cloudfront.net/07583008e4da885801657e8781777844/as/Python%20editing.png)

[NERD Tree](https://github.com/scrooloose/nerdtree) plugin in a terminal window:
![Screenshot 3](https://dnp4pehkvoo6n.cloudfront.net/ae719203166585d64728f28398f4b1b7/as/Terminal%20usage.png)


## Included Plugins

I recommend reading the docs of these plugins to understand them better. Each plugin provides a much better Vim experience!

* [ack.vim](https://github.com/mileszs/ack.vim): Vim plugin for `the_silver_searcher` (ag) or ack -- a wicked fast grep
* [bufexplorer.zip](https://github.com/vim-scripts/bufexplorer.zip): Quickly and easily switch between buffers. This plugin can be opened with `<leader+o>`
* [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim): Fuzzy file, buffer, mru and tag finder. It's mapped to `<Ctrl+F>`
* [lightline.vim](https://github.com/itchyny/lightline.vim): A light and configurable statusline/tabline for Vim
* [NERD Tree](https://github.com/scrooloose/nerdtree): A tree explorer plugin for vim
* [open_file_under_cursor.vim](https://github.com/amix/open_file_under_cursor.vim): Open file under cursor when pressing `gf`
* [pathogen.vim](https://github.com/tpope/vim-pathogen): Manage your vim runtimepath 
* [snipmate.vim](https://github.com/garbas/vim-snipmate): snipmate.vim aims to be a concise vim script that implements some of TextMate's snippets features in Vim
* [ale](https://github.com/w0rp/ale): Syntax and lint checking for vim (ALE requires NeoVim >= 0.2.0 or Vim 8 with +timers +job +channel)
* [vim-commentary](https://github.com/tpope/vim-commentary): Comment stuff out.  Use `gcc` to comment out a line (takes a count), `gc` to comment out the target of a motion. `gcu` uncomments a set of adjacent commented lines.
* [vim-expand-region](https://github.com/terryma/vim-expand-region): Allows you to visually select increasingly larger regions of text using the same key combination
* [vim-fugitive](https://github.com/tpope/vim-fugitive): A Git wrapper so awesome, it should be illegal
* [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors): Sublime Text style multiple selections for Vim, CTRL+N is remapped to CTRL+S (due to YankRing)
* [gist-vim](https://github.com/mattn/gist-vim) Easily create gists from Vim using the `:Gist` command


## Included color schemes

* [peaksea](https://github.com/vim-scripts/peaksea): The default
* [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized)
* [vim-irblack](https://github.com/wgibbs/vim-irblack)
* [mayansmoke](https://github.com/vim-scripts/mayansmoke)
* [vim-pyte](https://github.com/therubymug/vim-pyte)


## Included modes

* [vim-markdown](https://github.com/plasticboy/vim-markdown)
* [nginx.vim](https://github.com/vim-scripts/nginx.vim): Highlights configuration files for nginx
* [vim-ruby](https://github.com/vim-ruby/vim-ruby)
* [vim-javascript](https://github.com/pangloss/vim-javascript)


## Key Mappings

The [leader](http://learnvimscriptthehardway.stevelosh.com/chapters/06.html#leader) is `<space>`, so whenever you see `<leader>` it means `<space>`.


### Normal mode mappings

Fast saving of a buffer (`<leader>w`):

	nmap <leader>w :w<cr>

Disable highlights when you press `<leader><cr>`:
	
	map <silent> <leader><cr> :noh<cr>

Smart way to move between windows (`<ctrl>j` etc.):
	
	map <C-j> <C-W>j
	map <C-k> <C-W>k
	map <C-h> <C-W>h
	map <C-l> <C-W>l

Closing of the current buffer(s) (`<leader>bd` and (`<leader>ba`)):
	
	" Close current buffer
	map <leader>bd :Bclose<cr>
	
	" Close all buffers
	map <leader>ba :1,1000 bd!<cr>
	
Useful mappings for managing tabs:
	
	map <leader>tn :tabnew<cr>
	map <leader>to :tabonly<cr>
	map <leader>tc :tabclose<cr>
	map <leader>tm :tabmove 
	
	" Opens a new tab with the current buffer's path
	" Super useful when editing files in the same directory
	map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/
	
Switch [CWD](http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file) to the directory of the open buffer:
	
	map <leader>cd :cd %:p:h<cr>:pwd<cr>
	
Open `ack.vim` for fast search:
	
	map <leader>g :Ack 

Quickly open a buffer for scripbble:
	
	map <leader>q :e ~/buffer<cr>


### Visual mode mappings

Visual mode pressing `*` or `#` searches for the current selection:

	vnoremap <silent> * :call VisualSelection('f')<CR>
	vnoremap <silent> # :call VisualSelection('b')<CR>

When you press gv you `Ack.vim` after the selected text:

	vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

When you press `<leader>r` you can search and replace the selected text:

	vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>


### Insert mode mappings

Insert the current date and time (useful for timestamps):

    iab xdate <C-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


### Command line mappings

$q is super useful when browsing on the command line. It deletes everything until the last slash:

    cno $q <C-\>eDeleteTillSlash()<cr>

Bash like keys for the command line:

    cnoremap <C-A>		<Home>
    cnoremap <C-E>		<End>
    cnoremap <C-K>		<C-U>

    cnoremap <C-P> <Up>
    cnoremap <C-N> <Down>

Write the file as sudo (works only on Unix). Super useful when you open a file and you don't have permissions to save your changes. [Vim tip](http://vim.wikia.com/wiki/Su-write):

    :W 


### Plugin related mappings

Open [bufexplorer](https://github.com/vim-scripts/bufexplorer.zip) to see and manage the current buffers (`<leader>o`):
    
    map <leader>o :BufExplorer<cr>

Open [ctrlp.vim](https://github.com/kien/ctrlp.vim) plugin to quickly find a file or a buffer (`<leader>j` or `<ctrl>p`):

    " Quickly find and open a recently opened file
    map <leader>f :MRU<CR>

    " Quickly find and open a buffer
    map <leader>b :CtrlPBuffer<cr>

[NERD Tree](https://github.com/scrooloose/nerdtree) mappings:

    map <leader>nn :NERDTreeToggle<cr>
    map <leader>nf :NERDTreeFind<cr>

[vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors) mappings to manage multiple cursors at once:

    let g:multi_cursor_start_word_key      = '<C-s>'
    let g:multi_cursor_select_all_word_key = '<A-s>'
    let g:multi_cursor_start_key           = 'g<C-s>'
    let g:multi_cursor_select_all_key      = 'g<A-s>'
    let g:multi_cursor_next_key            = '<C-s>'
    let g:multi_cursor_prev_key            = '<C-p>'
    let g:multi_cursor_skip_key            = '<C-x>'
    let g:multi_cursor_quit_key            = '<Esc>'

[ctrl-p](https://github.com/ctrlpvim/ctrlp.vim) mappings to easily find and open a file, buffer, etc.:

    map <leader>j :CtrlP<cr>
    map <C-b> :CtrlPBuffer<cr>

[vim-snipmate](https://github.com/garbas/vim-snipmate) mappings to autocomplete via snippets:

    ino <C-j> <C-r>=snipMate#TriggerSnippet()<cr>
    snor <C-j> <esc>i<right><C-r>=snipMate#TriggerSnippet()<cr>

[vim-surround](https://github.com/tpope/vim-surround) mappings to easily surround a string with `_()` gettext annotation:

    vmap Si S(i_<esc>f)
    au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>

[ale](https://github.com/dense-analysis/ale) to easily go to the next Ale syntax/lint error:

    nmap <silent> <leader>a <Plug>(ale_next_wrap)


### Spell checking
Pressing `<leader>ss` will toggle spell checking:

    map <leader>ss :setlocal spell!<cr>

Shortcuts using `<leader>` instead of special characters:

    map <leader>sn ]s
    map <leader>sp [s
    map <leader>sa zg
    map <leader>s? z=


### Cope
Query `:help cope` if you are unsure what cope is. It's super useful!

When you search with `Ack.vim`, display your results in cope by doing:
`<leader>cc`

To go to the next search result do:
`<leader>n`

To go to the previous search results do:
`<leader>p`

Cope mappings:

    map <leader>cc :botright cope<cr>
    map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
    map <leader>n :cn<cr>
    map <leader>p :cp<cr>


## How to uninstall
Just do following:
* Remove `~/.vim_runtime`
* Remove any lines that reference `.vim_runtime` in your `~/.vimrc`
