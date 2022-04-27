local M = {}

M.imap = function(tbl)
  vim.keymap.set("i", tbl[1], tbl[2], tbl[3])
end

M.nmap = function(tbl)
  vim.keymap.set("n", tbl[1], tbl[2], tbl[3])
end

M.vmap = function(tbl)
  vim.keymap.set("v", tbl[1], tbl[2], tbl[3])
end

local telescope = require("telescope.builtin")

local n_keybinds = {
    {"<Up>", ":resize +2<CR>", { noremap = true }},
    {"<Down>", ":resize -2<CR>", { noremap = true }},
    {"<Left>", ":vertical resize +2<CR>", { noremap = true }},
    {"<Right>", ":vertical resize -2<CR>", { noremap = true }},
    {"<C-p>", telescope.find_files, { noremap = true }},
    {"<leader>f", telescope.live_grep, { noremap = true }},
    {"<leader>s", telescope.lsp_document_symbols, { noremap = true }},
    {"<C-j>", ":cnext<CR>", {}},
    {"<C-f>", ":cprev<CR>", {}},

}

for _, m in ipairs(n_keybinds) do 
    M.nmap(m)
end

return M


