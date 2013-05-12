" Author: Wannes Meert

"-- TEXT ---------------------------------------------------------------------

com! -nargs=0 -range TabToSpaces :silent <line1>,<line2>s/\%V\t/\=repeat(' ', &tabstop)/g | let @/ = ""


"-- WRAPPING -----------------------------------------------------------------

fu! ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap list
    "set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <D-Left>
    silent! nunmap <buffer> <D-Right>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
    silent! iunmap <buffer> <D-Left>
    silent! iunmap <buffer> <D-Right>
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    "set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <D-Left> g0
    noremap  <buffer> <silent> <D-Right> g$
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <D-Left> <C-o>g0
    inoremap <buffer> <silent> <D-Right> <C-o>g$
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction

noremap <silent> <Leader>w :call ToggleWrap()<CR>


"-- QUICKFIX -----------------------------------------------------------------

" Quickfix window toggle
fu! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  en
endf

com! -bang -nargs=? QFix cal QFixToggle(<bang>0)
nn  <silent>     <leader>q :QFix<cr>


"-- SYNTAX DEBUGING ----------------------------------------------------------

function! SyntaxStackPrint()
	for id in synstack(line("."), col("."))
		echo synIDattr(id, "name")
	endfor
endfunction

com! -nargs=0 SyntaxStack :call SyntaxStackPrint()
map <Leader>o :SyntaxStack<CR>


"-- VIMRC EDITING ------------------------------------------------------------

com! -nargs=0 Erc :tabedit $MYVIMRC
com! -nargs=0 Src :so $MYVIMRC

"-- SEARCHING ----------------------------------------------------------------

" Search for selected text, forwards or backwards.
" http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>


