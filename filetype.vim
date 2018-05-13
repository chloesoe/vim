
"dhw Mon Jan 30 21:17:53 CET 2012
"syslog syntax highlighting 
"-->http://www.vim.org/scripts/script.php?script_id=419
augroup filetypedetect
  au! BufRead,BufNewFile /var/log/* set filetype=syslog
augroup END 
