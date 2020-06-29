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

" PHP go to defenition
nnoremap <leader>m :PhpactorGotoDefinition<CR>
nnoremap <leader><F2> :PhpactorImportMissingClasses<CR>

" Open notes
nnoremap <leader><C-n> :e $HOME/notes/notes<CR>
