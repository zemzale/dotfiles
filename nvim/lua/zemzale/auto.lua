local auto_group = vim.api.nvim_create_augroup("zemzale", { clear = true })

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

vim.api.nvim_create_autocmd("BufWrite", {
    group = vim.api.nvim_create_augroup("zemzale.format", { clear = true }),
    pattern = { "*" },
    callback = function()
        print("FOOORMAT")
        vim.lsp.buf.format({ async = true })
    end,
})
