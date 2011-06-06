" HTML plugin extensions for Vim
" Maintainer: Wannes Meert
" Email: wannesm@gmail.com
" Version: 0.1

if exists('s:loaded')
	finish
endif
let s:loaded = 1

nn <buffer> ,v :w<cr>:!xmllint --valid --noout %<cr>
vno <buffer> <c-b> c<strong></strong><esc>9hp
vno <buffer> <c-e> c<em></em><esc>5hp
setl makeprg=open\ -a\ safari\ %:p

