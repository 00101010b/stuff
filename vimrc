" Editor settings
set nocompatible
set number
colorscheme koehler
set shiftwidth=4
set softtabstop=4
set autoindent
set smarttab
set smartindent
syntax on
filetype off
set expandtab
set guifont=Hack\ for\ Powerline:h18  " I am on a retina MacBook Pro, hence the large size
set clipboard=unnamed
set columns=100
set lines=38

" Python Interpretor
let g:python_host_prog = '/usr/bin/python'

" For Powerline-Status Plugin to work
set laststatus=2



" VUNDLE PACKAGE MANAGER
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage itself
Plugin 'VundleVim/Vundle.vim'

" Add plugins below here
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Valloric/YouCompleteMe'
Plugin 'plasticboy/vim-markdown'
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

call vundle#end()
filetype plugin indent on
