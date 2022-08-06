"------------------------------------------------------------------------------
" Plugins (so stuff can work) 
"------------------------------------------------------------------------------
source ~/.config/nvim/plugins.vim

"------------------------------------------------------------------------------
" General 
"------------------------------------------------------------------------------

" Shows what you are pressing 
set showcmd 

" Sets how many lines VIM has to remember 
set history=500

" Enable spell checker on entering insert mode
autocmd InsertEnter * setlocal spell
autocmd InsertLeave * setlocal nospell

" Make sure that cursor is always vertically centered on j/k moves
set so=999

" add vertical lines on columns
set colorcolumn=120

" Highlight current line - allows you to track cursor position more easily
set cursorline

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
set wildmode=longest,list,full
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

"------------------------------------------------------------------------------
" COLORS AND FONTS
"------------------------------------------------------------------------------

" Set colors to dark 
set background=dark
set t_Co=256

syntax enable

" Enable 256 color pallet if Gnome 
if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif

" Set UTF8 as standart encoding and en_US as the standart language
set encoding=utf8

" Set UNIX as the stadart filetype 
set ffs=unix,dos,mac

" Set line endings to UNIX because mac is stupid
set ff=unix

set termguicolors 
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox


"------------------------------------------------------------------------------
" FILES BACKUPS AND UNDO
"------------------------------------------------------------------------------

"Turn backup off, since most stuff is in SVN
set nobackup 
set nowb 
set noswapfile

"------------------------------------------------------------------------------
" TEXT, TAB, AND INDENT RELATED
"------------------------------------------------------------------------------
" Use spaces instead of tabs 
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround

"linebrake on 500 chars
set lbr
set tw=500

au BufRead /tmp/mutt-* set tw=72
au BufRead *.md set tw=80

set ai "Auto indent
set si "Smart indent
set wrap "Wraplines

"------------------------------------------------------------------------------
" STATUS LINES
"------------------------------------------------------------------------------
" Always show the status line
set laststatus=2


" So C tags would be picked up
set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim

"------------------------------------------------------------------------------
" LANGUAGE SPECIFIC
"------------------------------------------------------------------------------

" Go
let g:go_code_completion_enabled = 0
let g:go_gopls_enabled = 0
let g:go_def_mapping_enabled = 0
let g:go_fmt_command = "goimports"

"autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll


set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.config/nvim/keybinds.vim
lua require("zemzale")
