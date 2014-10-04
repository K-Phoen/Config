" disable folding
set nofoldenable

set textwidth=80
set colorcolumn=80

" preview in the browser
map <leader>md :!markdown % > /tmp/'%:t'.html && xdg-open /tmp/'%:t'.html<CR>
