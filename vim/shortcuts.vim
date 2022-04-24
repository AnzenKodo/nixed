" Whenever you see `<leader>` that means leader key
" when is set to `\` in this config file and by
" default also set to it only.
let mapleader='\'

" Don't unselected after < & >
vmap < <gv
vmap > >gv

" search for visually hightlighted text
vnoremap <C-f> y<ESC>/<c-r>"<CR>

" Search form selected text
vmap X y/<C-R>"<C-R>

" Disable arrow keys in insert mode
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
