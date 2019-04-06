set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" vim-better-whitespace
Plugin 'ntpeters/vim-better-whitespace'

" syntastic
Plugin 'vim-syntastic/syntastic'

" supertab
Plugin 'ervandew/supertab'

" cpp enhanced highlight
Plugin 'octol/vim-cpp-enhanced-highlight'

" nerdtree
Plugin 'scrooloose/nerdtree'

" nerdtree-git-plugin
Plugin 'Xuyuanp/nerdtree-git-plugin'

" ultisnips
Plugin 'SirVer/ultisnips'

" ultisnips snippets
Plugin 'honza/vim-snippets'

" vim-surround
Plugin 'tpope/vim-surround'

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


" better-whitespace auto whitespace strip on save
let g:strip_whitespace_on_save=1

colorscheme slate
syntax enable
set number              "[same as nu] show line numbers
set relativenumber      " Set relative numbers
set ruler               "[same as ru] show cursor position
set showmode            "[same as smd] show when in insert mode
set lines=50 columns=90
set colorcolumn=81
set hidden
set history=100
set background=dark
set mouse=a             "allows mouse scrolling"
set confirm             "confirms :q save"
set cmdheight=2         "Gives 2 lines for command entries"
set scrolloff=2         "leaves two lines of context between cursor line"
set incsearch           "actively searches while typing"
set hlsearch            " highlight searches
set nobackup            " do not keep a backup file (ending in ~)
set noswapfile          " do not write a swap file
set showmatch           "[same as sm] highlight matching (), {}, etc.
set nowrap              " do not wrap lines
set smartindent
set expandtab
set autoindent          "[same as ai] always set autoindenting on
set shiftwidth=4        "[same as sw] number of spaces to (auto)indent
set tabstop=4           "[same as ts] number of spaces per tab
set expandtab           "[same as et] use spaces instead of a tab
set softtabstop=4       "[same as sts] number of spaces to use instead of a tab
set smarttab            "[same as sta] <BS> deletes shiftwidth spaces from the start of a line
syntax enable
hi Comment  cterm=NONE  ctermfg=yellow  ctermbg=NONE
autocmd FileType make setlocal noexpandtab


" Remap arrow keys
no <up>     ddkP
no <down>   ddp
no <left>   <<
no <right>  >>

" Center movements
nmap G Gzz
nmap H Hzz
nmap M Mzz
nmap L Lzz

" Inserting new line with going into insert mode
nmap gO O<esc>j
nmap g<C-o> o<esc>k

map @    :!make clean; clear; make
inoremap { {<CR><BS>}<Esc>ko

" vvv Auto brace completion vvv
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>O
inoremap < <><Esc>i
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
     return "\<Right>"
 else
     return a:char
 endif
endf

function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
     return "\<CR>}"
 else
     return "\<Esc>j0f}a"
 endif
endf

function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
     "Inserting a quoted quotation mark into the string
     return a:char
 elseif line[col - 1] == a:char
     "Escaping out of the string
     return "\<Right>"
 else
     "Starting a string
     return a:char.a:char."\<Esc>i"
 endif
endf
" ^^^ Auto brace completion ^^^

" Nerdtree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>""

" Old stuff from into CS classes
"map @    :!clear;rm -f a.out; g++ -Wall -g % -o a.out -lm; ./a.out
"map #    :!clear;rm -f a.out; g++ -std=c++11 -Wall -g % -o a.out -lm; ./a.out
"map <F2> :set paste!
