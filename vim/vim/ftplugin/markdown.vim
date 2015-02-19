" disable folding
set nofoldenable

set textwidth=80
set colorcolumn=80

" preview in the browser
map <buffer> <leader>md :!markdown % > /tmp/'%:t'.html && xdg-open /tmp/'%:t'.html<CR>

" enable spell checking
map <buffer> <leader>c :setlocal spell spelllang=en<CR>
