""Vundle by Sungmin
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	" alternatively, pass a path where Vundle should install plugins
	"call vundle#begin('~/some/path/here')

	" let Vundle manage Vundle, required
	Plugin 'gmarik/Vundle.vim'

	" The following are examples of different formats supported.
	" Keep Plugin commands between vundle#begin/end.
	" plugin on GitHub repo
	""Plugin 'tpope/vim-fugitive'
	" plugin from http://vim-scripts.org/vim/scripts.html
	""Plugin 'L9'
	" Git plugin not hosted on GitHub
	""Plugin 'git://git.wincent.com/command-t.git'
	" git repos on your local machine (i.e. when working on your own plugin)
	""Plugin 'file:///home/gmarik/path/to/plugin'
	" The sparkup vim script is in a subdirectory of this repo called vim.
	" Pass the path to set the runtimepath properly.
	""Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
	" Avoid a name conflict with L9
	""Plugin 'user/L9', {'name': 'newL9'}

	Plugin 'Yggdroot/indentLine'
	Plugin 'derekwyatt/vim-scala'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'will133/vim-dirdiff'
  Plugin 'vim-scripts/SyntaxRange'
  Plugin 'tpope/vim-fugitive'

	" All of your Plugins must be added before the following line
	call vundle#end()            " required
	filetype plugin indent on    " required
	" To ignore plugin indent changes, instead use:
	"filetype plugin on
	"
	" Brief help
	" :PluginList       - lists configured plugins
	" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
	" :PluginSearch foo - searches for foo; append `!` to refresh local cache
	" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
	"
	" see :h vundle for more details or wiki for FAQ
	" Put your non-Plugin stuff after this line
	"
set ruler
set bs=indent,eol,start
set number
set ts=2
set sw=2
set noet
set sts=0
set autoindent
set cindent
set smartindent
set cursorline
highlight LineNR       ctermfg=136 cterm=bold
highlight CursorLineNR ctermfg=197 cterm=bold
set expandtab
set mouse=a
filetype on
syntax enable
set encoding=utf-8
" set clipboard=unnamedplus
" set paste
" set sol
set nowrap

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
let g:airline_theme='powerlineish'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tmuxline#enabled = 0
" let g:airline_powerlinei_fonts = 1
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
""up-to-date rocket-chip all-scala tags! 16.02.17
set tags+=/home/sungmin/tp-taggedArch/rocket-chip/tags
""gem5 for taggedArch in svn! 16.03.08
set tags+=/home/sungmin/svnroot/projects/typedarch/branches/typedisa_sm/gem5/tags
""Previous tags
""gem5 for taggedArch! 16.02.28
"set tags+=/home/sungmin/tp-taggedArch/typed-gem5/tags
"set tags+=/home/sungmin/svnroot/projects/typedarch/branches/isca2016/gem5/tags
"set tags+=/home/sungmin/svnroot/projects/typedarch/branches/isca2016_jrop/gem5/tags
"set tags+=/home/sungmin/rocketcore-gitlab/rocket-chip/riscv-tools/riscv-pk/tags
"set tags+=/home/sungmin/svnroot/projects/typedarch/branches/isca2016_vbbi/gem5/tags
"set tags+=/home/sungmin/helios-server/tags
