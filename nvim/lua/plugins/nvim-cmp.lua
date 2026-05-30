return {
	"hrsh7th/nvim-cmp",
	lazy = false,
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lua" },
	},
	enabled = false,
	config = function()
		local cmp = require("cmp")
		local ls = require("luasnip")
		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = {
				{ name = "path" },
				{ name = "nvim_lsp", keyword_length = 1 },
				{ name = "buffer", keyword_length = 3 },
				{ name = "luasnip", keyword_length = 2 },
				{ name = "nvim_lua" },
				{ name = "supermaven" },
			},
			snippet = {
				expand = function(args)
					ls.lsp_expand(args.body)
				end,
			},
		})
	end,
}
