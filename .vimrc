""Vundle setting
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Visualize indentation level
Plugin 'Yggdroot/indentLine'
" Comment out the line easily
Plugin 'scrooloose/nerdcommenter'
" Visualize tabs / infomation
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Display git info with airline
Plugin 'tpope/vim-fugitive'
" Display marks on linenum
Plugin 'kshenoy/vim-signature'
" Align the code easily
Plugin 'godlygeek/tabular'
" Directory diff on vim
Plugin 'will133/vim-dirdiff' "TODO: does it work?
" Others
Plugin 'vim-scripts/SyntaxRange' "TODO: check
Plugin 'derekwyatt/vim-scala' "TODO: check

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""Common
set ruler
set bs=indent,eol,start
set number

set ts=4
set sw=4
set sts=0
set expandtab

set autoindent
set cindent
set smartindent

" set modeline "TODO: check function

set cursorline
highlight LineNR       ctermfg=136 cterm=bold
highlight CursorLineNR ctermfg=197 cterm=bold
highlight CursorLine term=bold cterm=bold ctermbg=NONE ctermfg=NONE

set mouse=a

""for open files in ex-command mode
set wildignorecase
set wildmenu
set path+=**

filetype on
syntax enable
set encoding=utf-8
" set clipboard=unnamedplus
" set paste
" set sol
set nowrap

""buffer switch w/o saving
set hidden

map <Enter> o<ESC>
if winbufnr(0)
    map + <C-W>>
    map - <C-W><
endif

""edit file in ex-command mode
set wildignorecase
set wildmenu
set path+=**

""search-related
set ignorecase
set smartcase
set hlsearch
highlight Search cterm=NONE ctermfg=lightyellow ctermbg=grey
" *cterm-colors*
" NR-16   NR-8    COLOR NAME 
" 0       0       Black
" 1       4       DarkBlue
" 2       2       DarkGreen
" 3       6       DarkCyan
" 4       1       DarkRed
" 5       5       DarkMagenta
" 6       3       Brown, DarkYellow
" 7       7       LightGray, LightGrey, Gray, Grey
" 8       0*      DarkGray, DarkGrey
" 9       4*      Blue, LightBlue
" 10      2*      Green, LightGreen
" 11      6*      Cyan, LightCyan
" 12      1*      Red, LightRed
" 13      5*      Magenta, LightMagenta
" 14      3*      Yellow, LightYellow
" 15      7*      White

""Netrw setting
let g:netrw_banner = 0          "0:Head banner off
let g:netrw_liststyle = 3       "3: tree style
let g:netrw_browse_split = 4    "0:SameWin / 1:Hsplit / 2:Vsplit / 3:NewTab / 4:Preview
let g:netrw_altv = 1            "0: SplitLeft / 1: SplitRight
let g:netrw_winsize = 25        "Netrw width: Vexplore
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

""folds will be saved automatically!
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

""DirDiff by Sungmin
let g:DirDiffEnableMappings = 1
let g:DirDiffExcludes = ".svn,build,*.pyc,.*.swp,arm,mips,power,sparc,x86,o3"

""Nerdcommenter by Sungmin
filetype plugin on
let NERDSpaceDelims=1

""Fugitive by Sungmin with airline
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''

""Airline by Sungmin
set laststatus=2
set ttimeoutlen=50
set term=xterm-256color
let g:airline_theme='simple'
"let g:airline_theme='powerlineish'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:bufferline_echo = 0

""Airline#extensions#tabline by Sungmin
"set airline 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2

let mapleader=","

let g:airline#extensions#tabline#buffer_idx_mode = 1

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9


""indentLine by Sungmin
"let g:indentLine_color_term = 6
let g:indentLine_color_term = 239
" | ¦ ┆ ┊ │
let g:indentLine_char = '│'
"let g:indentLine_char = '|'
nmap <F10> :call CopyToggle()<CR>
function! CopyToggle()
    echo &mouse
    if &mouse == 'a'
        exe ':IndentLinesDisable'
        exe ':set nonu'
        exe ':set mouse='
    else
        exe ':IndentLinesEnable'
        exe ':set nu'
        exe ':set mouse=a'
    endif
endfunction

""Filebuf & type by Channoh
au BufRead *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \    exe "norm g'\"" |
            \ endif
augroup Filetype
    au!
    au BufRead,BufNewFile *{Makefile,makefile}*   set filetype=make
    au BufRead,BufNewFile *.{ll,bc}         set filetype=llvm
    au BufRead,BufNewFile *.td            set filetype=tablegen
    au BufRead,BufNewFile *.rst           set filetype=rest
    au BufRead,BufNewFile *.html            set filetype=html
    au BufRead,BufNewFile *.tex           set filetype=tex
    au BufRead,BufNewFile *.md            set filetype=markdown
    au BufRead,BufNewFile *.{gnuplot,gp}        set filetype=gnuplot
    " au BufRead,BufNewFile config                    set filetype=config
    au BufRead,BufNewFile *.cl            set filetype=opencl
    au BufRead,BufNewFile *.{dat,data,csv}      set filetype=csv
    au BufRead,BufNewFile *.gdb           set filetype=gdb
    au BufRead,BufNewFile *.python        set filetype=python
    au BufRead,BufNewFile *.bb            set filetype=sh
    au BufRead,BufNewFile *.bbclass       set filetype=python
    ""for paper review/rebuttal files
    au BufRead,BufNewFile *.txt           set filetype=txt
    ""for Gem5-alpha .isa files
    au BufRead,BufNewFile *.isa           set filetype=cpp 
                \ | exec ":call SyntaxRange#Include('^def', '}}', 'python')"
augroup END
if &diff
    set diffopt+=iwhite
endif
""word wrap::command: gq
""Latex
autocmd FileType tex
            \ set tw=75                      |
            \ set formatoptions+=t           |
            \ set wm=2                       |
            \ set wrap linebreak nolist      |
            \ let g:tex_conceal=""
""Text
autocmd FileType txt
            \ set tw=75                      |
            \ set formatoptions+=t           |
            \ set wm=2                       |
            \ set wrap linebreak nolist      |
            \ let g:tex_conceal=""

""Ctags by Sungmin
set tags=./tags,tags,../tags,../../tags,../../../tags,../../../../tags,../../../../../tags
