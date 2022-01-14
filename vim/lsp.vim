set completeopt=menu,menuone,noselect
set shortmess+=c

let g:UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'      
let g:UltiSnipsJumpForwardTrigger = '<Plug>(ultisnips_jump_forward)'
let g:UltiSnipsJumpBackwardTrigger = '<Plug>(ultisnips_jump_backward)'
let g:UltiSnipsListSnippets = '<c-x><c-s>'
let g:UltiSnipsRemoveSelectModeMappings = 0

lua <<EOF
local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args) vim.fn["UltiSnips#Anon"](args.body) end
    },
    preselect = cmp.PreselectMode.Item,
    mapping = {
        ['<Tab>'] = cmp.mapping(cmp.mapping.confirm(), { 'i', 'c' }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
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

EOF

" Code navigation shortcuts
nnoremap <silent> <c-]>         <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K             <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD            <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k>         <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD           <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr            <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0            <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW            <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd            <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <leader>m     <cmd>lua vim.lsp.buf.rename()<CR>
