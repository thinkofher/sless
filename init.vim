" Requirements:
" - go, $GOPATH
" - xclip
" - pythoh modules: pynvim, python language server, jedi
" - clang, clang-tools
" - rust, rls

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

" Fancy start screen for vim
Plug 'mhinz/vim-startify'

" Language Server Protocol (LSP) support for vim and neovim
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" deoplete autocompletion
" should install(pip3): neovim, python-language-server, pynvim
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Asynchronous linting and make framework for Neovim/Vim
Plug 'neomake/neomake'

" Vim code formatter plugin
Plug 'sbdchd/neoformat'

" Insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" colorschemes
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'yous/vim-open-color'

" lightline
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'

" Nerdtree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Tabar, a class outline viewer for Vim
Plug 'majutsushi/tagbar'

" fzf stands for “fuzzy finder” and works similarly to the Goto
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" It shows which lines have been added, modified, or removed
Plug 'airblade/vim-gitgutter'

" The plugin provides mappings to easily delete, change and add such surroundings in pairs
Plug 'tpope/vim-surround'

" sublime text like multiple cursors
Plug 'terryma/vim-multiple-cursors'

" plugin that provides Rust file detection, syntax highlighting, formatting
" etc..
Plug 'rust-lang/rust.vim'

" go lang plugins
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Emmet plugin
Plug 'mattn/emmet-vim'

" Better syntax highlighting
Plug 'sheerun/vim-polyglot'

" Vim comments plugin
Plug 'tpope/vim-commentary'

" Nerd font icons
Plug 'ryanoasis/vim-devicons'

" deoplete.nvim source for Python
Plug 'deoplete-plugins/deoplete-jedi'

" Clojure plugins
Plug 'junegunn/rainbow_parentheses.vim'

" Julia support
Plug 'JuliaEditorSupport/julia-vim'

" Initialize plugin system
call plug#end()


" THEMES
" ------
syntax enable
set background=dark
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
if (has("termguicolors"))
    set termguicolors
endif

" autocompletion information
set completeopt-=preview

" removes trailing spaces
function TrimWhiteSpace()
    %s/\s*$//
    ''
endfunction

set list listchars=trail:.,extends:>
autocmd FileType c,cpp,go,java,python,html,css autocmd FileWritePre * call TrimWhiteSpace()
autocmd FileType c,cpp,go,java,python,html,css autocmd FileAppendPre * call TrimWhiteSpace()
autocmd FileType c,cpp,go,java,python,html,css autocmd FilterWritePre * call TrimWhiteSpace()
autocmd FileType c,cpp,go,java,python,html,css autocmd BufWritePre * call TrimWhiteSpace()

" clang setup
autocmd FileType c,cpp set list listchars=eol:¬,tab:\|\ 
autocmd FileType c,cpp set noexpandtab

" go lang setup
filetype plugin on
set omnifunc=syntaxcomplete#Complete
filetype plugin indent on
autocmd BufNewFile,BufRead *.go set list listchars=eol:¬,tab:\|\ 
autocmd FileType go set noexpandtab
autocmd FileType go set tabstop=2
autocmd FileType go set softtabstop=2
autocmd FileType go set shiftwidth=2

" change directory to the current file automatically
autocmd BufEnter * silent! lcd %:p:h

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

" silently saving file
nnoremap <silent><leader>w :silent w<CR>

" xclip configuartion
vmap <F7> y:call system("xclip -i -selection clipboard", getreg("\""))<cr>:call system("xclip -i", getreg("\""))<cr>

" fast go run running scripts
nnoremap <leader>gg :only<CR>:silent w<CR>:GoRun<CR>
nnoremap <leader>gw :GoInstall<CR>:silent w<CR>
nnoremap <leader>gd :GoDef<CR>

" terminal settings
nnoremap <leader>t :tabnew<CR>:terminal<CR>
tnoremap <ESC> <C-\><C-n>


" PLUGINS SETTINGS
" ----------------

" Neomake
" When writing a buffer (no delay).
call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing (no delay).
call neomake#configure#automake('rw', 1000)
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 1s; no delay when writing).
call neomake#configure#automake('nrwi', 500)

" neomake flake8 for python
let g:neomake_python_enable_makers = ['flake8']
let g:neomake_python_python_exe = 'flake8'

" neomake sbt
let g:neomake_sbt_maker = {
      \ 'exe': 'sbt',
      \ 'args': ['-Dsbt.log.noformat=true', 'compile'],
      \ 'append_file': 0,
      \ 'auto_enabled': 1,
      \ 'output_stream': 'stdout',
      \ 'errorformat':
          \ '%E[%trror]\ %f:%l:\ %m,' .
            \ '%-Z[error]\ %p^,' .
            \ '%-C%.%#,' .
            \ '%-G%.%#'
     \ }
let g:neomake_enabled_makers = ['sbt']

" LanguageClient
" \ 'python': ['~/.local/bin/pyls',],
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'cpp': ['clangd-6.0'],
    \ 'c': ['clangd-6.0'],
    \ 'go': ['gopls'],
    \ }
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
let g:LanguageClient_settingsPath='~/.lsp/settings.json'
let g:LanguageClient_diagnosticsEnable = 0

" Rust config
let g:neomake_rust_cargo_command = ['test', '--no-run']

" Gitgutter
set updatetime=100

" Ag
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
map ; :Files<CR>

" FZF
let $FZF_DEFAULT_COMMAND = 'ag --hidden -l -g ""'
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

" Selecting buffers with fzf
nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

" Nerdtree
map <C-o> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeIgnore = ['\.pyc$', '__pycache__']

" Tagbar
nmap <F8> :TagbarToggle<CR>

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

" Deoplete
let g:deoplete#enable_at_startup = 1

" let g:deoplete#sources#go#gocode_binary = '$GOPATH/bin/gocode'
let g:deoplete#sources#go#unimported_packages = 1
let g:deoplete#sources#go#builtin_objects = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#pointer = 1
" let g:deoplete#sources#go#source_importer = 1

" Deoplete-jedi
" let g:deoplete#sources#jedi#python_path = '$VIRTUAL_ENV/python'

" Rainbow Parentheses
" Activation based on file type
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

" Lightline
let g:lightline = {
     \ 'colorscheme': 'gruvbox',
     \ 'active': {
     \   'left': [ [ 'mode', 'paste' ],
     \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
     \ },
     \ 'component_function': {
     \   'gitbranch': 'gitbranch#name',
     \   'filetype': 'MyFiletype',
     \   'fileformat': 'MyFileformat',
     \ },
     \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
