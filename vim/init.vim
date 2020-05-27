source ~/.config/nvim/plugins.vim

" <Colors>
set termguicolors 
let g:seoul256_background = 233
let g:seoul256_srgb = 1
colo seoul256
" </Colors>

" <Deoplete>
let g:deoplete#omni_patterns = {}
call deoplete#custom#option('omni_patterns', {
\ 'complete_method': 'omnifunc',
\ 'terraform': '[^ *\t"{=$]\w*',
\})
let g:deoplete#enable_at_startup = 1
call deoplete#initialize()
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" </Deoplete> 

" <Go>
let g:go_fmt_command = "goimports"
" </Go>


" <Snipets>
" let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips/']
let g:UltiSnipsExpandTrigger="<c-h>"
" </Snipets>

" <Python>  
autocmd BufWritePost *.py call flake8#Flake8()
autocmd BufWrite *.py :Autoformat
" </Python>

" <fzf>
let g:fzf_layout = { 'window': { 'width': 8.0, 'height': 0.5, 'yoffset': 0.0,  } }
" </fzf>

" <php-cs-fixer>
let g:php_cs_fixer_rules = "@PSR2"
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
" </php-cs-fixer>
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc
source ~/.config/nvim/keybinds.vim
