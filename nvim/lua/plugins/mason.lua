return {
    "williamboman/mason.nvim",
    lazy = false,
    build = function()
        pcall(vim.cmd, "MasonUpdate")
    end,
    dependencies = {
        { "williamboman/mason-lspconfig.nvim" },
        { "hrsh7th/nvim-cmp" },     -- Required
        { "hrsh7th/cmp-nvim-lsp" }, -- Required
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-nvim-lua" },

        -- Formatting
        "nvimtools/none-ls.nvim"
    },
    config = function()
        require("zemzale.lsp")
    end
}
