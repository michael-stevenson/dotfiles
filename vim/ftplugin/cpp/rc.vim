" I used to set this to:
"set foldmethod=expr
"set foldexpr=getline(v:lnum)=~\"^[\ ]*///\"
" but recently vim has been complaining that the zf{motion}
" command will only work with this set to manual or marker,
" not sure how it ever worked before ..
set foldmethod=manual

" when writing C code, don't expand tabs to spaces
set noexpandtab

" make sure that syntax coloring is on
syntax enable

" fold the current brace block
nnoremap zz /}<CR>%zfa}

" block comments automation
" bc = block comment from 'a to current line
" uc = uncomment  from 'a to 'b
" fc = FORCE comment from 'a to current line (i.e. use // instead of /* )
nnoremap bc o<ESC>:'a,. s/^/*/<CR><S-a>/<ESC>'a<S-^>i/<ESC>:noh<CR>
nnoremap uc mb:'a,'b s/\///<CR>:'a,'b s/^*//<CR>:'a,'b s/^\///<CR>dd
nnoremap fc o<ESC>:'a,. s/^/\/\//<ESC>:noh<CR>


" Source some C++ specific functions
"so ~/.vim/cpp/functions/expand_namespace
nnoremap ns :call ExpandWordIntoNamespace()<CR>
vnoremap ns :call ExpandWordIntoNamespace()<CR>

"so ~/.vim/cpp/functions/guard_header
nnoremap def :call ExpandWordIntoHeaderGuard()<CR>

" Remove trailing whitespace for cpp files before
" committing buffer to disk
" autocmd BufWritePre <buffer> call RemoveTrailingWhitespace()
"

" Shift-n goes to the next tag in the tag stack
" Shift-m goes to the previous
nnoremap <S-n> :tn<CR>
nnoremap <S-m> :tp<CR>

" Ctrl-l brings up the tag list for the word under the cursor
" Just found that you can do the same thing with g],
" or, even better, jump directly if there is only one match or
" bring up the list if >1 with g<C-]>
" nnoremap <C-L> :tselect <C-R><C-W><CR>
nnoremap <C-]> g<C-]>
