
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()
  " Plugin Section
  Plug 'sheerun/vim-polyglot'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'dense-analysis/ale'
  Plug 'github/copilot.vim'
call plug#end()
"Config Section
set number
