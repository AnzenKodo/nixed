" Detect file type
filetype on " Enable type file detection
" filetype plugin on " Plug-in for detected file
" filetype indent on " Indent for current file
set exrc " Finds config file in current dir

" Fix
set nocompatible " Fix vi bug
set splitbelow splitright " Fix split bug
autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

" Memory
set history=1000 " History Size
set undolevels=1000	" Undo History

" Save
set nowritebackup " Don't write backup
set backupdir=~/.cache/vim " Backup files Dir
set dir=~/.cache/vim " Swap files Dir
set noswapfile " Disable swap files
autocmd BufWritePre * %s/\s\+$//e " Remove white space

" Indention
set autoindent    " Indentation of the current line to the next
set expandtab     " Insert space characters whenever the tab key
set softtabstop=2 " makes the spaces feel like real tabs
set shiftwidth=2  " Number of space characters inserted for indentation
set tabstop=8     " Control the number of space characters that will be inserted

" Search
set incsearch
set ignorecase " Ignore capital letter in Search
" set smartcase " Case-sensitive in Search
set showmatch " Matching words in search
set nohlsearch " No Highlighting Search

" Wild menu
set wildmenu " Auto Completion
set wildignorecase " Ignore capital letter in Wildmode
" set wildmode=list:longest,full " Wild mode like Bash
set wildoptions-=pum " Horizontal wildmenu
set showcmd " Similar command

" Spell checking
" Don't show spell error on words which are inside
" the file.
set spellfile=~/.config/nixed/vim/en.utf-8.add
" set spell
hi SpellBad cterm=underline
hi SpellLocal cterm=underline
hi SpellRare cterm=underline
hi SpellCap cterm=underline

" Other
set backspace=indent,eol,start " Backspace interaction
set clipboard=unnamedplus " Vim to use system clipboard

" Look

" Cursor
set cursorline " Current Line
" set cursorcolumn " Current column
hi clear CursorLine
hi CursorLine gui=underline cterm=underline

" Editor
set syntax=on " Enable syntax highlight
set number " Show numbers
set showmatch	" Matching brace
set colorcolumn=80 " column line to indicate limit
highlight ColorColumn ctermbg=black guibg=#202322
set scrolloff=8
set nowrap
set termguicolors " Enable true color

" Side Bar
set relativenumber " Numbers scroll
set ruler " Show cursor
set signcolumn=yes
hi clear SignColumn

" Bottom Bar
" set cmdheight=2 " Displaying messages
set laststatus=2 " Status Bar
set noshowmode " Don't current mode

" Source files
source ~/.config/nixed/vim/plugins.vim
source ~/.config/nixed/vim/shortcuts.vim
