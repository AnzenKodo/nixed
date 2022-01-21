" Key bindings
let mapleader='\'

" ## Changed Key bindings

"### Don't unselected after < & >
vmap < <gv
vmap > >gv

"## Custom Key bindings
"### Find & Replace
nnoremap S :%s//gI<Left><Left><Left>

"# Settings

"## Functions

"### Detect file type
filetype on " Enable type file detection
" filetype plugin on " Plug-in for detected file
filetype indent on " Indent for current file

"### Fix
set nocompatible " Fix vi bug
set splitbelow splitright " Fix split bug
" Last cursor position
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif


"### Memory
set history=1000 " History Size
set undolevels=1000	" Undo History

"### Save
set nowritebackup " Don't write backup
set backupdir=~/.cache/vim " Backup files Dir
set dir=~/.cache/vim " Swap files Dir
" set confirm " Confirmation unsaved file.
autocmd BufWritePre * %s/\s\+$//e " Remove white space
set noswapfile " Disable swap files

" ### Indention
set tabstop=2 " Tab size
" set autoindent
set softtabstop=2
set shiftwidth=2
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs

"## Applications

"### Search
set incsearch " Ignore capital letter in Search
set smartcase " Case-sensitive in Search
set showmatch " Matching words in search
set hlsearch " Highlighting Search

"### Wild menu
set wildmenu " Auto Completion
set wildmode=list:longest,full " Wild mode like Bash
set showcmd " Similar command

"### Other
set spell " Spell checking
set backspace=indent,eol,start " Backspace interaction
set clipboard=unnamedplus " System Clipboard

"## Look

"### Cursor
" set cursorline " Current Line
" set cursorcolumn " Current column
" hi CursorLine guibg=#2f2f2f ctermfg=none

"### Editor
syntax on
set number " Show numbers
set showmatch	"	Matching brace
" set colorcolumn=50 " Line size
" set termguicolors "Enable true color

"### Side Bar
" set relativenumber " Numbers scroll
set ruler " Show cursor

"### Bottom Bar
" set cmdheight=2 " Displaying messages
set laststatus=2 " Status Bar
set noshowmode " Don't current mode

" Disable Mouse
set mouse=

" Plug ins
call plug#begin('~/.config/nvim/plugged')
	Plug 'dylanaraps/wal.vim'			" Color scheme
	Plug 'sheerun/vim-polyglot'		" Syntax highlighting
	Plug 'tpope/vim-commentary'		" Comment
	Plug 'jiangmiao/auto-pairs'		" Join pairs
	Plug 'tpope/vim-surround'			" Change pairs
	Plug 'luochen1990/rainbow'		" Rainbow parentheses
	Plug 'dense-analysis/ale'			" Lintier, Formatter, Code Completion
	Plug 'gko/vim-coloresque'			" Color Preview
	Plug 'itchyny/lightline.vim'	" Status bar
	Plug 'airblade/vim-gitgutter' " Git
	Plug 'vimwiki/vimwiki'				" Wiki & Note taking

	" Programming Language
	Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'npm i'}	" Markdown Preview
	Plug 'lepture/vim-jinja' " Nunjucks
call plug#end()

" Wal
colorscheme wal

" Rainbow
let g:rainbow_active = 1 " Active Plug-in

" A.L.E
let b:ale_fixers = ['prettier', 'xo']

let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
set omnifunc=ale#completion#OmniFunc
let g:ale_sign_error = '🔴'
let g:ale_sign_warning = '⭕'

" Run linters only when I save files
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Light line
let g:lightline = { 'colorscheme': 'one' }
let g:instant_markdown_autostart = 0

" Vimwiki
let g:vimwiki_list = [{'path': '~/Documents/Notes',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
