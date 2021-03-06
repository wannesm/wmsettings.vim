
setl wildignore+=*.aux,*.bbl,*.blg,*.brf,*.dvi,*.glg,*.glo,*.gls,*.ilg,*.ist,*.lof,*.lot,*.nlo,*.nls,*.out,*.gz,*.ps,*.idx,*.ind,*.toc

" Synctex
"map <silent> <leader>ls :silent !/Applications/Skim.app/Contents/SharedSupport/displayline
  "\ <c-r>=line('.')<cr> "<c-r>=LatexBox_GetOutputFile()<cr>" "%:p" <cr>

" Errorformat for latex (from manual)
"setl efm=%E!\ LaTeX\ %trror:\ %m,
	"\%E!\ %m,
	"\%+WLaTeX\ %.%#Warning:\ %.%#line\ %l%.%#,
	"\%+W%.%#\ at\ lines\ %l--%*\\d,
	"\%WLaTeX\ %.%#Warning:\ %m,
	"\%Cl.%l\ %m,
	"\%+C\ \ %m.,
	"\%+C%.%#-%.%#,
	"\%+C%.%#[]%.%#,
	"\%+C[]%.%#,
	"\%+C%.%#%[{}\\]%.%#,
	"\%+C<%.%#>%.%#,
	"\%C\ \ %m,
	"\%-GSee\ the\ LaTeX%m,
	"\%-GType\ \ H\ <return>%m,
	"\%-G\ ...%.%#,
	"\%-G%.%#\ (C)\ %.%#,
	"\%-G(see\ the\ transcript%.%#),
	"\%-G\\s%#,
	"\%+O(%f)%r,
	"\%+P(%f%r,
	"\%+P\ %\\=(%f%r,
	"\%+P%*[^()](%f%r,
	"\%+P[%\\d%[^()]%#(%f%r,
	"\%+Q)%r,
	"\%+Q%*[^()])%r,
	"\%+Q[%\\d%*[^()])%r


" Tabular settings

AddTabularPattern! latex_tabular /\(&\|\\\\\)/r1

" Spacing settings

setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal expandtab

" Tagbar settings

let g:tagbar_type_tex = {
\ 'ctagstype' : 'latex',
    \ 'kinds'     : [
        \ 's:sections',
        \ 'g:graphics:0:0'
    \ ],
    \ 'sort'    : 0
\ }

