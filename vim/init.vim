call plug#begin()

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'deoplete-plugins/deoplete-jedi'


" UI
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'

" Navigation
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim' 
Plug 'scrooloose/nerdtree'

" Git
Plug 'tpope/vim-fugitive'

" Go plug
Plug 'sebdah/vim-delve'
Plug 'fatih/vim-go'

" Python
Plug 'nvie/vim-flake8'


call plug#end()

let g:deoplete#enable_at_startup = 1
let g:go_fmt_command = "goimports"
autocmd BufWritePost *.py call flake8#Flake8()

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc


