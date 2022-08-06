call plug#begin()

" Autocomplete
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'ray-x/lsp_signature.nvim'
Plug 'williamboman/nvim-lsp-installer'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'simrat39/rust-tools.nvim'


Plug '~/git/refactoring.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'

Plug 'ThePrimeagen/harpoon'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'sbdchd/neoformat'

" Better status line
Plug 'vim-airline/vim-airline'
" Small thingies that show lines changed/added/deleted by git
Plug 'airblade/vim-gitgutter'

" Git
Plug 'tpope/vim-fugitive'

" Go plug
Plug 'sebdah/vim-delve'
Plug 'fatih/vim-go'
let g:go_code_completion_enabled = 0
let g:go_def_mapping_enabled = 0
let g:go_gopls_enabled = 0

" Python
Plug 'nvie/vim-flake8'
Plug 'Chiel92/vim-autoformat'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Colorschemes
Plug 'morhetz/gruvbox'

call plug#end()
