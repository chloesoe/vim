"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" .vimrc by @chloesoe
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set nocompatible        "no Vi compatible support

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" settings for Gvim and terminal Vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_running')
    colorscheme peachpuff
    "map ctrl-tab to switch splits in terminal mode
    nmap <silent> <C-Tab> :wincmd w<CR>
    if has('unix')
        "open fullscreen on linux
        " autocmd GUIEnter * call system('wmctrl -i -b add,maximized_vert,maximized_horz -r '.v:windowid)
        " set lines=999 columns=999
        " below command from https://stackoverflow.com/a/37226932/7311363
        autocmd VimEnter * call system('wmctrl -i -b add,maximized_vert,maximized_horz -r '.v:windowid)
    elseif has('win32')
        "open fullscreen on windows
        au GUIEnter * simalt ~x
    endif
"    set columns=180
"    set lines=82
else
    colorscheme torte
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
set autoindent
set smartindent
set conceallevel=0      "make sure every char is shown (https://vi.stackexchange.com/a/7263/12055)
set expandtab
set textwidth=0         "no automatic text wrapping by default
set number
set norelativenumber
set numberwidth=6       "fixed width for number side pane
set mouse=a             "use mouse in all modes
set mousemodel=popup    "context menu in GVim
set history=5000
set showcmd             "show the command you type on bottom right
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
set scrolloff=3         "show some lines at the bottom during scrolling
"set guifont=CourierNew\ 10
set guifont=Monospace\ Regular\ 10
"with uppercase W save file with sudo
"command W w !sudo tee % > /dev/null
"
" Moving the cursor through long soft-wrapped lines
" https://stackoverflow.com/q/20975928/7311363
noremap j gj
noremap k gk

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Statusline
" for color settings go to ```:help CursorLine``` and try and error
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=
set statusline+=%f                          "statusline
set statusline+=%m\                         "modifieable flag
set statusline+=%#DiffChange#               "Color change
set statusline+=%{FugitiveStatusline()}     "show git branch
set statusline+=%#StatusLine#               "Color change
set statusline+=%=                          "separator for left/right side
set statusline+=%#PmenuSel#                 "Color change
set statusline+=\ L:%l/%L\                  "line number out of lines"
set statusline+=%#StatusLine#               "Color change
set statusline+=\ Col:%c\                   "column number
set statusline+=%#PmenuSel#                 "Color change
set statusline+=\ (%p%%)                    "percent position

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Close all folds when opening a new buffer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd BufRead * setlocal foldmethod=marker
" autocmd BufRead * normal zM

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable fold by indent (https://unix.stackexchange.com/a/141104/223965)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set foldmethod=indent
"set foldnestmax=10
"set nofoldenable
"set foldlevel=2
"

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
"Plugin 'lervag/vimtex'     ---> was not able to make it running properly, interfers with vim-latex, so disable
Plugin 'matze/vim-tex-fold'
Plugin 'habamax/vim-asciidoctor'
" Plugin 'vim-ruby/vim-ruby'
" Plugin 'freitass/todo.txt-vim'
" Plugin 'fidian/hexmode'
" Plugin 'lilydjwg/colorizer'
" Plugin 'mrtazz/simplenote.vim'
" Plugin 'jlanzarotta/bufexplorer'
Plugin 'godlygeek/tabular'            "Tabularize plugin
" autocomplete:
Plugin 'ycm-core/YouCompleteMe'
" Plugin 'girishji/vimcomplete'

"Docker support
Plugin 'ekalinin/Dockerfile.vim.git'
Plugin 'tpope/vim-dotenv'
Plugin 'kevinhui/vim-docker-tools'

"Git support
Plugin 'tpope/vim-fugitive'
Plugin 'kablamo/vim-git-log'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Generic Programming Support (recommended by https://coderoncode.com/tools/2017/04/16/vim-the-perfect-ide.html)
Plugin 'Townk/vim-autoclose'
"
" Markdown / Writting
" Plugin 'reedes/vim-pencil'
" Plugin 'tpope/vim-markdown'
" Plugin 'jtratner/vim-flavored-markdown'
" Plugin 'LanguageTool'
Plugin 'rhysd/vim-grammarous'         " LanguageTool, use version 5.9 https://languagetool.org/download/ because command uses deprecated --api

" Cloud Formation Templates AWS
" Plugin 'm-kat/aws-vim'

"open a Scratch buffer
Plugin 'mtth/scratch.vim'

"syntax check
Plugin 'w0rp/ale'

"puppet syntax/plugin
Plugin 'rodjek/vim-puppet'
Plugin 'bfrg/vim-jq'

"Plugin to show indent spaces on starting line
Plugin 'Yggdroot/indentLine'

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
autocmd FileType plaintex setlocal filetype=tex     " plaintex should be handled same as tex
"moved to ftplugin/tex.vim
au BufRead,BufNewFile  *.adoc,*.md        set spell | set spelllang=en_us | let g:asciidoctor_folding = 1 | let g:asciidoctor_fold_options = 1
au BufRead,BufNewFile  *.htm,*.html,*.css,*.php  set shiftwidth=2
au BufWinEnter  bibliography.tex     set textwidth=1000 | set nowrap

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

" LanguageTool
" fix from https://github.com/rhysd/vim-grammarous/issues/110
let g:grammarous#jar_url = 'https://www.languagetool.org/download/LanguageTool-5.9.zip'
let g:grammarous#use_vim_spelllang = 1

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
" other settings for vimtex on ftplugin/tex.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" all moved to ftplugin/tex.vim
"au BufRead,BufNewFile  *.tex       TTarget pdf
au filetype            tex         TTarget pdf

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"indentLines settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char='·'               "use same char for vertical indent line
let g:indentLine_leadingSpaceChar='·'
let g:indentLine_leadingSpaceEnabled='1'
"make sure every char is shown in md files and similar (https://vi.stackexchange.com/a/7263/12055)
au BufRead,BufNewFile  *.md,*.txt,*.tex       let g:indentLine_conceallevel = 0
" https://github.com/Yggdroot/indentLine#customization
let g:markdown_syntax_conceal=0
let g:vim_json_conceal=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YAML settings important as YAML engineer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2 | let g:indentLine_char = '⦙'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 | let g:indentLine_char = '⦙' | let g:ale_python_pylint_options = '--rcfile=$HOME/.pylintrc' | set foldmethod=indent

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Simplenote settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"source ~/.simplenote/credentials.vim
"let g:SimplenoteVertical=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ale settings from @indero for Asynchronous Lint Engine
" https://github.com/w0rp/ale
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '!'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mark column 80 and 120 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight ColorColumn ctermbg=235 guibg=#fae3db
let &colorcolumn="80,120"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos="right"
let g:NERDTreeWinSize=50
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>
" sometimes NERDTree does open with too big width. With this map, the NERDtree
" window is reset to 50  (first jump to split window left) and jump back to
" split on the right
"nnoremap <leader>nr <C-W>l50<C-W>\|<C-W>h
let NERDTreeShowHidden=0
let NERDTreeMinimalUI = 1
let g:NERDTreeGitStatusShowIgnored = 1
" Deactivated NERDTree on 2023-06-09 because it causes a to heigh status line somtimes
"if (has('gui_running') && !&diff && &filetype!~'puppet')
    "start NERDTree on startup jump to the main window.
"   autocmd VimEnter * NERDTree 
    "auto change dir to the directory used in nerdtree
"   autocmd BufEnter * if &ft !~ '^nerdtree$' | silent! lcd %:p:h | endif
"endif

"no NERDTree in Scratch mode
autocmd VimEnter * if &buftype == "nofile" && &bufhidden == "hide" && &swapfile == 0 | NERDTreeClose | endif
"no NERDTree when commiting with git and tw to 72
autocmd VimEnter * if &filetype == 'gitcommit' | set tw=72 | set spell | set spelllang=en_gb | NERDTreeClose | endif

