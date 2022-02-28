call plug#begin('~/.config/nvim/plugged')
	Plug 'dylanaraps/wal.vim'						" Import colorseam from pywal
	Plug 'sheerun/vim-polyglot'					" Syntax highlighting
	Plug 'tpope/vim-commentary'					" Comment
	Plug 'tpope/vim-surround'						" Change pairs
	Plug 'luochen1990/rainbow'					" Rainbow parentheses
	Plug 'dense-analysis/ale'						" Lintier, Formatter, Code Completion
	Plug 'lilydjwg/colorizer'						" Color Preview
	Plug 'itchyny/lightline.vim'				" Status bar
	Plug 'vimwiki/vimwiki'							" Wiki & Note taking
	Plug 'Yggdroot/indentLine'					" Indention
	Plug 'dominikduda/vim_current_word' " Highlight current word under cursor
	Plug 'alvan/vim-closetag'						" Auto close (X)HTML tags

	" Only Works on Neovim only
	Plug 'ZhiyuanLck/smart-pairs'
	" Neovim to work on browser textfields
	" More info https://github.com/glacambre/firenvim
	Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

	" Plugins for specific Programming Languages only
	Plug 'lepture/vim-jinja'	" Nunjucks
	Plug 'mattn/emmet-vim'		" HTML
	Plug 'LnL7/vim-nix'				" Nix
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm i'  }	" Markdown Preview
call plug#end()

" Loads Neovim plugins
lua << EOF
	require('pairs'):setup()
EOF

" Uses pywal theme
colorscheme wal

" Rainbow
let g:rainbow_active = 1 " Active Plug-in

" A.L.E
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
set omnifunc=ale#completion#OmniFunc
let g:ale_sign_error = '🔴'
let g:ale_sign_warning = '⭕'
" let g:ale_deno_lsp_project_root = '_config.ts'
" Enable unstable version of deno
let g:ale_deno_unstable = 1
" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \   'typescript': ['deno'],
" \}
# A.L.E shortcuts
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Lightline
let g:lightline = { 'colorscheme': 'one' }
let g:instant_markdown_autostart = 0

" Vimwiki
" Changes path of vim vimwiki to `~/Documents/notes`.
" Uses Markown syntax instead of Vimwiki syntax.
let g:vimwiki_list = [{'path': '~/Documents/notes',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
" Default file changes to`README.md` instead of `index.md`
let g:vimwiki_index = "README"

" indentLine
" Uncomment to use theme color
" let g:indentLine_setColors = 0
let g:indentLine_char_list = ['⁞']
let g:markdown_syntax_conceal=0
let g:vim_json_conceal=0
" To fix Vimwiki bugs with indentLine plugin
let g:indentLine_fileTypeExclude = ['vimwiki']
