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
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'github/copilot.vim'
call plug#end()

"Config Section

"Enable Line Numbers
set number

"Avoid Mac Issues With Syntax Highlight Redraws
set re=2

"Enable Mouse
set mouse=a

"Strip Whitespace on Save
let g:strip_whitespace_on_save=1

"Enable Search Highlighting
set hlsearch

"Set airline theme
let g:airline_theme='luna'

"Enable Carriage Return To Auto Complete COC Suggestion
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

"Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

"Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

"enable/disable coc integration
let g:airline#extensions#coc#enabled=1
"change error symbol
let airline#extensions#coc#error_symbol='E:'
"change warning symbol
let airline#extensions#coc#warning_symbol='W:'
"enable/disable coc status display
let g:airline#extensions#coc#show_coc_status=1
"change the error format (%C - error count, %L - line number)
let airline#extensions#coc#stl_format_err='%C(L%L)'
"change the warning format (%C - error count, %L - line number)
let airline#extensions#coc#stl_format_warn='%C(L%L)'

hi CocMenuSel ctermbg=grey ctermfg=yellow
hi CocSearch ctermfg=black
hi CocFloating ctermbg=darkgrey

"Toggle Nerd Tree
nnoremap <C-n> :NERDTreeToggle<CR>

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"Enable Cursor Highlighting on Insert Mode
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul
