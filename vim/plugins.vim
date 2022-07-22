call plug#begin('~/.config/nvim/plugged')
  Plug 'tpope/vim-commentary'	      " Comment
  Plug 'tpope/vim-surround'	      " Change pairs
  Plug 'luochen1990/rainbow'	      " Rainbow parentheses
  Plug 'lilydjwg/colorizer'	      " Color Preview
  Plug 'itchyny/lightline.vim'	      " Status bar
  Plug 'vimwiki/vimwiki'	      " Wiki & Note taking
  Plug 'Yggdroot/indentLine'	      " Indention
  Plug 'dominikduda/vim_current_word' " Highlight current word under cursor
  Plug 'alvan/vim-closetag'	      " Auto close (X)HTML tags
  Plug 'neovim/nvim-lspconfig'        " LSP Server
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

  " Plugins for specific Programming Languages only
  Plug 'lepture/vim-jinja'  " Nunjucks
  Plug 'mattn/emmet-vim'    " HTML
  Plug 'LnL7/vim-nix'	    " Nix
  " Markdown Preview
  Plug 'iamcco/markdown-preview.nvim', {
	\ 'do': { -> mkdp#util#install() },
	\'for': ['markdown', 'vim-plug']
	\ }
call plug#end()

" Rainbow
let g:rainbow_active = 1 " Active Plug-in

" Lightline
let g:lightline = { 'colorscheme': 'one' }
let g:instant_markdown_autostart = 0

" Vimwiki
" Changes path of vim Vimwiki to `~/Documents/notes`.
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

" emmet-vim
let g:user_emmet_leader_key='<C-Y>'

lua << EOF
-- " LSP
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

require'lspconfig'.denols.setup{
  init_options = {
    unstable = true,
    enable = true
  }
}


-- " Treesetter
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  -- ensure_installed = { "" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "all" },

  highlight = {
    enable = true,
    disable = { "json" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    additional_vim_regex_highlighting = false,
  },
}
EOF

nnoremap <silent> ff    <cmd>lua vim.lsp.buf.formatting()<CR>
autocmd BufWritePre * lua vim.lsp.buf.formatting()
