call plug#begin('~/.local/share/nvim/plugged')
" go lang plugins
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Vim syntax file for the HLA programming language
Plug 'jmahler/hla.vim'
" colorschemes
Plug 'morhetz/gruvbox'
" plugin that provides Rust file detection, syntax highlighting, formatting
" etc..
Plug 'rust-lang/rust.vim'
" fzf stands for “fuzzy finder” and works similarly to the Goto
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

" THEMES
" ------
syntax enable
colorscheme gruvbox

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

" setting numbers
set nu
set number relativenumber
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
au TermOpen * setlocal nonumber norelativenumber

" colors
" set t_Co=256
" if (has("termguicolors"))
"     set termguicolors
" endif

" autocompletion information
set completeopt-=preview

" change directory to the current file automatically
autocmd BufEnter * silent! lcd %:p:h

" removes trailing spaces
function TrimWhiteSpace()
    %s/\s*$//
    ''
endfunction

set list listchars=trail:.,extends:>
autocmd FileType rust,c,cpp,go,java,python,html,css autocmd FileWritePre * call TrimWhiteSpace()
autocmd FileType rust,c,cpp,go,java,python,html,css autocmd FileAppendPre * call TrimWhiteSpace()
autocmd FileType rust,c,cpp,go,java,python,html,css autocmd FilterWritePre * call TrimWhiteSpace()
autocmd FileType rust,c,cpp,go,java,python,html,css autocmd BufWritePre * call TrimWhiteSpace()

" clang setup
autocmd FileType c,cpp set list listchars=eol:¬,tab:\|\ 
autocmd FileType c,cpp set noexpandtab

" go lang setup
filetype plugin on
set omnifunc=syntaxcomplete#Complete
filetype plugin indent on
autocmd FileType go set noexpandtab
autocmd BufNewFile,BufRead *.go set list listchars=eol:¬,tab:\|\ 

" python envs
let g:python3_host_prog = '/home/beniamin/.pyenv/versions/neovim3/bin/python'
let g:python_host_prog = '/home/beniamin/.pyenv/versions/neovim2/bin/python'

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
let g:go_fmt_autosave=1
let g:go_asmfmt_autosave=1

" HLA
au BufRead,BufNewFile *.hla set syntax=hla

" Rust
autocmd FileType rust set list listchars=eol:¬
