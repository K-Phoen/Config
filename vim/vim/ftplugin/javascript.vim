noremap <F7> :!gjslint %<CR>
noremap <F9> :!node %<CR>
let g:syntastic_javascript_gjslint_conf = '--nojsdoc'
"let g:syntastic_javascript_checker = 'jshint'
let g:syntastic_auto_loc_list = 0   " not auto open/close the errors list
