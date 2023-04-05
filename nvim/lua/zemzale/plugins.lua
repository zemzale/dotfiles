return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                run =
                'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
            },
            { 'kyazdani42/nvim-web-devicons' }
        }

    }
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        requires = {
            { 'nvim-treesitter/playground' },
            { 'nvim-treesitter/nvim-treesitter-context' }
        }

    }
    use {
        'ThePrimeagen/harpoon',
        requires = {
            { 'nvim-lua/plenary.nvim' }
        }
    }
    use {
        'lewis6991/gitsigns.nvim',
        tag = "release",
        config = function()
            require('gitsigns').setup()
        end
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    }
    use { 'folke/tokyonight.nvim', branch = 'main' }
    use { 'tpope/vim-fugitive' }
    use {
        'fatih/vim-go',
        config = function()
        end
    }
    use {
        "github/copilot.vim"
    }
end)
