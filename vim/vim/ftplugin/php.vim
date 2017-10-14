set nofoldenable

set wildignore+=*/app/cache/*

map <buffer> <F9> :!php %<CR>

" Omni-completion
autocmd FileType php setlocal omnifunc=phpactor#Complete

" Include use statement
map <Leader>u :call phpactor#UseAdd()<CR>

" Show information about "type" under cursor including current frame
nnoremap <silent><Leader>t :call phpactor#OffsetTypeInfo()<CR>

" Goto the definition of a class, or a class member (method, property, constant).
map <Leader>d :call phpactor#GotoDefinition()<CR>
