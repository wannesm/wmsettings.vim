" HTML plugin extensions for Vim
" Maintainer: Wannes Meert
" Email: wannesm@gmail.com
" Version: 0.1

if exists('s:loaded')
	finish
endif
let s:loaded = 1

setlocal tabstop=2
setlocal softtabstop=2
setlocal expandtab

" Disable auto indenting
setlocal noautoindent
setlocal nocindent
setlocal nosmartindent
setlocal indentexpr=

nn <buffer> ,v :w<cr>:!xmllint --valid --noout %<cr>
vno <buffer> <c-b> c<strong></strong><esc>9hp
vno <buffer> <c-e> c<em></em><esc>5hp
setl makeprg=open\ -a\ safari\ %:p


" TAGBAR SUPPORT

let g:tagbar_type_html = {
	\ 'ctagstype' : 'html',
	\ 'sort'      : 0,
	\ 'kinds'     : [
		\ 'h:headings'
	\ ],
	\ 'sro'       : ':',
	\ 'kind2scope': {
	\ },
	\ 'scope2kind' : {
	\}
\ }

