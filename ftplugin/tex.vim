" Compile on startup
"autocmd VimEnter *.tex VimtexCompile

filetype plugin indent on

syntax enable

ALEDisable
let g:tex_comment_nospell = 1

set spell
syntax spell toplevel
set spelllang=en_gb
set shiftwidth=2
let g:tex_defaulttargetformat = 'pdf'

let g:tex_flavor='latex'
let g:Tex_CompileRule_pdf="mkdir -p log;"
    \. "pdflatex -file-line-error -interaction=nonstopmode -output-directory=log $*;"
    \. "bibtex log/%:r;"
    \. "makeindex log/%:r.idx;"
    \. "pdflatex -file-line-error -interaction=nonstopmode -output-directory=log $*;"
    \. "mv log/*.pdf ."
