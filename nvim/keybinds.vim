" Resize window
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" Telescope keymaps
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>f <cmd>Telescope live_grep<cr>
nnoremap <leader>s <cmd>Telescope help_tags<cr>

" Exit terminal with ESC
tnoremap <Esc> <C-\><C-n>?\$<CR>

" visual selection search
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" TODO comments 
nnoremap <leader>t I//TODO @zemzale <ESC>"=strftime("%d/%m/%y ")<CR>pA

" Go
autocmd FileType go nnoremap <buffer> <leader>gl :GoAlternate<CR>
autocmd FileType go nnoremap <buffer> <leader>gt :GoTest<CR>
autocmd FileType go nnoremap <buffer> <leader>gf :GoTestFunc<CR>

" Delete trailing white spaces on save, usefull for Python and CoffeScript 
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

nnoremap <C-j> :cnext<CR>
nnoremap <C-f> :cprev<CR>

nnoremap <silent><leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent><C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent><leader>tc :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>
