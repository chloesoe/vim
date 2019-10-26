"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax for todo.txt for file type *.todo
" @chloesoe 26.10.19
" inspired by https://stackoverflow.com/a/11666247/7311363
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup todotxt
  au!
  autocmd BufNewFile,BufRead,BufReadPost *.todo set filetype=todo
augroup END

