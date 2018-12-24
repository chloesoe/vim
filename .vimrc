"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" .vimrc by @chloesoe
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" settings for Gvim and terminal Vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_running')
    colorscheme peachpuff
    set columns=180
    set lines=82
    "map ctrl-tab to switch splits in terminal mode
    nmap <silent> <C-Tab> :wincmd w<CR>
    if has('unix')
        "open fullscreen on linux
        autocmd GUIEnter * call system('wmctrl -i -b add,maximized_vert,maximized_horz -r '.v:windowid)
    elseif has('win32')
        "open fullscreen on windows
        au GUIEnter * simalt ~x
    endif
else
    "colorscheme industry
    colorscheme evening
    "map tab to switch splits in terminal mode
    nmap <silent> <Tab> :wincmd w<CR>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set some defaults
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set laststatus=2        "statusline at the bottom of Vim
set nowrap              "no line wrap by default
set linebreak           "if text is wrapped, then wrap whole words
set incsearch           "incremental search
set hlsearch            "hilight search
set mousemodel=popup    "context menu in GVim
set nocompatible
set history=100
set showcmd
set statusline=%f%m\ %=L:%l/%L\ %c\ (%p%%)
set showmatch           "show matchin bracket
set list listchars=tab:\ \ ,trail:·     "show space at last line
set shortmess+=I        " Don't show welcome screen
set guioptions-=T       " Hide the toolbar
set backup
set backupdir^=~/.vim/temp/vim_backup "put all backup files files together in one place
set directory^=~/.vim/temp/vim_swap   "put all swap files together in one place
set undofile
set undodir=~/.vim/temp/vim_undo
set shiftwidth=4
set softtabstop=4
set fileformats=unix,dos
set printdevice=BrotherLAN
"set guifont=CourierNew\ 10
set guifont=Monospace\ Regular\ 10
"with uppercase W save file with sudo
command W w !sudo tee % > /dev/null



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Close all folds when opening a new buffer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufRead * setlocal foldmethod=marker
autocmd BufRead * normal zM


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"mapleader comma, standard is backslash and on DE-CH keyboards not easy to
"type. Mapleader is used e.g. for LaTeX to generate the pdf with <mapleader>ll
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=','
let maplocalleader=','


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Vundle settings, see https://github.com/VundleVim/Vundle.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'vim-latex/vim-latex'
Plugin 'vim-ruby/vim-ruby'
Plugin 'ekalinin/Dockerfile.vim.git'
Plugin 'tmhedberg/matchit'
Plugin 'freitass/todo.txt-vim'
Plugin 'fidian/hexmode'
Plugin 'lilydjwg/colorizer'
Plugin 'mrtazz/simplenote.vim'
Plugin 'jlanzarotta/bufexplorer'

"Git support
Plugin 'tpope/vim-fugitive'
Plugin 'kablamo/vim-git-log'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Generic Programming Support (recommended by https://coderoncode.com/tools/2017/04/16/vim-the-perfect-ide.html)
Plugin 'vim-syntastic/syntastic'
Plugin 'Townk/vim-autoclose'
"
" Markdown / Writting
Plugin 'reedes/vim-pencil'
Plugin 'tpope/vim-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'LanguageTool'

call vundle#end()
filetype plugin indent on
"end Vundle settings


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" remember last position
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set defaults for different file types
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('modifiable')
    au BufRead,BufNewFile  *.txt    set textwidth=80 | set expandtab | set softtabstop=4 | set fileformat=dos
endif

au FileType	       vim	set expandtab | set number
au FileType            tex      set expandtab | set softtabstop=4 | set autoindent | set wrap | set number | set number | set shiftwidth=2 | let g:Tex_DefaultTargetFormat = 'pdf' | TTarget pdf
au BufRead,BufNewFile  *.cal    set expandtab | set softtabstop=4 | set autoindent
au BufRead,BufNewFile *.htm,*.html,*.css,*.php  set expandtab | set shiftwidth=2 | set number | set autoindent



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" spellcheck
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"start German spell check with F7
map <F7> :setlocal spell spelllang=de_ch <return>
"start English spell check with Shift-F7
map <S-F7>  :setlocal spell spelllang=en_gb <return>
"jump to next with F8
map <F8> ]s
"jump to previous with Shitf-F8
map <S-F8> [s
"F9 shows suggestions
map <F9> z=
"accept suggestion with Shift-F9
map <S-F9> z=


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LaTeX count words and chars in a range
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings for LaTeX
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on
if has('gui_running')
    set grepprg=grep\ -nH\ $*
    filetype indent on
    let g:tex_flavor='latex'
    "logs output to log file: http://tex.stackexchange.com/questions/341243/vimlatex-compilation-output-in-sub-folder-and-quickfix-window
    let g:Tex_CompileRule_pdf="mkdir -p log; pdflatex -interaction=nonstopmode -output-directory=log $*; mv log/*.pdf $PWD"
    "let g:Tex_CompileRule_pdf="mkdir -p ~/tmp/latexlog; pdflatex -interaction=nonstopmode -output-directory=/home/dhw/tmp/latexlog $*; mv /home/dhw/tmp/latexlog/*.pdf $PWD"
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" from github.com/Integralist/ProVim.git
" Change colourscheme when diffing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fun! SetDiffColors()
    highlight DiffAdd    cterm=bold ctermfg=white ctermbg=DarkGreen
    highlight DiffDelete cterm=bold ctermfg=white ctermbg=DarkGrey
    highlight DiffChange cterm=bold ctermfg=white ctermbg=DarkBlue
    highlight DiffText   cterm=bold ctermfg=white ctermbg=DarkRed
endfun
autocmd FilterWritePre * call SetDiffColors()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos="right"
let g:NERDTreeWinSize=50
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
autocmd VimEnter * NERDTree         "start NERDTree on startup
autocmd VimEnter * wincmd p         "Jump to the main window.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Simplenote settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.simplenote/credentials.vim
let g:SimplenoteVertical=1
