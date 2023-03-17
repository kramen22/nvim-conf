"Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

"Plugin Section
call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ntpeters/vim-better-whitespace'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'github/copilot.vim'
call plug#end()

"Config Section

"Enable Line Numbers
set number

"Avoid Mac Issues With Syntax Highlight Redraws
set re=2

"Enable Search Highlighting
set hlsearch

"Enable Carriage Return To Auto Complete COC Suggestion
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

"Enable Cursor Highlighting on Insert Mode
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul
