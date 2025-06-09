local M = {}
local scan = require("plenary.scandir")

M.open_go_work = function()
    local command = "go env GOWORK"
    local work_file_path = ""
    vim.fn.jobstart(command, {
        on_stdout = function(_, data, _)
            work_file_path = data[1]
            vim.cmd('e ' .. work_file_path)
        end,
    })
end

M.open_todo = function()
    scan.scan_dir(".", {
        hidden = true,
        add_dirs = false,
        respect_gitignore = true,
        depth = 1,
        search_pattern = "TODO",
        on_insert = function(entry)
            vim.cmd('e ' .. entry)
        end,
    })
end

M.switch_scheme = function()
    local current_scheme = vim.g.colors_name

    if current_scheme == "tokyonight-day" then
        vim.cmd([[colorscheme tokyonight-night]])
    else
        vim.cmd([[colorscheme tokyonight-day]])
    end
end

return M
