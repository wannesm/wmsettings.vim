" C++ plugin extensions for Vim
" Maintainer: Wannes Meert
" Email: wannesm@gmail.com
" Version: 0.1

if exists('s:loaded')
	finish
endif
let s:loaded = 1

" clang_completion
let g:clang_complete_copen=1

" OmniCppCompletion
" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/boost
" build tags of your own project with CTRL+F12
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" OmniCppComplete
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 0 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif


" Outline with tabs and spaces
fu! WMOutlineWithTabsAndSpaces(startl, stopl)
	"echo "start=" . a:startl . "&stop=" . a:stopl
	let tabspaces = repeat(' ', &tabstop)
	let firstline = getline(a:startl) " get first line of selection
	let prefix = matchstr(firstline, "^[\t ]*")
	let prefixlen = len(substitute(prefix, "\t", tabspaces, "g"))
	let deflen = match(substitute(firstline, "\t", tabspaces, "g"), "\(")
	if deflen == -1
		let deflen = match(substitute(firstline, "\t", tabspaces, "g"), "= ")
		if deflen == -1
			echoerr "Not a function (no bracket found) or assignment (no =<space> found)"
			return
		else
			let deflen = deflen + 2 - prefixlen
		endif
	else
		let deflen = deflen + 1 - prefixlen
	endif
	let nprefix = prefix . repeat(" ", deflen)
	if len(firstline) > 80
		let ntext = substitute(firstline, "\\([,;]\\)[ ]*\\(\\S\\)", "\\1\n" . nprefix . "\\2", "g") . "\n"
	else
		let ntext = firstline . "\n"
		if a:startl == a:stopl
			return
		endif
	endif
	let lnum = a:startl + 1
	while lnum <= a:stopl
		let nline = substitute(getline(lnum), "^[\t ]*", nprefix, "")
		let ntext = ntext . substitute(nline, "\\([,;]\\)[ ]*\\(\\S\\)", "\\1\n" . nprefix . "\\2", "g") . "\n"
		let lnum = lnum + 1
	endwhile
	"echo ntext
	exe a:startl . "," . a:stopl . "delete"
	let @0 = ntext
	exe a:startl . "put! 0"
	"exe "normal d\\\"0P"
	"execute a:startl.",".a:stopl." change <C-R>=@0"
endfu
com! -range -nargs=0 WMOutlineWithTabsAndSpaces :silent call WMOutlineWithTabsAndSpaces(<line1>, <line2>)

