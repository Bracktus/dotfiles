"mics 
set number
set showcmd
set wildmenu
set ttimeoutlen=10
set clipboard+=unnamedplus
set confirm
colorscheme peachpuff
autocmd ColorScheme *
        \ highlight MatchParen  cterm=none ctermfg=white ctermbg=darkgrey|
        \ highlight Visual      cterm=none ctermfg=Black ctermbg=Green |
        \ highlight SpellBad    cterm=underline ctermfg=Red ctermbg=Black|
        \ highlight SpellCap    cterm=underline ctermfg=DarkRed ctermbg=Black |
        \ highlight Search      cterm=none ctermfg=Black ctermbg=Magenta 

" searching
set ignorecase
set incsearch
set hlsearch

" Restore cursor shape to beam on exit
augroup restore_cursor_shape
  autocmd!
  au VimLeave * set guicursor=a:ver10-blinkoff0
augroup END

" Tabs and spaces
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" my keybinds
map <Space> \
noremap U <c-r> 
noremap H ^
noremap L $
noremap J }
noremap K {
nnoremap Y y$
nnoremap <C-l> :noh <CR>
inoremap <C-Space> <ESC>

"fzf
nnoremap <leader>ff :FZF! <CR>
nnoremap <leader>fh :FZF! ~ <CR>

" move by screen line instead of file line
nnoremap j gj
nnoremap <down> gj
nnoremap k gk
nnoremap <up> gk

" indentation
nnoremap <Tab>   >>
nnoremap <S-Tab> <<
vnoremap <Tab>   >><Esc>gv
vnoremap <S-Tab> <<<Esc>gv

" spelling
nnoremap s :setlocal spell spelllang=en_gb <CR>
nnoremap S :set nospell <CR>

" preview markdown
nnoremap <leader>p :w <bar> ! pandoc -f markdown -t pdf -C % \| zathura -<CR>

" open terminal in current directory
nnoremap <leader>w :! termite . & disown<CR><CR>

" buffers 
nnoremap <Leader>bb :buffers<CR>:buffer<Space>
nnoremap <Leader>bv :buffers<CR>:vsp <bar> b <Space>
nnoremap <Leader>bs :buffers<CR>:sp <bar> b <Space>
nnoremap <leader>bd :buffers<CR>:bdelete <Space>

" tabs
nnoremap <leader>n :tabe 
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 :tablast<cr>

" typos
cmap W w
cmap Wq wq
cmap WQ wq
cmap Q q

"PACKAGE BINDS AND SETTINGS

"mics
filetype plugin on
nnoremap <leader>l :Align

" autocomplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#enable_typeinfo = 0 
let g:deoplete#sources#jedi#enable_typeinfo = 0 
let g:deoplete#sources#jedi#show_docstring = 0
let g:jedi#documentation_command = ""
let g:jedi#show_call_signatures = 0
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

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
Plug 'vim-scripts/Align'
Plug 'tpope/vim-commentary'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
Plug 'tmsvg/pear-tree'
Plug 'vim-syntastic/syntastic'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'dag/vim-fish'
call plug#end()


