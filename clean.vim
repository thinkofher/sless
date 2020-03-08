call plug#begin('~/.local/share/nvim/plugged')
" go lang plugins
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" colorschemes
Plug 'nanotech/jellybeans.vim'

" plugin that provides Rust file detection, syntax highlighting, formatting
" etc..
Plug 'rust-lang/rust.vim'

" fzf stands for “fuzzy finder” and works similarly to the Goto
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Plugin for haskell syntax
Plug 'neovimhaskell/haskell-vim'

" Plugin for elm syntax
Plug 'ElmCast/elm-vim'
call plug#end()


" THEMES
" ------
syntax enable
colorscheme jellybeans

" SETTINGS
" --------
" encoding
set encoding=UTF-8

" required for operations modifying multiple buffers like rename.
set hidden

" spaces & Tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line

" Searching files
set incsearch
set ignorecase
set nohlsearch

" always show statusline
set laststatus=2

" buffers
nmap <C-P> :bp<CR>
nmap <C-N> :bn<CR>

" removes trailing spaces
function TrimWhiteSpace()
    %s/\s*$//
    ''
endfunction

set list listchars=trail:.,extends:>
autocmd FileType haskell,rust,c,cpp,go,java,python,html,css autocmd FileWritePre * call TrimWhiteSpace()
autocmd FileType haskell,rust,c,cpp,go,java,python,html,css autocmd FileAppendPre * call TrimWhiteSpace()
autocmd FileType haskell,rust,c,cpp,go,java,python,html,css autocmd FilterWritePre * call TrimWhiteSpace()
autocmd FileType haskell,rust,c,cpp,go,java,python,html,css autocmd BufWritePre * call TrimWhiteSpace()

" haskell setup -> requirement: hasktags
autocmd FileType haskell set list listchars=eol:¬
autocmd FileType haskell autocmd BufWritePost * silent !hasktags --ctags .

" clang setup
autocmd FileType make,c,cpp set list listchars=eol:¬,tab:\|\ 
autocmd FileType make,c,cpp set noexpandtab

" rust seutp
autocmd FileType rust set list listchars=eol:¬

" go lang setup
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set completeopt-=preview
filetype plugin indent on
autocmd FileType go set noexpandtab
autocmd BufNewFile,BufRead *.go set list listchars=eol:¬,tab:\|\ 

" python envs -> requirement: pyenv
let g:python3_host_prog = '$HOME/.pyenv/versions/neovim/bin/python'
" let g:python_host_prog = $HOME/.pyenv/versions/neovim2/bin/python'

" MAPPINGS
" --------

" mappings for moving lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" terminal settings
nnoremap <leader>t :tabnew<CR>:terminal<CR>
tnoremap <ESC> <C-\><C-n>

" Vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_operators = 1
let g:go_fmt_autosave = 1
let g:go_asmfmt_autosave = 1
let g:go_echo_go_info = 0
