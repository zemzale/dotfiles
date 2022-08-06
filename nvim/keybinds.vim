" Go
autocmd FileType go nnoremap <buffer> <leader>gl :GoAlternate<CR>
autocmd FileType go nnoremap <buffer> <leader>gt :GoTest<CR>
autocmd FileType go nnoremap <buffer> <leader>gf :GoTestFunc<CR>

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
