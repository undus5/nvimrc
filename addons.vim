""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load pathogen paths
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_runtime = expand('<sfile>:p:h')."/"
try
call pathogen#infect(s:vim_runtime.'/plugins/{}')
call pathogen#helptags()
catch
endtry

" colorscheme
try
colorscheme PaperColor
catch
endtry
