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

return M
