"""""""""""""""""
"" GENERAL 
"""""""""""""""""
" Colorscheme

set background=dark
set t_Co=256

" Sets how many lines VIM has to remmber 
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations 
" like <leader>w saves the current file 
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" Fast saving 
nmap <leader>w :w!<cr>
" Fast exit without saving
nmap <leader>q :q!<cr>

" Turn on the wild menu
set wildmenu

"Always show current positon
set ruler

" Numbers
set relativenumber
set number

" Height of the command bar
set cmdheight=2

" Configure the backspace so it acts as it should act 
set backspace=eol,start,indent

" Ignore case when searching 
set ignorecase

" When searching "The" will find only "The" and "the" will find both
set smartcase

" Hilight search results 
set hlsearch

" Make search act like search in modern browser
set incsearch 

" Show matchign brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2


""""""""""""""""""
" COLORS AND FONTS
""""""""""""""""""
syntax enable

" Enable 256 color pallet if Gnome 
if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif



" Set UTF8 as standart encoding and en_US as the standart language
set encoding=utf8

" Set UNIX as the stadart filetype 
set ffs=unix,dos,mac

"""""""""""""""""""
" FILES BACKUPS AND UNDO
"""""""""""""""""""

"Turn backup off, since most stuff is in SVN
set nobackup 
set nowb 
set noswapfile

""""""""""""""""""
" TEXT, TAB, AND INDENT RELATED
""""""""""""""""""
" Use spaces instead of tabs 
set expandtab
set smarttab

" 1tab == 4 spaces
set shiftwidth=4
set tabstop=4

"linebrake on 500 chars
set lbr
set tw=500

au BufRead /tmp/mutt-* set tw=72

set ai "Auto indent
set si "Smart indent
set wrap "Wraplines


"""""""""""""""""""""
" MOVING AROUND, TABS WIDOWS BUFFERS
"""""""""""""""""""""
map <leader>f /

"""""""""""""""""""""
" STATUS LINES
"""""""""""""""""""""
" Always show the status line
set laststatus=2


""""""""""""""""""""""
" EDITING MAPPING
""""""""""""""""""""""

" Fast line delete
nmap <leader>d dd

func! DeleteTrailingWS()
" Delete trailing white spaces on save, usefull for Python and CoffeScript 
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

