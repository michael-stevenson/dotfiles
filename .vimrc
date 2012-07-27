" General all-of-the-time settings
"###################################

" turn off vi compatability - enables lots of cool things
set nocompatible

" turn on pathgen
" must be called before tiletype
" detection is turned on!
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" colors
colo desert_modified
"colo 256_xoria

" code completion formation
set completeopt=menu,preview

" show the cursor position in the bottom right
set ruler

" turn off visual line wrapping
set nowrap

" turn on highlighted searches
set hlsearch

" Some reasonable defaults
set tabstop=4
set shiftwidth=4
set noexpandtab

" show the line numbers
set number

" can't think of a reason to make this 
" language specific..
set smartindent

" to see what's going on with spaces vs tabs
set listchars=tab:->,trail:$

" set mapleader to a space
let g:mapleader=' '

" do filetype detection
filetype on

" enable filetype specific plugins
filetype plugin on

" load OS specific settings
if has("mac")
	so ~/.vim/macrc.vim
elseif has("macunix")
	so ~/.vim/macrc.vim
elseif has("unix")
	so ~/.vim/unixrc.vim
endif

" Load some functions which are always useful
" This must come before we source the keybindings
" because they map some functions defined here
so ~/.vim/functions.vim

" source our keybindings
so ~/.vim/key_maps.vim

" Protect autocommand definitions so that they
" only get loaded once (:he autocmd).
" set verbose=9 " uncomment to test autocommands
if !exists("autocommands_loaded")
	let autocommands_loaded = 1
	so ~/.vim/autocommands.vim
endif

" make it such that <leader>K will open a manpage
" for the word under the cursor
runtime! ftplugin/man.vim

let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_autoshowtag = 1

" If a directory contains a 'local' rc file, 
" source it .. 
if filereadable(fnamemodify("~/.local.vimrc", ":p"))
	so ~/.local.vimrc
endif
