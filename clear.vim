" SETTINGS
" --------

" colors
colorscheme delek

" encoding
set encoding=UTF-8

"
syntax enable

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

" python envs
let g:python3_host_prog = '/home/beniamin/.pyenv/versions/neovim3/bin/python'
let g:python_host_prog = '/home/beniamin/.pyenv/versions/neovim2/bin/python'

" clang setup
autocmd FileType c,cpp set list listchars=eol:¬,tab:\|\ 
autocmd FileType c,cpp set noexpandtab

" go lang setup
filetype plugin on
set omnifunc=syntaxcomplete#Complete
filetype plugin indent on
autocmd BufNewFile,BufRead *.go set list listchars=eol:¬,tab:\|\ 
