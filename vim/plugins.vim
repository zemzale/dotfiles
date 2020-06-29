call plug#begin()

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'rust-lang/rust.vim'
Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
Plug 'kristijanhusak/deoplete-phpactor'
Plug 'zchee/deoplete-clang'

" Formating
Plug 'editorconfig/editorconfig-vim'

" Terraform
Plug 'hashivim/vim-terraform'

"Navigation
Plug 'jremmen/vim-ripgrep' 

" Snipets
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

" UI
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'

" Navigation
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'ludovicchabant/vim-gutentags'
Plug 'ncm2/float-preview.nvim'
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'

" Go plug
Plug 'sebdah/vim-delve'
Plug 'fatih/vim-go'

" Python
Plug 'nvie/vim-flake8'
Plug 'Chiel92/vim-autoformat'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Colorschemes
Plug 'junegunn/seoul256.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'atahabaki/archman-vim'
Plug 'flazz/vim-colorschemes'

" TODOlist
Plug 'aserebryakov/vim-todo-lists'

" HTML
Plug 'mattn/emmet-vim'
Plug 'jwalton512/vim-blade'

" PHP
Plug 'stephpy/vim-php-cs-fixer'
Plug 'vim-syntastic/syntastic'


call plug#end()
