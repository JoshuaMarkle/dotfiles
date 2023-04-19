set number

set termguicolors
call plug#begin('~/.vim/plugged')
" Initialize plugin system
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'ap/vim-css-color'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
call plug#end()

colorscheme catppuccin_mocha
