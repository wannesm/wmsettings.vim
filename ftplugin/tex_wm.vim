
setl wildignore+=*.aux,*.bbl,*.blg,*.brf,*.dvi,*.glg,*.glo,*.gls,*.ilg,*.ist,*.lof,*.lot,*.nlo,*.nls,*.out,*.gz,*.ps,*.idx,*.ind,*.toc

" Synctex
map <silent> <leader>ls :silent !/Applications/Skim.app/Contents/SharedSupport/displayline
  \ <c-r>=line('.')<cr> "<c-r>=LatexBox_GetOutputFile()<cr>" "%:p" <cr>

" Errorformat for latex (from manual)
setl efm=%E!\ LaTeX\ %trror:\ %m,
	\%E!\ %m,
	\%+WLaTeX\ %.%#Warning:\ %.%#line\ %l%.%#,
	\%+W%.%#\ at\ lines\ %l--%*\\d,
	\%WLaTeX\ %.%#Warning:\ %m,
	\%Cl.%l\ %m,
	\%+C\ \ %m.,
	\%+C%.%#-%.%#,
	\%+C%.%#[]%.%#,
	\%+C[]%.%#,
	\%+C%.%#%[{}\\]%.%#,
	\%+C<%.%#>%.%#,
	\%C\ \ %m,
	\%-GSee\ the\ LaTeX%m,
	\%-GType\ \ H\ <return>%m,
	\%-G\ ...%.%#,
	\%-G%.%#\ (C)\ %.%#,
	\%-G(see\ the\ transcript%.%#),
	\%-G\\s%#,
	\%+O(%f)%r,
	\%+P(%f%r,
	\%+P\ %\\=(%f%r,
	\%+P%*[^()](%f%r,
	\%+P[%\\d%[^()]%#(%f%r,
	\%+Q)%r,
	\%+Q%*[^()])%r,
	\%+Q[%\\d%*[^()])%r

let g:LatexBox_cite_pattern = '\\\(paren\|text\)\?cite\(p\|t\)\?\*\?\_\s*{'

" Tabular settings

AddTabularPattern! latex_tabular /\(&\|\\\\\)/

