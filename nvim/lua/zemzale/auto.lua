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

local format_group = vim.api.nvim_create_augroup("zemzale.format", { clear = true })
vim.api.nvim_create_autocmd("BufWrite", {
    group = format_group,
    pattern = { "*" },
    callback = function()
        vim.lsp.buf.format({ sync = true, timeout = 2000 })
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
    pattern = { "markdown", "gitcommit" },
    callback = function()
        vim.g.textwidth = 80
        vim.g.wrap = true
    end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    group = vim.api.nvim_create_augroup("zemzale.task", { clear = true }),
    pattern = { "*" },
    callback = function()
        local scan = require("plenary.scandir")
        local files = scan.scan_dir(".", { hidden = false, depth = 1, search_pattern = "Taskfile.*" })
        if #files > 0 then
            vim.o.makeprg = "task"
        end
    end,
})

local split_write = function(output_bufnr, pattern, command)
    vim.api.nvim_create_autocmd("BufWritePost", {
        group = vim.api.nvim_create_augroup("zemzale.autorun", { clear = true }),
        pattern = { pattern },
        callback = function()
            local append_data = function(_, data)
                if data then
                    vim.api.nvim_buf_set_lines(output_bufnr, -1, -1, false, data)
                end
            end


            vim.api.nvim_buf_set_lines(output_bufnr, 0, -1, false, { "Output: " })
            vim.fn.jobstart(command, {
                stdout_buffered = true,
                on_stdout = append_data,
                on_stderr = append_data,
            })
        end,
    })
end

vim.api.nvim_create_user_command("AutoRun", function()
    local win = vim.api.nvim_get_current_win()
    local buf = vim.api.nvim_create_buf(true, true)
    vim.cmd('vsplit')
    vim.api.nvim_win_set_buf(win, buf)

    local cmd = vim.split(vim.fn.input("Command: "), " ")
    local pattenr = vim.fn.input("Pattern: ")

    split_write(buf, pattenr, cmd)
end, {})
