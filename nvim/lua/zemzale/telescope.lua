local telescope = require("telescope")

telescope.setup({
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
            layout_strategy = "vertical",
        },
    },
    extensions = {
        fzf = {
            override_generic_sorter = true,
            override_file_sorter = true,
        },
    },
})

require("commander").setup({
    components = {
        "DESC",
        "KEYS",
        "CAT",
    },
    sort_by = {
        "DESC",
        "KEYS",
        "CAT",
        "CMD"
    },
    integration = {
        telescope = {
            enable = true,
        },
        lazy = {
            enable = true,
            set_plugin_name_as_cat = true
        }
    }
})

-- Add a new command
require("commander").add({
    {
        desc = "Make file exacutable",
        cmd = function()
            vim.cmd("!chmod +x %")
            vim.cmd("e")
        end,
    },
    {
        desc = "Run tests",
        cmd = function()
            vim.cmd("make test lint")
            vim.cmd("e")
        end,
    },
    {
        desc = "Directory: Create",
        cmd = function()
            vim.ui.input({ prompt = "Directory name: ", completion = "dir" }, function(input)
                vim.cmd("!mkdir " .. input)
                vim.cmd("e")
            end)
        end,
    },
    {
        desc = "Directory: Delete",
        cmd = function()
            vim.ui.input({ prompt = "Directory name: ", completion = "dir" }, function(input)
                vim.cmd("!rm -rf " .. input)
                vim.cmd("e")
            end)
        end,
    },
    {
        desc = "Directory: Move",
        cmd = function()
            local original_dir = ""
            vim.ui.input({ prompt = "Directory to move: ", completion = "dir" }, function(input)
                original_dir = input
            end)
            print(original_dir)
            vim.ui.input({ prompt = "New directory name : ", completion = "dir" }, function(input)
                vim.cmd("!mv " .. original_dir .. " " .. input)
                vim.cmd("e")
            end)
        end,
    },
})
-- Show commander and select the command by pressing "<leader>fc"
