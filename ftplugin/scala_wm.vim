
setl wildignore+=*.class

 "Set Make program
"setl makeprg=sbtnocolors
"setl makeprg=sbt\ run
"setl efm=%E\ %#[error]\ %f:%l:\ %m,%C\ %#[error]\ %p^,%-C%.%#,%Z,
       "\%W\ %#[warn]\ %f:%l:\ %m,%C\ %#[warn]\ %p^,%-C%.%#,%Z,
       "\%-G%.%#

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab


" Extend tagbar
" Scala {{{3
let g:tagbar_type_scala = {
  \ 'ctagstype' : 'Scala',
  \ 'kinds'     : [
      \ 'p:packages:1',
      \ 'V:values',
      \ 'v:variables',
      \ 'T:types',
      \ 't:traits',
      \ 'o:objects',
      \ 'a:aclasses',
      \ 'c:classes',
      \ 'r:cclasses',
      \ 'm:methods'
  \ ],
  \ 'sro'        : '.',
  \ 'kind2scope' : {
      \ 'T' : 'type',
      \ 't' : 'trait',
      \ 'o' : 'object',
      \ 'a' : 'abstract class',
      \ 'c' : 'class',
      \ 'r' : 'case class'
  \ },
  \ 'scope2kind' : {
      \ 'type'           : 'T',
      \ 'trait'          : 't',
      \ 'object'         : 'o',
      \ 'abstract class' : 'a',
      \ 'class'          : 'c',
      \ 'case class'     : 'r'
  \ }
\}




