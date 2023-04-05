vim.g.copilot_no_tab_map = true
vim.cmd [[imap <silent><script><expr> <C-a> copilot#Accept("\<CR>") ]]
vim.cmd [[highlight CopilotSuggestion guifg=#555555 ctermfg=8]]
