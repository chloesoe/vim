if has('gui_running')
    colorscheme peachpuff
    set columns=120
    set lines=42
else
    colorscheme industry
endif
set laststatus=2

set nowrap
set linebreak
set incsearch
set hlsearch
set incsearch
set mousemodel=popup   "context menu in GVim

syntax on

"mapleader comma, standard is backslash and on DE-CH keyboards not easy to
"type. Mapleader is used e.g. for LaTeX to generate the pdf with <mapleader>ll
let mapleader=','
let maplocalleader=','

set nocompatible 

"Vundle settings, dhw 17. Apr 2017, see https://github.com/VundleVim/Vundle.vim
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'scrooloose/nerdtree.git'
  Plugin 'vim-latex/vim-latex'
"  Plugin 'lervag/vimtex' "(alternative LaTeX plugin)
  Plugin 'itchyny/calendar.vim'
  Plugin 'aaronbieber/vim-quicktask.git'
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'ekalinin/Dockerfile.vim.git'
  Plugin 'tmhedberg/matchit'
  Plugin 'tpope/vim-fugitive'
  Plugin 'freitass/todo.txt-vim'
  Plugin 'fidian/hexmode'
  Plugin 'lilydjwg/colorizer'
call vundle#end()
filetype plugin indent on
"end Vundle settings

"from ProVim
    set history=100
    set showcmd
    " Set the status line to something useful
    set statusline=%f%m\ %=L:%l/%L\ %c\ (%p%%)
    set showmatch
    set list listchars=tab:\ \ ,trail:·
    " Don't show welcome screen
    set shortmess+=I
    " Hide the toolbar
    set guioptions-=T
    " Close all folds when opening a new buffer
    autocmd BufRead * setlocal foldmethod=marker
    autocmd BufRead * normal zM
"end from ProVim

"remember last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

set backup
set backupdir^=~/.vim/temp/vim_backup "put all backup files files together in one place
set directory^=~/.vim/temp/vim_swap   "put all swap files together in one place
set undofile
set undodir=~/.vim/temp/vim_undo

set shiftwidth=4
set softtabstop=4
set fileformats=unix,dos


if has('modifiable')
	au BufRead,BufNewFile  *.txt    set textwidth=80 | set expandtab | set softtabstop=4 | set fileformat=dos
endif

au FileType	       vim	set expandtab | set number
au BufRead,BufNewFile  *.c      set number 
au FileType            tex      set expandtab | set softtabstop=4 | set autoindent | set wrap | set number | set number | set shiftwidth=2 | let g:Tex_DefaultTargetFormat = 'pdf' | TTarget pdf
"au BufRead,BufNewFile  *.tex    let g:Tex_DefaultTargetFormat = 'pdf'
"au BufRead,BufNewFile  *.tex    set wrap | set number | set textwidth=80 | set relativenumber | set number
au BufRead,BufNewFile  *.cal    set expandtab | set softtabstop=4 | set autoindent
au BufRead,BufNewFile *.htm,*.html,*.css,*.php  set expandtab | set shiftwidth=2 | set number | set autoindent

set printdevice=BrotherLAN
"set guifont=CourierNew\ 10
set guifont=Monospace\ Regular\ 10


map <c-tab> <c-w>w
command W w !sudo tee % > /dev/null

"Abschnitt Rechtschreibung Start
       "Deutsche Rechtschreibung mit F7 starten
       map <S-F7> :setlocal spell! spelllang=de_ch <return>
       "Englische Rechtschreibung mit Shift+F7 starten
       map <C-F7>  :setlocal spell spelllang=en_gb <return>
       "zum nÃ¤chsten Fehler springen mit F7
       map <F8> ]s
       "zum vorherigen Fehler springen mit Shift-F7
       map <S-F8> [s
       "VerbesserungsvorschlÃ¤ge anzeigen mit F
       map <F9> z=
       "nächster/vorheriger Spellchekc
       map <F3>  ]s
       map <S-F3> [s
       "übernehmen
       map <F4>  z=
"Abschntt Rechtschreibung Ende


" LaTeX Wörter und Zeichen in einem Range zählen
command! -range -nargs=0 LaTeXWordCount call CountLaTeXWords(<line1>,<line2>)
function! CountLaTeXWords(startline, endline)
    if a:startline != a:endline
        exec a:startline "," a:endline " w !detex | wc -w"
    else
        exec " w !detex | wc -w"
    endif
endfunction
command! -range -nargs=0 LaTeXCharCount call CountLaTeXChars(<line1>,<line2>)
function! CountLaTeXChars(startline, endline)
    if a:startline != a:endline
        exec a:startline "," a:endline " w !detex | wc -m"
    else
        exec " w !detex | wc -m"
    endif
endfunction
"Ende LaTeX Wörter und Zeichen in einem Range zählen
" Settings for LaTeX
filetype plugin on
if has('gui_running')
    set grepprg=grep\ -nH\ $*
    filetype indent on
    let g:tex_flavor='latex'
    "logs output to log file: http://tex.stackexchange.com/questions/341243/vimlatex-compilation-output-in-sub-folder-and-quickfix-window
    let g:Tex_CompileRule_pdf="mkdir -p log; pdflatex -interaction=nonstopmode -output-directory=log $*; mv log/*.pdf $PWD"
    "let g:Tex_CompileRule_pdf="mkdir -p ~/tmp/latexlog; pdflatex -interaction=nonstopmode -output-directory=/home/dhw/tmp/latexlog $*; mv /home/dhw/tmp/latexlog/*.pdf $PWD"
endif


"calendar.vim definitionen
let g:calendar_monday = 1
" Deutsche Monate und Wochentage (auskommentieren wenn Englische gewünscht)
       let g:calendar_mruler = 'Jan,Feb,Mär,Apr,Mai,Jun,Jul,Aug,Sep,Okt,Nov,Dez'
       let g:calendar_wruler = 'So Mo Di Mi Do Fr Sa'
       let g:calendar_mark = 'right'
       let g:calendar_weeknm = 3 " KW01
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1



" from github.com/Integralist/ProVim.git
" Change colourscheme when diffing
fun! SetDiffColors()
  highlight DiffAdd    cterm=bold ctermfg=white ctermbg=DarkGreen
  highlight DiffDelete cterm=bold ctermfg=white ctermbg=DarkGrey
  highlight DiffChange cterm=bold ctermfg=white ctermbg=DarkBlue
  highlight DiffText   cterm=bold ctermfg=white ctermbg=DarkRed
endfun
autocmd FilterWritePre * call SetDiffColors()


let NERDTreeShowHidden=1

" copy and paste from clipboard
vmap <leader>y "*y
nmap <leader>p "*p
