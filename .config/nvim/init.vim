 "mics
set number
set showcmd
set wildmenu
set clipboard+=unnamedplus
set ttimeoutlen=10
hi MatchParen cterm=none ctermbg=magenta ctermfg=yellow


" searching
set ignorecase
set incsearch
set hlsearch

" Restore cursor shape to beam on exit
augroup restore_cursor_shape
  autocmd!
  au VimLeave * set guicursor=a:ver10-blinkoff0
augroup END

" Relative line numbers
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Tabs and spaces
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set smarttab

" move by screen line instead of file line
nnoremap j gj
nnoremap <down> gj
nnoremap k gk
nnoremap <up> gk

" my keybinds
map <Space> \
noremap U <c-r> 
noremap H ^
noremap L $
noremap J }
noremap K {
nnoremap Q @
nnoremap Y y$
nnoremap ? :noh <CR>
nnoremap s :setlocal spell spelllang=en_gb <CR>
nnoremap S :set nospell <CR>
nnoremap <Tab>   >>
nnoremap <S-Tab> <<
vnoremap <Tab>   >><Esc>gv
vnoremap <S-Tab> <<<Esc>gv

" typos
cmap W w
cmap Wq wq
cmap WQ wq
cmap Q q

"PACKAGE BINDS AND SETTINGS

"nerdstuff
filetype plugin on
map <C-o> :NERDTreeToggle<CR>
nnoremap <leader>c :call NERDComment(0,"toggle")<CR>
vnoremap <leader>c :call NERDComment(0,"toggle")<CR>
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" autocomplete
let g:deoplete#enable_at_startup = 1

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" nvim's personal venv
let g:python3_host_prog = "/home/bracktus/.config/nvim/nvimVenv/bin/python"

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'deoplete-plugins/deoplete-jedi'
"Plug 'davidhalter/jedi-vim'
Plug 'tmsvg/pear-tree'
Plug 'vim-syntastic/syntastic'
Plug 'JuliaEditorSupport/julia-vim'
call plug#end()

