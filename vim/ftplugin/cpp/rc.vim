" folding for whole scope blocks
set foldmethod=expr
set foldexpr=getline(v:lnum)=~\"^[\ ]*///\"

" when writing C code, don't expand tabs to spaces
set noexpandtab

" fold the current brace block
nnoremap zz ?{<CR>zfa}

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
autocmd BufWritePre <buffer> call RemoveTrailingWhitespace()
