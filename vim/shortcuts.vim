" Whenever you see `<leader>` that means leader key
" when is set to `\` in this config file and by
" default also set to it only.
let mapleader='\'

" Don't unselected after < & >
vmap < <gv
vmap > >gv

" Disable arrow keys in insert mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
