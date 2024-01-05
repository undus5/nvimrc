""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load pathogen paths
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_runtime = expand('<sfile>:p:h')."/"
try
call pathogen#infect(s:vim_runtime.'/addons/plugins/{}')
call pathogen#helptags()
catch
endtry

if exists(":Tabularize")
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" toggle monochrom/colorful
nmap <C-m> :call ToggleColorful()<CR>

let s:lastcolor = "PaperColor"
function ToggleColorful()
if exists("g:colors_name")
    if g:colors_name != "quiet"
        let s:lastcolor = g:colors_name
        call SetColorScheme("quiet")
    else
        call SetColorScheme(s:lastcolor)
    endif
else
    call SetColorScheme("quiet")
endif
endfunction
