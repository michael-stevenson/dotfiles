" General all-of-the-time settings
"###################################

" turn off vi compatability - enables lots of cool things
set nocompatible

set runtimepath+=$CFGDIR/vim

" turn on pathgen
" must be called before filetype detection is turned on!
execute pathogen#infect()

filetype plugin indent on

let g:signify_vcs_list = [ 'git' ]

set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum

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
set tabstop=2
set shiftwidth=2
set noexpandtab

" trying this out. I cant remember the last time that I
" actually needed to recover from a crashed session. 
" Probably, I'll end up reverting this right after I get
" burned ;)  screw-you future me..
set noswapfile

" show the line numbers
set relativenumber number

" can't think of a reason to make this 
" language specific..
set smartindent

" to see what's going on with spaces vs tabs
set listchars=tab:->,trail:$

" now that we have airline, turn on the status
" bar all of the time..
set laststatus=2

" full path in statusline
set statusline+=%F

" airline mods
let g:airline#extensions#hunks#enabled = 0

" set mapleader to a space
let g:mapleader=' '

" do filetype detection
filetype on

" enable filetype specific plugins
filetype plugin on

" load OS specific settings
if has("mac")
	runtime macrc.vim
elseif has("macunix")
	runtime macrc.vim
elseif has("unix")
	runtime unixrc.vim
endif

" Support for true colors in the terminal
" Bye-bye gvim.
if has("termguicolors")
	set termguicolors
endif

" Load some functions which are always useful
" This must come before we source the keybindings
" because they map some functions defined here
runtime functions.vim

" source our keybindings
runtime key_maps.vim

" Protect autocommand definitions so that they
" only get loaded once (:he autocmd).
" set verbose=9 " uncomment to test autocommands
if !exists("autocommands_loaded")
	let autocommands_loaded = 1
	runtime autocommands.vim
endif

" make it such that <leader>K will open a manpage
" for the word under the cursor
runtime! ftplugin/man.vim

let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_autoshowtag = 1


" Source anything in the home directory that ends in .vimrc,
" this allows customization by further, more specific, config
" repositories
let rcs = glob("`find $CFGDIR -name 'vimrc' -exec readlink -f {} +`", 0, 1)
for rc in rcs
	exe "source" fnameescape(rc)
endfor

" allow directory specific .vimrc files
set exrc
set secure
