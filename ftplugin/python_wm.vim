
map <D-r> :!%:p<CR>

setl noet makeprg=python\ -t\ \"%:p\"

setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab

" Show python help
" http://vim.wikia.com/wiki/Access_Python_Help
nnoremap <buffer> K :<C-u>let save_isk = &iskeyword \|
    \ set iskeyword+=. \|
    \ execute "!pydoc " . expand("<cword>") \|
    \ let &iskeyword = save_isk<CR>

