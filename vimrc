" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=light

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
if has("autocmd")
    filetype indent on
endif

if has("autocmd") 
    autocmd Filetype java setlocal omnifunc=javacomplete#Complete 
endif 

set autoread

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes) in terminals

" Source a global configuration file if available
" XXX Deprecated, please move your changes here in /etc/vim/vimrc
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" largeur de colonne
set textwidth=80

" Afficher les numéros de lignes
set number

" Folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

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

" Indentation automatique
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Sauvegarde la session lors de la fermeture de vim
autocmd VimLeavePre * :mksession! ~/.stopped.vim

" UTF8
if has("multi_byte")
    set encoding=utf-8
    setglobal fileencoding=utf-8
endif
