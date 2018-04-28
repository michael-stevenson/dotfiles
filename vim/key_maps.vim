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
imap <M-F12><M-F12> <ESC>
" catch early release of the modifier key
imap <M-F12><space> <ESC>

" shift-space
" (catch accidental Shift-space hits)
" ---
imap <M-Space> <Space>

" shift-w
" (switch splits)
" ---
nmap <S-w> <C-w>w
nnoremap <M-F17>j <C-w>j
nnoremap <M-F17>h <C-w>h
nnoremap <M-F17>k <C-w>k
nnoremap <M-F17>l <C-w>l
" nmap <S-J> :5winc -<CR>
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

