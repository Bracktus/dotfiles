" mics
set number
set showcmd
set wildmenu
hi MatchParen cterm=none ctermbg=magenta ctermfg=yellow



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
noremap U <c-r> 
noremap H ^
noremap L $
noremap J }
noremap K {
nnoremap Y y$
nnoremap ? :noh <CR>
nnoremap s :setlocal spell spelllang=en_gb <CR>
nnoremap S :set nospell <CR>
nnoremap <Tab>   >>
nnoremap <S-Tab> <<
vnoremap <Tab>   >><Esc>gv
vnoremap <S-Tab> <<<Esc>gv


" Restore cursor shape to beam on exit
augroup restore_cursor_shape
  autocmd!
  au VimLeave * set guicursor=a:ver10-blinkoff0
augroup END

" typos
cmap W w
cmap Wq wq
cmap WQ wq
cmap Q q

"package binds and settings
filetype plugin on
let g:deoplete#enable_at_startup = 1
map <C-o> :NERDTreeToggle<CR>
nnoremap ,c :call NERDComment(0,"toggle")<CR>
vnoremap ,c :call NERDComment(0,"toggle")<CR>
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tmsvg/pear-tree'
call plug#end()

