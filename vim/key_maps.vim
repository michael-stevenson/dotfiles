" map = map in all modes
" nmap = map in 'normal mode' only (i.e. command mode)
" vmap = map in both visual & select mode
" xmap = map in visual mode
" smap = map in select mode
" imap = map in insert (and replace) mode
" omap = map in 'operator pending' mode



" shift-space-space
" (remap to ESC)
" ---
set imdisable " not sure why this is necessary - can't get it to work otherwise
imap <S-Space><S-Space> <ESC>
imap 22 <ESC>

" shift-space
" (catch accidental Shift-space hits)
" ---
imap <S-Space> <Space>
imap 2 <Space>

" shift-w
" (switch splits)
" ---
nmap <S-w> <C-w>w
nmap <S-J> :5winc -<CR>
nmap <S-K> :5winc +<CR>
nmap <S-L> :5winc ><CR>
nmap <S-H> :5winc <<CR>

map <F2> :BufExplorer<CR>
nnoremap <silent> <F3> :Explore<CR>
nnoremap <silent> <F9> :TagbarToggle<CR>

" white
" (type 'white' to remove white space)
" ---
nmap <silent> white :call RemoveTrailingWhitespace()<CR>

" tab
" (type 'tab' to determine tab settings)
" ---
nmap <silent> tab :call TestForMixedTabsAndSpaces()<CR>

