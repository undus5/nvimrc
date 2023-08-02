""""""""""""""""""""""""""""""
" => Load pathogen paths
""""""""""""""""""""""""""""""
let s:vim_runtime = expand('<sfile>:p:h')."/"
call pathogen#infect(s:vim_runtime.'/plugins_basic/{}')
call pathogen#helptags()