local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.setup_nvim_cmp({
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp", keyword_length = 1 },
		{ name = "buffer", keyword_length = 3 },
		{ name = "luasnip", keyword_length = 2 },
	},
})

lsp.setup()

local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		-- Here you can add tools not supported by mason.nvim
	},
})

-- See mason-null-ls.nvim's documentation for more details:
-- https://github.com/jay-babu/mason-null-ls.nvim#setup
require("mason-null-ls").setup({
	ensure_installed = nil,
	automatic_installation = false, -- You can still set this to `true`
	handlers = {
        eslint_d = function (source_name, methods)
        end
		-- Here you can add functions to register sources.
		-- See https://github.com/jay-babu/mason-null-ls.nvim#handlers-usage
		--
		-- If left empty, mason-null-ls will  use a "default handler"
		-- to register all sources
	},
})
