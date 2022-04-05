"mics 
set number relativenumber
set showcmd
set wildmenu
set ttimeoutlen=10
set laststatus=2
set statusline=%F\  "Filename
set statusline+=[%c,%l] "[Column,Row]
set clipboard+=unnamedplus
set confirm

" colours
autocmd colorscheme *
        \ highlight matchparen  cterm=none      ctermfg=white   ctermbg=darkgrey   |
        \ highlight visual      cterm=none      ctermfg=black   ctermbg=green      |
        \ highlight spellbad    cterm=underline ctermfg=red     ctermbg=black      |
        \ highlight spellcap    cterm=underline ctermfg=darkred ctermbg=black      |
        \ highlight search      cterm=none      ctermfg=black   ctermbg=magenta    |
        \ highlight diffadd     cterm=none      ctermfg=black   ctermbg=darkgreen  |
        \ highlight diffchange  cterm=italic    ctermfg=black   ctermbg=darkblue   |
        \ highlight diffdelete  cterm=bold      ctermfg=black   ctermbg=red        |
        \ highlight difftext    cterm=italic    ctermfg=black   ctermbg=blue

colorscheme peachpuff

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
vnoremap p pgvy
tnoremap <Esc> <C-\><C-n>
noremap <leader>s :set spell! spelllang=en_gb<CR>
noremap <leader><leader> i<space><esc>

" move by screen line instead of file line (unless prepended with number)
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" indentation
nnoremap <Tab>   >>
nnoremap <S-Tab> <<
vnoremap <Tab>   >><Esc>gv
vnoremap <S-Tab> <<<Esc>gv

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

"syntax
autocmd BufNewFile,BufRead *.yuck set syntax=lisp
autocmd BufNewFile,BufRead *.rasi, *.scss set syntax=css

function! Maths()
    " Block math. Look for "$$[anything]$$"
    syn region math start=/\$\$/ end=/\$\$/
    " inline math. Look for "$[not $][anything]$"
    syn match math_block '\$[^$].\{-}\$'
    " Fenced code blocks
    syn region highlight_block start='```' end='```'

    "" highlight those regions.
    hi link math Statement
    hi link highlight_block Function
    hi link math_block Function
endfunction

" preview 
autocmd BufRead,BufNewFile,BufEnter *.md,*.markdown 
    \ call Maths() |
    \ nnoremap <leader>p :w <bar> ! pandoc -f markdown -t pdf -C % \| zathura -<CR>
autocmd FileType glsl nnoremap <leader>p :w<CR> :GlslView<CR>

"PACKAGE BINDS AND SETTINGS

"mics
filetype plugin on
syntax on
set nocompatible

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

" lispy
let g:slime_target = "neovim"

call plug#begin()
Plug 'tpope/vim-commentary'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tmsvg/pear-tree'
Plug 'vim-syntastic/syntastic'
Plug 'ap/vim-css-color'

Plug 'jpalardy/vim-slime' , { 'branch': 'main'}
Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release'}

Plug 'tikhomirov/vim-glsl'
Plug 'timtro/glslView-nvim'
call plug#end()

" Plug 'dag/vim-fish'
" Plug 'deoplete-plugins/deoplete-jedi'
" Plug 'davidhalter/jedi-vim'

