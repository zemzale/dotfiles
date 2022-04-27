local actions = require('telescope.actions')
local keymap = require("zemzale.keymap")
local telescope = require("telescope")

telescope.setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzf_sorter, 
        promt_prefix = '<',
        color_devicons =  true,
        layout_config = {
            vertical = { width = 0.5 },
            mirror = true,
        },
    },
    pickers = {
        find_files = {
            find_command = {'rg', '--files', '--hidden', '-g', '!.git'},
            layout_strategy = 'vertical',
        }
    },
    extensions = {
        fzf = {
            override_generic_sorter = true,
            override_file_sorter = true,
        }
    }
}

telescope.load_extension('fzf')
telescope.load_extension("refactoring")
telescope.load_extension("harpoon")

keymap.vmap({"<leader>rr", telescope.extensions.refactoring.refactors, { noremap = true }})
keymap.nmap({"<leader>e", telescope.extensions.harpoon.marks, { noremap =true}})

require('refactoring').setup({})
