vim.g.copilot_no_tab_map = true
vim.g.copilot_workspace_folders = "~/git"

vim.keymap.set('i', '<C-a>', 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false
})
vim.g.copilot_no_tab_map = true


vim.api.nvim_create_autocmd('ColorScheme', {
    pattern = '*',
    callback = function()
        vim.api.nvim_set_hl(0, 'CopilotSuggestion', {
            fg = '#555555',
            ctermfg = 8,
            force = true
        })
    end
})
