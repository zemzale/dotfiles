api.nvim_create_autocmd(
    "FileType",
    { 
        pattern = { "yaml" },
        callback = function() 
            vim.opt_local.expandtab = true
            vim.opt_local.ts = 2
            vim.opt_local.sw = 2
            vim.opt_local.sts = 2
        end
    }
)
