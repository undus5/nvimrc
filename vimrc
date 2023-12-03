if has('win32')
    let s:vim_runtime = '~/.vim_runtime'
else
    let s:vim_runtime = fnamemodify(resolve(expand('<sfile>:p')), ':h')
endif

execute 'set runtimepath+=' . s:vim_runtime
execute 'source ' . s:vim_runtime . '/base.vim'
execute 'source ' . s:vim_runtime . '/plugins.vim'
