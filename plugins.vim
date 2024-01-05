""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load pathogen paths
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_runtime = expand('<sfile>:p:h')."/"
try
call pathogen#infect(s:vim_runtime.'/addons/plugins/{}')
call pathogen#helptags()
catch
endtry

nmap <Leader>== :Tabularize /=<CR>
vmap <Leader>== :Tabularize /=<CR>
nmap <Leader>;; :Tabularize /:\zs<CR>
vmap <Leader>;; :Tabularize /:\zs<CR>

" toggle monochrome/colorful
nmap <Leader>h :call ToggleColorful()<CR>

let s:colorful_color   = "PaperColor"
let s:monochrome_color = "quiet"
let s:lastcolor        = s:colorful_color

function ToggleColorful()
if exists("g:colors_name")
    if g:colors_name == s:colorful_color
        let s:lastcolor = g:colors_name
        call SetColorScheme(s:monochrome_color)
    else
        call SetColorScheme(s:lastcolor)
    endif
else
    call SetColorScheme(s:monochrome_color)
endif
endfunction
