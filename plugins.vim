""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load pathogen paths
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_runtime = expand('<sfile>:p:h')."/"
try
call pathogen#infect(s:vim_runtime.'/addons/plugins/{}')
call pathogen#helptags()
catch
endtry


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:monochrome_color = "quiet"
let s:colorful_color   = "PaperColor"

call SetColorScheme(s:monochrome_color)

" toggle monochrome/colorful
nmap <Leader>h :call ToggleColorful()<CR>

function ToggleColorful()
if exists("g:colors_name")
    if g:colors_name == s:colorful_color
        call SetColorScheme(s:monochrome_color)
    else
        call SetColorScheme(s:colorful_color)
    endif
else
    call SetColorScheme(s:colorful_color)
endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tabular
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>== :Tabularize /=<CR>
vmap <Leader>== :Tabularize /=<CR>
nmap <Leader>;; :Tabularize /:\zs<CR>
vmap <Leader>;; :Tabularize /:\zs<CR>
