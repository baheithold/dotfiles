colorscheme slate
syntax enable
set nocompatible        " use vim extensions
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
no <left>   Nop
no <right>  Nop

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


" Old stuff from into CS classes
"map @    :!clear;rm -f a.out; g++ -Wall -g % -o a.out -lm; ./a.out
"map #    :!clear;rm -f a.out; g++ -std=c++11 -Wall -g % -o a.out -lm; ./a.out 
"map <F2> :set paste!
