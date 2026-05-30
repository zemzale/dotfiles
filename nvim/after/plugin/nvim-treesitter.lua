require("nvim-treesitter").install({ "go", "lua", "php", "javascript", "typescript", "markdown", "templ" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "go", "lua", "php", "javascript", "typescript", "markdown", "templ" },
	callback = function()
		vim.treesitter.start()
	end,
})
