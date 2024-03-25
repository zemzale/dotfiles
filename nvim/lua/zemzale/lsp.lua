local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

local cmp = require("cmp")
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = {
        { name = "path" },
        { name = "nvim_lsp", keyword_length = 1 },
        { name = "buffer",   keyword_length = 3 },
        { name = "luasnip",  keyword_length = 2 },
        { name = "nvim_lua" },
    },
})



require("mason").setup({})
require("mason-lspconfig").setup({
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
    }
})


-- List of sources available here https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports,
    },
})
