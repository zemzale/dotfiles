source ~/.config/nvim/plugins.vim

" <Colors>
set termguicolors 
let g:seoul256_background = 233
let g:seoul256_srgb = 1
let g:gruvbox_contrast_dark = 'hard'
colo gruvbox
" </Colors>

" <Go>
let g:go_code_completion_enabled = 0
let g:go_gopls_enabled = 0
let g:go_def_mapping_enabled = 0
let g:go_fmt_command = "goimports"
" </Go>

" <Dart>  
autocmd BufRead,BufNewFile,BufEnter *.dart UltiSnipsAddFiletypes dart-flutter
autocmd BufWrite *.dart :DartFmt
let g:deoplete#sources#dart#dart_sdk_path = '/usr'
" </Dart>

" <Snipets>
let g:UltiSnipsExpandTrigger="<c-h>"
" </Snipets>

" <fzf>
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.3, 'yoffset': 0.05} }
" </fzf>

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.config/vim/vimrc
source ~/.config/nvim/keybinds.vim
source ~/.config/nvim/lsp.vim
