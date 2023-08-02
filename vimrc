let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

exe 'set runtimepath+=' . s:path
exe 'source ' . s:path . '/basic.vim'

"if exists('g:vscode')
"else
    exe 'source ' . s:path . '/plugins.vim'
"endif
