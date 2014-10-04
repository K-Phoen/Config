set textwidth=80
set colorcolumn=80

set spell
set spelllang=fr

" make and open
map <leader>b :!make && xdg-open '%:r'.pdf<CR><CR>
