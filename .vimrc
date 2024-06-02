"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM Configuration File                                                "
"                                                                       "
" Description:  base configuration for C/C++ development                "
" Author:       Viktor Shepel                                           "
" Date:         17.09.2012                                              "
"                                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on

" disable vi compatibility
set nocompatible

" switch from unsaved buffer
set hidden

" display cursor row/column/percentage
set noruler

" set UTF-8 encoding
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,default,latin1
set termencoding=utf-8

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

" wrap lines at 80 chars
set textwidth=80
set paste

" invisible symbols
set listchars=space:·,tab:>_,eol:¬,trail:·,nbsp:↔,precedes:«,extends:»

" turn syntax highlighting on
syntax enable
syntax on

" turn line numbers on
set number
set relativenumber

" highlight matching braces
set showmatch

" search settings
set hlsearch
set incsearch

" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" leader key
let mapleader = ","

" file manipulation
nmap <leader>s :write<CR>
nmap <S-q> :qall!<CR>

" command mode entry
nnoremap ; :

" build

let g:TTY="/dev/pts/2"

func CBuild(file)
  let exe = fnamemodify(a:file, ":r") . '.exe'
  let cmd = printf(
  \  "ttyecho -n %s gcc -std=c99 -Wall -pedantic -P -E %s ",
  \  g:TTY,
  \  a:file,
  \)
  "let cmd = printf(
  "\  "ttyecho -n %s gcc -std=c99 -Wall -pedantic -g %s -o %s \\\&\\\& ./%s",
  "\  g:TTY,
  "\  a:file,
  "\  exe,
  "\  exe
  "\)
  call system(cmd)
endfunc

func CppBuild(file)
  let exe = fnamemodify(a:file, ":r") . '.exe'
  let cmd = printf(
  \  "ttyecho -n %s g++ -std=c++17 -Wall -g -pthread %s -o %s \\\&\\\& ./%s",
  \  g:TTY,
  \  a:file,
  \  exe,
  \  exe
  \)
  call system(cmd)
endfunc

func MakeBuild()
  let cmd = "ttyecho -n " . g:TTY . " make"
  call system(cmd)
endfunc

func MavenBuild()
  let cmd = "ttyecho -n " . g:TTY . " mvn package"
  let cmd = "ttyecho -n " . g:TTY . " mvn package \\\&\\\& java -cp target/jlox-1.0-SNAPSHOT.jar com.craftinginterpreters.lox.Lox"
  call system(cmd)
endfunc

func LatexBuild(file)
  call system("ttyecho -n " . g:TTY . " pdflatex -halt-on-error " . a:file)
endfunc

func RunPython(file)
  call system("ttyecho -n " . g:TTY . " python3 " . a:file)
endfunc

func PostgressREPL(file)
  call system("ttyecho -n " . g:TTY . " \\\\i " . a:file)
endfunc

"nmap <F2> :call MakeBuild()<CR>
nmap <F2> :call CBuild(expand("%"))<CR>
"nmap <F2> :call CppBuild(expand("%"))<CR>
"nmap <F2> :call MavenBuild()<CR>
"nmap <F2> :call LatexBuild(expand("%"))<CR>
"nmap <F2> :call RunPython(expand("%"))<CR>
"nmap <F2> :call PostgressREPL(expand("%"))<CR>
