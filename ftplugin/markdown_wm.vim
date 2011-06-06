" Markdown plugin extensions for Vim
" To be used together with vim-markdown from tpope
" Maintainer: Wannes Meert
" Email: wannesm@gmail.com
" Version: 0.1

if exists('s:loaded')
	finish
endif
let s:loaded = 1

if executable("wmmarkdown")
	setl makeprg=wmmarkdown\ %:p
elseif executable("rdiscount")
	setl makeprg=rdiscount\ %:p\ >\ /tmp/mkd.html;\ open\ -a\ safari\ /tmp/mkd.html
else
	echo "No markdown interpreter found on your system"
endif

