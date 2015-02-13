" Encoding
set encoding=utf-8

" Tabulations size
set  tabstop =2
set  shiftwidth =2
set  softtabstop =2

set  expandtab

" Autoindent
set ai
set smartindent
set cindent 
set autoindent

" Line numbers
set  nu

" Mouse
set  mouse =a

" Parenthesis
set  showmatch

set background=light

" Rules
set ruler

set t_ti= t_te=

" HL search results
set hlsearch

colorscheme elflord

filetype plugin on
syntax on

syntax cluster sassCssAttributes add=@cssColors

augroup vimrc_autocmds
autocmd!
  " highlight characters past column 120
  autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
  autocmd FileType python match Excess /\%120v.*/
  autocmd FileType python set nowrap
  augroup END

" Bundles

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Required
Bundle 'gmarik/vundle'

filetype plugin indent on

" PowerLine configuration
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Powerline Colors
set t_Co=256
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2

" Fugitive
Bundle 'tpope/vim-fugitive'

"NERDTree
Bundle 'scrooloose/nerdtree'
