return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        requires = {
            { "nvim-lua/plenary.nvim" },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                run =
                "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
            },
            { "kyazdani42/nvim-web-devicons" },
        },
    })
    use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" }, -- Required
            {
                -- Optional
                "williamboman/mason.nvim",
                build = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
            },
            { "williamboman/mason-lspconfig.nvim" }, -- Optional

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },     -- Required
            { "hrsh7th/cmp-nvim-lsp" }, -- Required
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Formatting
            "nvimtools/none-ls.nvim"
        },
    })
    use({
        "L3MON4D3/LuaSnip",
        tag = "v2.3.0", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!:).
        run = "make install_jsregexp",
    })
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        requires = {
            { "nvim-treesitter/playground" },
            { "nvim-treesitter/nvim-treesitter-context" },
        },
    })
    use({
        "ThePrimeagen/harpoon",
        requires = {
            { "nvim-lua/plenary.nvim" },
        },
    })
    use({
        "ThePrimeagen/refactoring.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-treesitter/nvim-treesitter" }
        }
    })
    use({
        "lewis6991/gitsigns.nvim",
        tag = "release",
        config = function()
            require("gitsigns").setup()
        end,
    })
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })
    use({ "folke/tokyonight.nvim", branch = "main" })
    use({ "tpope/vim-fugitive" })
    use({
        "fatih/vim-go",
        config = function() end,
    })
    use({
        "github/copilot.vim",
    })

    use({ "junegunn/goyo.vim" })

    use({
        "mfussenegger/nvim-dap",
        requires = {
            { "leoluz/nvim-dap-go" },
            { "nvim-neotest/nvim-nio" },
            { "rcarriga/nvim-dap-ui" },
            { "theHamsta/nvim-dap-virtual-text" },
        },
    })
end)
