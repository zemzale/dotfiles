return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		-- List of sources available here https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.goimports,
			},
		})
	end,
}
