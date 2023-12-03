""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load pathogen paths
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_runtime = expand('<sfile>:p:h')."/"
try
call pathogen#infect(s:vim_runtime.'/plugins/{}')
call pathogen#helptags()
catch
endtry


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set termguicolors
set background=dark
try
colorscheme PaperColor
catch
endtry


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 20
let g:ctrlp_show_hidden = 1
let g:ctrlp_map = '<Leader>f'
let g:ctrlp_custom_ignore = 'node_modules\|\.DS_Store\|\.git'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
let NERDTreeQuitOnOpen=1
let NERDTreeKeepTreeInNewTab=1
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '~'
nnoremap <C-e> :NERDTreeToggle<cr>
nnoremap <Leader>l :NERDTreeFind<cr>
" netrw
let g:netrw_dirhistmax=0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabular
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>t: :Tabularize /:\zs<CR>
vmap <Leader>t: :Tabularize /:\zs<CR>
