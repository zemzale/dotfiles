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
local custom = require("zemzale.custom")
local neotest = require("neotest")

local n_keybinds = {
    -- Write stuff
    { "<leader>w",         ":write<CR>",                                         { noremap = true } },
    { "<leader>q",         ":q!<CR>",                                            { noremap = true } },

    -- Resize stuff
    { "<Up>",              ":resize +2<CR>",                                     { noremap = true } },
    { "<Down>",            ":resize -2<CR>",                                     { noremap = true } },
    { "<Left>",            ":vertical resize +2<CR>",                            { noremap = true } },
    { "<Right>",           ":vertical resize -2<CR>",                            { noremap = true } },

    -- Navigation
    { "<C-p>",             builtin.find_files,                                   { noremap = true } },
    { "<leader>f",         builtin.live_grep,                                    { noremap = true } },
    { "<leader><leader>f", builtin.current_buffer_fuzzy_find,                    { noremap = true } },
    { "<C-j>",             ":cnext<CR>",                                         {} },
    { "<C-f>",             ":cprev<CR>",                                         {} },

    -- Harpoon
    { "<leader>1",         function() ui.nav_file(1) end,                        { silent = true, noremap = true } },
    { "<leader>2",         function() ui.nav_file(2) end,                        { silent = true, noremap = true } },
    { "<leader>3",         function() ui.nav_file(3) end,                        { silent = true, noremap = true } },
    { "<leader>4",         function() ui.nav_file(4) end,                        { silent = true, noremap = true } },
    { "<leader>5",         function() ui.nav_file(5) end,                        { silent = true, noremap = true } },
    { "<leader>h",         mark.add_file,                                        { silent = true, noremap = true } },
    { "<leader>hy",        ui.toggle_quick_menu,                                 { silent = true, noremap = true } },


    -- Commands
    { "<leader>x",         ":make<CR>",                                          { noremap = true } },
    { "<leader>X",         ":make",                                              { noremap = true } },

    -- Misc
    { "<leader>gw",        custom.open_go_work,                                  { noremap = true } },
    { "<leader>td",        custom.open_todo,                                     { noremap = true } },
    { "<leader><leader>x", "<cmd>source %<CR>",                                  { silent = true, noremap = true } },
    { "<leader>cs",        custom.switch_scheme,                                 { silent = true, noremap = true } },

    -- Diff
    { "gj",                "<cmd>diffget //2<CR>",                               { noremap = true } },
    { "gk",                "<cmd>diffget //3<CR>",                               { noremap = true } },

    -- LSP
    { "<leader>s",         builtin.lsp_document_symbols,                         { noremap = true } },
    { "gr",                vim.lsp.buf.references,                               { noremap = true } },
    { "<leader>m",         vim.lsp.buf.rename,                                   { noremap = true } },
    { "<leader>ca",        vim.lsp.buf.code_action,                              { noremap = true } },
    { "gd",                vim.lsp.buf.definition,                               { noremap = true } },
    { "gi",                vim.lsp.buf.implementation,                           { noremap = true } },

    -- Neotest
    { "<leader>tf",        neotest.run.run,                                      { silent = true, noremap = true } },
    { "<leader>tt",        function() neotest.run.run(vim.fn.expand("%")) end,   { silent = true, noremap = true } },
    { "<leader>tw",        neotest.watch.watch,                                  { silent = true, noremap = true } },
    { "<leader>ts",        neotest.summary.toggle,                               { silent = true, noremap = true } },
    { "<leader>to",        function() neotest.output.open({ enter = true }) end, { silent = true, noremap = true } },
    { "<leader>td",        function() neotest.run.run({ strategy = "dap" }) end, { silent = true, noremap = true } },

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
