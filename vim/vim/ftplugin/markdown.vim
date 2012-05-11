" disable folding
autocmd FileType markdown set nofoldenable

autocmd FileType markdown set textwidth=80

" preview in the browser
autocmd FileType markdown  map <leader>md :!markdown % > /tmp/'%:t'.html && xdg-open /tmp/'%:t'.html<CR>
