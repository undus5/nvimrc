if has('win32')
    let s:vimrcs = '~/.vimrcs'
else
    let s:vimrcs = fnamemodify(resolve(expand('<sfile>:p')), ':h')
endif

exe 'set runtimepath+=' . s:vimrcs
exe 'source ' . s:vimrcs . '/base.vim'
exe 'source ' . s:vimrcs . '/plugins.vim'
