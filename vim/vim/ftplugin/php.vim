set nofoldenable
set shiftwidth=4 tabstop=4 softtabstop=4

" vim-php-namespace
" =================

" insert "use" statements
inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
noremap <Leader>u :call PhpInsertUse()<CR>

" expand classname
inoremap <Leader>e <C-O>:call PhpExpandClass()<CR>
noremap <Leader>e :call PhpExpandClass()<CR>
