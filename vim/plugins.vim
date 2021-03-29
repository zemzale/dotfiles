call plug#begin()

" Autocomplete
Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'nvim-lua/completion-nvim'

" Editing
Plug 'tpope/vim-surround'

" Formating
Plug 'editorconfig/editorconfig-vim'

"Navigation
Plug 'jremmen/vim-ripgrep' 

" Snipets
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

" UI
Plug 'vim-airline/vim-airline'
Plug 'thiagoalessio/rainbow_levels.vim'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'

" Navigation
Plug 'scrooloose/nerdtree'
Plug 'ncm2/float-preview.nvim'
Plug 'craigemery/vim-autotag'
let g:autotagExcludeFiletypes = "json"
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
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

" HTML
Plug 'mattn/emmet-vim'
Plug 'jwalton512/vim-blade'

" PHP
Plug 'vim-syntastic/syntastic'
let g:syntastic_python_checkers = ['flake8']
Plug 'vim-vdebug/vdebug'

" Flutter
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'

call plug#end()
