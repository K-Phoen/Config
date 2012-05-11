autocmd FileType php noremap <F7> :!php -l %<CR>
autocmd FileType php noremap <F9> :!php %<CR>
autocmd FileType php noremap <C-b> :Bp<CR> " set/remove a breakpoint

" Symfony2 (default)
autocmd FileType sf2 set shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType twig set shiftwidth=4 tabstop=4 softtabstop=4
