" Resize window
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" FZF keymaps
nnoremap <C-p> :Files<cr>
nnoremap <leader>s :Tags<cr>
nnoremap <leader>f :BLines<cr>

" Exit terminal with ESC
tnoremap <Esc> <C-\><C-n>?\$<CR>

" visual selection search
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" TODO comments 
nnoremap <leader>t I//TODO @zemzale <ESC>"=strftime("%d/%m/%y ")<CR>pA

" Go
autocmd FileType go nnoremap <buffer> <leader>l :GoAlternate<CR>
autocmd FileType go nnoremap <buffer> <leader>t :GoTest<CR>

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Delete trailing white spaces on save, usefull for Python and CoffeScript 
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" NerdTree mapings
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>g :NERDTreeFocus<CR>
