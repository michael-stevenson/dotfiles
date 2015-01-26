" Simply toggle editing between a header file and
" it's associated source file - presumes naming
" parity betwen the two.
silent! function! ToggleBetweenHeaderAndSourceFile()
	update
	if (expand("%:e") ==? "cpp")
		find %:t:r.h
	else
		find %:t:r.cpp
	endif
endfunction

nnoremap <leader>t :call ToggleBetweenHeaderAndSourceFile()<cr>

" Expand the word under the cursor into a 
" namespace scope..
" i.e. "blah" ->
" namespace blah {
" } // namespace blah
function! ExpandWordIntoNamespace()
python << EOF
import vim

selection = vim.current.range
print selection

stripped_line = vim.current.line
stripped_line.rstrip('\n')

header = None
footer = None

if len(stripped_line) == 0:
	header = '''namespace {'''
	footer = '''} // anonymous namespace'''
else:
	header = '''namespace %s {''' % stripped_line
	footer = '''} // namespace %s''' % stripped_line

vim.current.line = header

(row, col) = vim.current.window.cursor
vim.current.buffer[row:row] = []
row += 1
vim.current.buffer[row:row] = [ footer ]

EOF
endfunction

function! ClassSkeleton()
python <<EOF
import vim

(row, col) = vim.current.window.cursor
class_name = vim.current.line.rstrip('\n')
vim.current.line = "class {0}".format(class_name)

# you cannot add newlines into strings in this
# API - I think it messes with the cursor or
# something - the way that I've found you can
# do it safely is to add an array of strings
# which will become new buffer rows as below:

vim.current.buffer[row:row] = [
	"{",
	"	public:",
	"		explicit {0}();".format(class_name),
	"		~{0}();".format(class_name),
	"		{0}( const {0}& ) = delete;".format(class_name),
	"		{0}& operator=( const {0}& ) = delete;".format(class_name),
	"		{0}( {0}&& ) = delete;".format(class_name),
	"		{0}& operator=( {0}&& ) = delete;".format(class_name),
	"};"
]

EOF
endfunction

" Expand the word under the cursor into
" a C-style Header Guard
" i.e. "blah" ->
" #ifndef BLAH
" #define BLAH
" #endif // BLAH
function! ExpandWordIntoHeaderGuard()
python << EOF
import vim

curr_line = vim.current.line
pretty_curr_line = curr_line.rstrip('\n').upper()

IF_TAG = "#ifndef "
DEF_TAG = "#define "
END_TAG = "#endif // "

vim.current.line = IF_TAG + pretty_curr_line
(row, col) = vim.current.window.cursor
vim.current.buffer[row:row] = [ DEF_TAG + pretty_curr_line ]
row += 1
vim.current.buffer[row:row + 5] = []
row += 4
vim.current.buffer[row:row] = [ END_TAG + pretty_curr_line ]

EOF
endfunction

