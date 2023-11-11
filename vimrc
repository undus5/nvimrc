let s:vim_runtime = fnamemodify(resolve(expand('<sfile>:p')), ':h')

exe 'set runtimepath+=' . s:vim_runtime
exe 'source ' . s:vim_runtime . '/base.vim'
exe 'source ' . s:vim_runtime . '/plugins.vim'
