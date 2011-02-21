" Preserve cursor position and last search while
" performing some injected action
function! Preserve(command)
	" Save last search and cursor position
	let _s = @/
	let l = line(".")
	let c = col(".")
	" do action
	execute a:command
	" restore
	let @/=_s
 	call cursor(l, c)
endfunction

" Remove whitespace from line endings
function! RemoveTrailingWhitespace()
	call Preserve("%s/\\s\\+$//e")
endfunction

" Determine if a file has mixed tab and spaces at the beginning of lines
function! TestForMixedTabsAndSpaces()
python << EOF
import vim
cb = vim.current.buffer
space_initiated = False
tab_initiated = False
least_initial_spaces = 50
for line in cb:
	if line.startswith(' '):
		spaceno = 0
		for character in line:
			if character == ' ':
				spaceno += 1
			else:
				break

		if spaceno < least_initial_spaces:
			least_initial_spaces = spaceno

		space_initiated = True

	elif line.startswith('\t'):
		tab_initiated = True

if space_initiated and tab_initiated:
	import sys
	vim.command("let b:mixed_tabs_spaces=1")
	vim.command('''echo "Mixed Spaces and Tabs"''')
elif tab_initiated:
	vim.command("let b:mixed_tabs_spaces=0")
	vim.command("set tabstop=3")
	vim.command("set shiftwidth=3")
	vim.command("set noexpandtab")
elif space_initiated:
	vim.command("let b:mixed_tabs_spaces=0")
	vim.command("set tabstop=%d" % least_initial_spaces)
	vim.command("set shiftwidth=%d" % least_initial_spaces)
	vim.command("set expandtab")
EOF
endfunction

" Search up the directory hierarchy for and load the first
" found cscope database file
function! LoadCScope()
	let db = findfile("cscope.out", ".;")
	if (!empty(db))
		let path = strpart(db, 0, match(db, "/cscope.out$"))
		set nocsveb " supress the 'duplicate connection' error
		echo "loading cscope: " . db . "" . path
		exe "cs add" . db . "" . path
		set csverb
	else
		echo "CSCOPE database not found"
	endif
	echo "->LoadCScope()"
endfunction

" Search up the directory hierarchy for and load ALL of the tags
" files found from the CWD to the root directory
function! LoadTags()
	let db = findfile("tags", ".;", -1)
	if (!empty(db))
		set tags=""
		echo "setting tags: " . join(db, ",")
		exe "set tags+=" . join(db, ",")
	else
		echo "no ctags found"
	endif
	echo "->LoadTags()"
endfunction

