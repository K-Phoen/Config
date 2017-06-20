set nofoldenable

set wildignore+=*/app/cache/*

map <buffer> <F9> :!php %<CR>

" insert current namespace (stolen from willdurand config, which is based on ornicar work: http://github.com/ornicar)
nmap <buffer> <leader>n "%PdF/r;:%s#/#\\#g<CR>Inamespace  <ESC>d/[A-Z]<CR><ESC>:let @/=""<CR>

noremap <buffer> <Leader>oi :call PhpRefactorOptimizeUse()<CR>
noremap <buffer> <Leader>pr :call PhpRefactorRenameProperty()<CR>
noremap <buffer> <Leader>vr :call PhpRefactorRenameLocalVariable()<CR>
