return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		extensions = {},
		inactive_sections = {
			lualine_a = { "filename" },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { "location" },
		},
		inactive_winbar = {},
		options = {
			component_separators = "",
			section_separators = { right = "", left = "" },
			refresh = { statusline = 1000, tabline = 1000, winbar = 1000 },
			theme = "tokyonight",
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch" },
			lualine_c = { "filename" },
			lualine_x = { "lsp_status" },
			lualine_y = { "filetype", "progress" },
			lualine_z = { "location" },
		},
		tabline = {},
		winbar = {},
	},
}
