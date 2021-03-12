source ~/.config/nvim/plugins.vim

" <Colors>
set termguicolors 
let g:seoul256_background = 233
let g:seoul256_srgb = 1
colo seoul256
" </Colors>

" <coc.nvim>
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" </coc.nvim>

" <Go>
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
