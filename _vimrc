source $VIMRUNTIME/vimrc_example.vim

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

set secure
set exrc

set number

nmap <C-s> :w<CR>
imap <C-s> <ESC>:w<CR>a

set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

set tabstop=4
set shiftwidth=4
set smarttab
set noet
retab

set clipboard=unnamedplus

set nowrap
set noswapfile

set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files

set ai
set cin

set showmatch
set hlsearch
set incsearch
set ignorecase

set lz

set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koir8-r,ucs-2,cp866

set guioptions-=T
set guioptions-=m
set guioptions-=L
set guioptions-=r

autocmd BufRead *.sql set filetype=mysql      

imap jk <esc>
imap kj <esc>

autocmd FileType php set omnifunc=phpcomplete#CompletePHP

nmap <C-N>v :NERDTree<cr>
vmap <C-N>v <esc>:NERDTree<cr>i
imap <C-N>v <esc>:NERDTree<cr>i

nmap <C-N>x :NERDTreeClose<cr>
vmap <C-N>x <esc>:NERDTreeClose<cr>i
imap <C-N>x <esc>:NERDTreeClose<cr>i

" let g:NERDTreeDirArrows = 0
" let g:NERDTreeDirArrowExpandable = '+'
" let g:NERDTreeDirArrowCollapsible = '-'

let g:move_key_modifier = 'C'

let g:user_emmet_leader_key='<C-e>'
let g:user_emmet_install_global = 0

autocmd BufNewFile,BufReadPost *.styl set filetype=stulus
" autocmd BufRead,BufNewFile *.styl set filetype=sass

autocmd FileType html,css,sass,scss,stylus EmmetInstall
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")


let g:EasyMotion_samrtcase = 1
let g:EasyMotion_do_share = 0

hi link EasyMotionTarget Search

set encoding=utf-8
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11

let g:airline_theme = 'deep_space'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_section_warining = ''
let g:airline_section_error = ''
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#keymap#enabled = 0

let g:tagbar_sort = 0
" let g:tagbar_iconchars = ['+', '-']
let g:tagbar_map_close = '<C-m>'

let g:tagbar_type_php = {
\   'ctagstype': 'php',
\ 'kinds': [
\   'i:interfaces',
\   'c:classes',
\   'd:constants',
\   'f:functions'
\ ]
\}

" <Leader>f{char} to move to {char}
map  <C-f> <Plug>(easymotion-bd-f)
nmap <C-f> <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap <Leader>s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>s <Plug>(easymotion-bd-jk)
nmap <Leader>s <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" typescript plugin
let g:tsuquyomi_completion_detail = 1

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
call plug#begin('~\vimfiles\plugged')

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'matze/vim-move'
Plug 'raimondi/delimitmate'
Plug 'artem8086/emmet-vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'gabrielelana/vim-markdown'

Plug 'majutsushi/tagbar'

" php
Plug 'stanangeloff/php.vim'
Plug 'sumpygump/php-documentor-vim'
Plug 'arnaud-lb/vim-php-namespace'

" javascript
Plug 'pangloss/vim-javascript'

" typescript
Plug 'Quramy/tsuquyomi'

" html
Plug 'othree/html5.vim'

Plug 'ansman/vim-jade'
Plug 'iloginow/vim-stylus'
Plug 'kchmck/vim-coffee-script'

" css
Plug 'mtscout6/vim-tagbar-css'

" colors
" Plug 'damage220/solas.vim', {'as': 'solas'}
" Plug 'nanotech/jellybeans.vim', {'as': 'jellybeans'}
" Plug 'mhartington/oceanic-next'
Plug 'tyrannicaltoucan/vim-deep-space'

call plug#end()

" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
" colorscheme OceanicNext
" colorscheme solas

let g:deepspace_italics=1
set background=dark
set termguicolors
colorscheme deep-space
