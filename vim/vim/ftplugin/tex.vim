set textwidth=80
set colorcolumn=80

set spell
set spelllang=fr

" make and open
map <buffer> <F9> :!make && xdg-open '%:r'.pdf<CR><CR>
