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
