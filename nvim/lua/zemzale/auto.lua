vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("zemzale.yaml", { clear = true }),
	pattern = { "yaml" },
	callback = function()
		vim.opt_local.expandtab = true
		vim.opt_local.ts = 2
		vim.opt_local.sw = 2
		vim.opt_local.sts = 2
	end,
})

local format_group = vim.api.nvim_create_augroup("zemzale.format", { clear = true }),

vim.api.nvim_create_autocmd("BufWrite", {
	group = format_group,
	pattern = { "*" },
	callback = function() 
        vim.lsp.buf.format({sync = true, timeout = 2000});
    end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("zemzale.ts", { clear = true }),
	pattern = { "typescriptreact" },
	callback = function()
		vim.g.compiler = "tsc"
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("zemzale.md", { clear = true }),
	pattern = { "markdown" },
	callback = function()
		vim.g.textwidth = 80
		vim.g.wrap = true
	end,
})
