noremap <F7> :!gjslint %<CR>
noremap <F9> :!node %<CR>
let g:syntastic_javascript_gjslint_conf = '--nojsdoc'
let g:syntastic_javascript_checker = 'gjslint'
let g:syntastic_auto_loc_list = 0   " not auto open/close the errors list
set shiftwidth=4 tabstop=4 softtabstop=4
