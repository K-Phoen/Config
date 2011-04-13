"Remove ALL autocommands for the current group.
:autocmd!

"Presentation
colorscheme delek
" cursor (line under it, reverse color)
set cursorline
" line number
" hi LineNr ctermfg=Darkgray guifg=#3D3D3D

if has("syntax")
	syntax on
endif

" Behaviors
set nocompatible
set encoding=utf-8
set backspace=indent,eol,start
set autoindent
set ruler
set number
set nobackup
set noswapfile

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" enable to move over lines with right and left arrows
set whichwrap=b,s,<,>,[,]

" redefine tabs
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Smart completion
function! SmartComplete()
	let line = getline('.')                         " curline
	let substr = strpart(line, -1, col('.')+1)      " from start to cursor
	let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
	let has_period = match(substr, '\.') != -1      " position of period, if any
	let has_slash = match(substr, '\/') != -1       " position of slash, if any
	if (!has_period && !has_slash)
		return "\<C-X>\<C-P>"                         " existing text matching
	elseif ( has_slash )
		return "\<C-X>\<C-F>"                         " file matching
	else
		return "\<C-X>\<C-O>"                         " plugin matching
	endif
endfunction

" Call smart completion when pressing Ctrl-Space
inoremap <C-Space> <c-r>=SmartComplete()<CR>
imap <C-@> <C-Space>

" status line
" set statusline=%F%m%=%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [LINE=%l]\ [Col=%v]\ [%p%%]
set laststatus=2

hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black
hi Modified guibg=orange guifg=black ctermbg=lightred ctermfg=black

function! MyStatusLine(mode)
    let statusline=""
    if a:mode == 'Enter'
        let statusline.="%#StatColor#"
    endif
    let statusline.="\(%n\)\ %f\ "
    if a:mode == 'Enter'
        let statusline.="%*"
    endif
    let statusline.="%#Modified#%m"
    if a:mode == 'Leave'
        let statusline.="%*%r"
    elseif a:mode == 'Enter'
        let statusline.="%r%*"
    endif
    let statusline .= "\ (Line %l/%L,\ Col %c)\ %P%=%h%w\ %y\ [%{&encoding}:%{&fileformat}]\ \ "
    return statusline
endfunction

au WinEnter * setlocal statusline=%!MyStatusLine('Enter')
au WinLeave * setlocal statusline=%!MyStatusLine('Leave')
set statusline=%!MyStatusLine('Enter')

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi StatColor guibg=orange ctermbg=lightred
  elseif a:mode == 'r'
    hi StatColor guibg=#e454ba ctermbg=magenta
  elseif a:mode == 'v'
    hi StatColor guibg=#e454ba ctermbg=magenta
  else
    hi StatColor guibg=red ctermbg=red
  endif
endfunction 

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black

" enable filetypes
filetype on
filetype plugin on

" Sauvegarde la session lors de la fermeture de vim
autocmd VimLeavePre * :mksession! ~/.stopped.vim

" Plugin specifics
"=================

" define my name for snipmate plugin
let g:snips_author = 'Kevin Gomez <contact@kevingomez.fr>'
let g:snips_company = ''

" activate symfony for php files
autocmd FileType php set ft=php.symfony

" language specifics
"===================

" php
autocmd FileType php noremap <F7> :!php -l %<CR>
autocmd FileType php noremap <F9> :!php %<CR>

" symfony
autocmd FileType php noremap <F8> :SfSwitchView <CR>

" javascript
autocmd FileType javascript noremap <F7> :!gjslint %<CR>
