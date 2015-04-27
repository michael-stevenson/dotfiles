" Automatically change the CWD to the current
" buffer's directory.  This way, when we do a
" :shell, we will always be in the right place.
autocmd BufEnter * cd %:p:h

" VIM does a good job of figuring out file types,
" but doesn't treat capital C or H as C++, rather,
" they are treated as C files.  There is a 'feature'
" called fname_case which changes this behavior,
" but for now, I've been unable to figure out how
" to change it (might require a recompile or something).
" So, in the interest of going down the path of least
" resistance, I'm just man-handling it here .. 
autocmd BufEnter *.[CH] setf cpp

autocmd BufEnter *.bnf set ft=ebnf
autocmd BufEnter *.abnf set ft=abnf
autocmd BufEnter *.zshrc set ft=zsh
autocmd BufEnter *.zshenv set ft=zsh

" source vimrc and local.vimrc after modifying
" them .. so that changes take effect immediately
autocmd BufWritePost $MYVIMRC so $MYVIMRC
autocmd BufWritePost .vimrc so $MYVIMRC
autocmd BufWritePost vimrc so $MYVIMRC
autocmd BufWritePost .local.vimrc so $MYVIMRC
autocmd BufWritePost .vim/* so $MYVIMRC
