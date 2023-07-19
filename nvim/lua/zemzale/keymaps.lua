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

vim.g.mapleader = " "
local builtin = require("telescope.builtin")
local n_keybinds = {
	{ "<leader>w", ":write<CR>", { noremap = true } },
	{ "<leader>q", ":q!<CR>", { noremap = true } },
	{ "<Up>", ":resize +2<CR>", { noremap = true } },
	{ "<Down>", ":resize -2<CR>", { noremap = true } },
	{ "<Left>", ":vertical resize +2<CR>", { noremap = true } },
	{ "<Right>", ":vertical resize -2<CR>", { noremap = true } },
	{ "<C-p>", builtin.find_files, { noremap = true } },
	{ "<leader>f", builtin.live_grep, { noremap = true } },
	{ "<leader>s", builtin.lsp_document_symbols, { noremap = true } },
	{ "<C-j>", ":cnext<CR>", {} },
	{ "<C-f>", ":cprev<CR>", {} },
	{ "<leader>m", vim.lsp.buf.rename, { noremap = true } },
	{ "<leader>ca", vim.lsp.buf.code_action, { noremap = true } },
	{ "<leader>x", ":make<CR>", { noremap = true } },
	{ "<leader>X", ":make", { noremap = true } },
}

local v_keybinds = {
	{ "<leader>y", '"*y', { noremap = true } },
}

for _, m in ipairs(n_keybinds) do
	M.nmap(m)
end

for _, m in ipairs(v_keybinds) do
	M.vmap(m)
end

local go_keybinds = {
	{ "<leader>gl", ":GoAlternate<CR>", { noremap = true } },
	{ "<leader>gt", ":GoTest<CR>", { noremap = true } },
	{ "<leader>gf", ":GoTestFunc<CR>", { noremap = true } },
}

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "go" },
	callback = function()
		for _, m in ipairs(go_keybinds) do
			M.nmap(m)
		end
	end,
})

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

M.nmap({ "<leader>a", mark.add_file, { silent = true } })
M.nmap({ "<leader>aa", ui.toggle_quick_menu, { silent = true } })

M.nmap({
	"<leader>1",
	function()
		ui.nav_file(1)
	end,
	{ silent = true },
})
M.nmap({
	"<leader>2",
	function()
		ui.nav_file(2)
	end,
	{ silent = true },
})
M.nmap({
	"<leader>3",
	function()
		ui.nav_file(3)
	end,
	{ silent = true },
})
