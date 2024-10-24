vim.g.copilot_no_tab_map = true
vim.g.copilot_workspace_folders = "~/git"
vim.g.copilot_enabled = false

vim.keymap.set('i', '<C-a>', 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false
})
vim.g.copilot_no_tab_map = true


require("supermaven-nvim").setup({
    keymaps = {
        accept_suggestion = "<C-a>",
        clear_suggestion = "<C-]>",
        accept_word = "<C-j>",
    },
    log_level = "off",                 -- set to "off" to disable logging completely
    disable_inline_completion = false, -- disables inline completion for use with cmp
    disable_keymaps = false,           -- disables built in keymaps for more manual control
})
