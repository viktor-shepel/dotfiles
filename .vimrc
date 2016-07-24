"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM Configuration File                                                "
"                                                                       "
" Description:  base configuration for C/C++ development                "
" Author:       Viktor Shepel                                           "
" Date:         17.09.2012                                              "
"                                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" leader key
let mapleader = ","

" pathogen plugin
execute pathogen#infect()
filetype plugin indent on

" set UTF-8 encoding
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,default,latin1
set termencoding=utf-8

" disable vi compatibility
set nocompatible

" enable paste mode
set paste

" use indentation of previous line
set autoindent
set backspace=indent,eol,start

" use intelligent indentation for C
set smartindent

" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces

" wrap lines at 80 chars
set textwidth=80
set paste

" invisible symbols
set listchars=eol:¬,tab:→ ,trail:·,nbsp:↔,precedes:«,extends:»

" turn syntax highlighting on
syntax enable
syntax on

" colorscheme
set background=dark
set t_Co=256
colorscheme molokai

" turn line numbers on
set number

" highlight matching braces
set showmatch

" search settings
set hlsearch
set incsearch

" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" powerline plugin
"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" session plugin 
let g:session_autoload = 'no'
let g:toggle_list_no_mappings = 'yes'

" ctrlp plugin
map <silent> <leader>f :CtrlP<CR>
map <silent> <leader>b :CtrlPBuffer<CR>

" ToogleList plugin
map <script> <silent> <leader>e :call ToggleQuickfixList()<CR>

" NERDTree plugin
map <silent> <leader>t :NERDTreeToggle<CR>

" emmet plugin
let g:user_emmet_leader_key='<C-e>'

" show/hide unprintable symbols
nmap <silent> <leader>l :set list!<CR>

" file manipulation
nmap <leader>s :write<CR>
nmap <S-q> :qall!<CR>

" command mode entry
nnoremap ; :

" stupid easy motion plugin
nmap <silent> <leader>w <Leader><Leader>w
nmap <silent> ,W <Leader><Leader>W

" clear highlighted searches
nmap <silent> <leader>/ :nohlsearch<CR>

" tab navigation
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap tn :tabnew<CR>
nnoremap tc :tabclose<CR>

" absolute/relative line nubering
function! ToogleNumberingMode()
    if(&relativenumber== 1)
        set number
    else
        set relativenumber 
    endif
endfunc    

nnoremap <leader>r :call ToogleNumberingMode()<CR>

" cscope
nmap <leader>fs :cs find s <C-R><C-W><CR>                    " find all references to the symbol/token under cursor
nmap <leader>fg :cs find g <C-R><C-W><CR>                    " find global definition(s) of the token under cursor
nmap <leader>fc :cs find c <C-R><C-W><CR>                    " find all calls to the function name under cursor
nmap <leader>ft :cs find t <C-R><C-W><CR>                    " find all instances of the text under cursor
nmap <leader>fe :cs find e <C-R><C-W><CR>                    " egrep search for the word under cursor
nmap <leader>ff :cs find f <C-R>=expand("<cfile>")<CR><CR>   " open the filename under cursor
nmap <leader>fi :cs find i <C-R>=expand("<cfile>")<CR><CR>   " find files that include the filename under cursor
nmap <leader>fd :cs find d <C-R><C-W><CR>                    " find functions that function under cursor calls
