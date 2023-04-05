local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup_nvim_cmp({
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp', keyword_length = 1 },
        { name = 'buffer',   keyword_length = 3 },
        { name = 'luasnip',  keyword_length = 2 },
    },
})
lsp.setup()
