autocmd FileType javascript noremap <F7> :!gjslint %<CR>
let g:syntastic_javascript_gjslint_conf = '--nojsdoc'
let g:syntastic_javascript_checker = 'jshint'
autocmd FileType javascript let g:syntastic_auto_loc_list = 0   " not auto open/close the errors list
