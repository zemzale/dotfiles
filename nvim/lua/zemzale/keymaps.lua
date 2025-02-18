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

M.smap = function(tbl)
    vim.keymap.set("s", tbl[1], tbl[2], tbl[3])
end

vim.g.mapleader = " "

local builtin = require("telescope.builtin")
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")


local n_keybinds = {
    { "<leader>w",  ":write<CR>",                           { noremap = true } },
    { "<leader>q",  ":q!<CR>",                              { noremap = true } },
    { "<Up>",       ":resize +2<CR>",                       { noremap = true } },
    { "<Down>",     ":resize -2<CR>",                       { noremap = true } },
    { "<Left>",     ":vertical resize +2<CR>",              { noremap = true } },
    { "<Right>",    ":vertical resize -2<CR>",              { noremap = true } },
    { "<C-p>",      builtin.find_files,                     { noremap = true } },
    { "<leader>f",  builtin.live_grep,                      { noremap = true } },
    { "<leader>s",  builtin.lsp_document_symbols,           { noremap = true } },
    { "gr",         vim.lsp.buf.references,                 { noremap = true } },
    { "<C-j>",      ":cnext<CR>",                           {} },
    { "<C-f>",      ":cprev<CR>",                           {} },
    { "<leader>m",  vim.lsp.buf.rename,                     { noremap = true } },
    { "<leader>ca", vim.lsp.buf.code_action,                { noremap = true } },
    { "<leader>x",  ":make<CR>",                            { noremap = true } },
    { "<leader>X",  ":make",                                { noremap = true } },
    { "<leader>n",  ":UndotreeToggle<CR>",                  { noremap = true } },
    { "<leader>gw", require("zemzale.custom").open_go_work, { noremap = true } },
    { "<leader>td", require("zemzale.custom").open_todo,    { noremap = true } },
    { "<C-l>p", function()
        builtin.find_files({
            cwd = './local-data/',
            search_file = '*.fish',
        })
    end, { noremap = true } },
    { "<leader>c",  "<CMD>Telescope commander<CR>", { noremap = true } },
    { "gj",         "<cmd>diffget //2<CR>",         { noremap = true } },
    { "gk",         "<cmd>diffget //3<CR>",         { noremap = true } },
    { "<leader>1",  function() ui.nav_file(1) end,  { silent = true, noremap = true } },
    { "<leader>2",  function() ui.nav_file(2) end,  { silent = true, noremap = true } },
    { "<leader>3",  function() ui.nav_file(3) end,  { silent = true, noremap = true } },
    { "<leader>4",  function() ui.nav_file(4) end,  { silent = true, noremap = true } },
    { "<leader>5",  function() ui.nav_file(5) end,  { silent = true, noremap = true } },
    { "<leader>h",  mark.add_file,                  { silent = true, noremap = true } },
    { "<leader>hy", ui.toggle_quick_menu,           { silent = true, noremap = true } },
}

local v_keybinds = {
    { "<leader>y", '"+y', { noremap = true } },
}

local ls = require("luasnip")

local i_keybinds = {
    { "<C-k>", function() if ls.expand_or_jumpable() then ls.expand_or_jump() end end, { silent = true } },
    { "<C-j>", function() if ls.jumpable(-1) then ls.jump(-1) end end,                 { silent = true } },
}

local s_keybinds = {
    { "<C-k>", function() if ls.expand_or_jumpable() then ls.expand_or_jump() end end, { silent = true } },
    { "<C-j>", function() if ls.jumpable(-1) then ls.jump(-1) end end,                 { silent = true } },
}

for _, m in ipairs(n_keybinds) do
    M.nmap(m)
end

for _, m in ipairs(v_keybinds) do
    M.vmap(m)
end

for _, m in ipairs(i_keybinds) do
    M.imap(m)
end

for _, m in ipairs(i_keybinds) do
    M.smap(m)
end

local go_keybinds = {
    { "<leader>gl", ":GoAlternate<CR>",  { noremap = true } },
    { "<leader>gt", ":GoTest<CR>",       { noremap = true } },
    { "<leader>gf", ":GoTestFunc<CR>",   { noremap = true } },
    { "<leader>gs", ":GoFillStruct<CR>", { noremap = true } },
}

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "go" },
    callback = function()
        for _, m in ipairs(go_keybinds) do
            M.nmap(m)
        end
    end,
})
