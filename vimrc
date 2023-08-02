let s:vim_runtime = fnamemodify(resolve(expand('<sfile>:p')), ':h')

exe 'set runtimepath+=' . s:vim_runtime
exe 'source ' . s:vim_runtime . '/basic.vim'
exe 'source ' . s:vim_runtime . '/plugins_basic.vim'

if exists('g:vscode')
else
    exe 'source ' . s:vim_runtime . '/plugins_extra.vim'
endif
