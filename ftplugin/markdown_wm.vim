" Markdown plugin extensions for Vim
" To be used together with vim-markdown from tpope
" Maintainer: Wannes Meert
" Email: wannesm@gmail.com
" Version: 0.1

if exists('s:loaded')
	finish
endif
let s:loaded = 1

" PREVIEW
"if executable("wmmarkdown")
	"setl makeprg=wmmarkdown\ %:p
"elseif executable("rdiscount")
	"setl makeprg=rdiscount\ %:p\ >\ /tmp/mkd.html;\ open\ -a\ safari\ /tmp/mkd.html
"else
	"echo "No markdown interpreter found on your system"
"endif


" SETTINGS
set ai formatoptions=tcroqn2 comments=n:>


" Location of support folder
" let g:WMMarkdown_support = expand("<sfile>:h:h:h") . '/support/css'

" KEY MAPPINGS
"map <silent> <leader>ll :silent !wmmarkdown %:p<CR>
map <leader>ll :silent !wmmarkdown %:p<CR>

