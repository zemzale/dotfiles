-- LuaSnip setup
local ls = require("luasnip")

ls.config.set_config {
    history = false,
    updateevents = "TextChanged,TextChangedI",
}

for _, ftPath in ipairs(vim.api.nvim_get_runtime_file("lua/zemzale/snippets/*.lua", true)) do
    loadfile(ftPath)()
end

---
--- nvim-cmp setup
local cmp = require("cmp")
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = {
        { name = "path" },
        { name = "nvim_lsp",  keyword_length = 1 },
        { name = "buffer",    keyword_length = 3 },
        { name = "luasnip",   keyword_length = 2 },
        { name = "nvim_lua" },
        { name = "supermaven" },
    },
    snippet = {
        expand = function(args)
            ls.lsp_expand(args.body)
        end,
    },
})

---
--- mason setup
require("mason").setup({})
require("mason-lspconfig").setup({ })
---
---null-ls setup
-- List of sources available here https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports,
        ---null_ls.builtins.formatting.prettier,
    },
})
---
