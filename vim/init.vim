call plug#begin()

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

"Navigation
Plug 'jremmen/vim-ripgrep' 

" Snipets
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

" UI
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'

" Navigation
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim' 
Plug 'scrooloose/nerdtree'
Plug 'ludovicchabant/vim-gutentags'
Plug 'ncm2/float-preview.nvim'

" Git
Plug 'tpope/vim-fugitive'

" Go plug
Plug 'sebdah/vim-delve'
Plug 'fatih/vim-go'

" Python
Plug 'nvie/vim-flake8'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'junegunn/seoul256.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'atahabaki/archman-vim'


call plug#end()

"let g:seoul256_background = 234
colo jellybeans


let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:float_preview#docked = 0

let g:go_fmt_command = "goimports"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips/']
let g:UltiSnipsExpandTrigger="<c-h>"


autocmd BufWritePost *.py call flake8#Flake8()

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source ~/.vim/vimrc

" Resize window
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" CtrpP mapping/setting
nnoremap <leader>s :CtrlPTag<cr>
nnoremap <leader>f :CtrlPLine<cr>
nnoremap <leader>m :make up<cr>

let g:ctrlp_match_window = 'top,order:btt,min:1,max:10,results:10'

" Exit terminal with ESC
tnoremap <Esc> <C-\><C-n>?\$<CR>

