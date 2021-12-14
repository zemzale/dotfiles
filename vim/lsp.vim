set completeopt=menuone,noinsert,noselect
set shortmess+=c

" Enable fuzzy autocomplete
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']

" Enable ulti snips in completion 
let g:completion_enable_snippet = 'UltiSnips'

lua <<EOF
-- nvim_lsp object
local nvim_lsp = require'lspconfig'

-- function to attach completion when setting up lsp
local on_attach = function(client)
    require'completion'.on_attach(client)
end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = { "clangd", "gopls", "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
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

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)
