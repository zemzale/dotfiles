local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args) vim.fn["UltiSnips#Anon"](args.body) end
    },
    preselect = cmp.PreselectMode.Item,
    mapping = {
        ['<Tab>'] = cmp.mapping(cmp.mapping.confirm(), { 'i', 'c' }),
        ["<C-k>"] = cmp.mapping.select_next_item(),
        ["<C-j>"] = cmp.mapping.select_prev_item(),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'ultisnips' }, 
    }, {
        { name = 'buffer' },
    })
})


-- Use buffer source for `/`.
cmp.setup.cmdline('/', {
    completion = { autocomplete = false },
    sources = {
        { name = 'buffer', opts = { keyword_pattern = [=[[^[:blank:]].*]=] } }
    }
})


-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
    completion = { autocomplete = false },
    sources = cmp.config.sources({
        { name = 'path' }
        }, {
        { name = 'cmdline' }
    })
})

local nvim_lsp = require'lspconfig'
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

vim.api.nvim_set_option('completeopt', 'menu,menuone,noselect')
vim.api.nvim_set_option('shortmess', vim.api.nvim_get_option('shortmess') .. 'c')


local on_attach = function(client, bufnr)
    local opts = { noremap=true, silent=true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>m', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

end

cfg = {...}  -- add you config here
require "lsp_signature".setup(cfg)

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = { "clangd", "gopls", "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach, capabilities = capabilities }
end


-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)
