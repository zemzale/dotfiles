return { 
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzf-native.nvim",
    },
    opts = {
        defaults = {
            file_sorter = require("telescope.sorters").get_fzf_sorter,
            promt_prefix = "<",
            color_devicons = true,
            layout_config = {
                vertical = { width = 0.5, mirror = true },
            },
       },
        pickers = {
            find_files = {
                find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
                theme = "ivy",
            },
        },
        extensions = {
            fzf = {
                override_generic_sorter = true,
                override_file_sorter = true,
            },
        },
    },
    init = function()
        require('telescope.builtin').lsp_references({
            filters = {
                -- This will show lines containing '=' or ':='
                filter = function(line)
                    return line:match("[=:]+=") ~= nil
                end
            }
        })
    end
}
