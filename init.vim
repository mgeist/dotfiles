"--- PLUGINS ---"
call plug#begin('~/.local/share/nvim/plugged')

" color scheme
Plug 'joshdick/onedark.vim'
" editorconfig file support
Plug 'editorconfig/editorconfig-vim'
" find files fast
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" comment/uncomment code
Plug 'tpope/vim-commentary'
" support coffeescript
Plug 'kchmck/vim-coffee-script'
" support less
Plug 'groenewege/vim-less'
" automatically closes quotes, parens, etc
Plug 'vim-scripts/delimitMate.vim'
" make vim good at go
Plug 'fatih/vim-go'
" make vim good at javascript
Plug 'pangloss/vim-javascript'
" support vue.js
Plug 'posva/vim-vue'
" support jsx
Plug 'mxw/vim-jsx'
" status bar
Plug 'bling/vim-airline'
" linter
Plug 'w0rp/ale'

call plug#end()
" plug#end() automatically sets the following:
" filetype plugin indent on
" syntax enable

"--- REGULAR VIM SETUP ---"
set nocompatible

" reload files when they change on disk
set autoread
" dont create swap files
set noswapfile

" use tab to navigate splits
nnoremap <tab> <C-w><C-w>
nnoremap <s-tab> <C-w><left>

"--- DISPLAY ---"
colorscheme onedark
set background=dark
" set 100 char limit indicator
set colorcolumn=101
" set line numbers
set number
" highlight active line number
:highlight LineNr ctermfg=grey
set cursorline

"--- SEARCH ---"
" incremental search
set incsearch
" highlight matched search words
set hlsearch
" ignore case unless capitalized letters are present
set ignorecase smartcase
nnoremap <ESC><ESC> :nohlsearch<cr>

"--- SPECIAL KEYS ---"
" tab = 2 spaces
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
" backspace can delete indents/newlines
set backspace=2

"--- PLUGIN SPECIFIC SETUP ---"
" python support setup (+Python)
let g:python2_host_prog = '/usr/bin/python'

" onedark
" From: https://github.com/joshdick/onedark.vim
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" fzf keybinding
noremap <c-p> :FZF<cr>

" 'default' syntastic setup from their setup guide
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
