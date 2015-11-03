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
set guifont=Hack\ for\ Powerline:h18
set clipboard=unnamed
set columns=100
set lines=38

" Python Interpretor
let g:python_host_prog = '/usr/bin/python'

" Install powerline-status
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2



" VUNDLE PACKAGE MANAGER
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Add plugins here
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Valloric/YouCompleteMe'
Plugin 'plasticboy/vim-markdown'

call vundle#end()
filetype plugin indent on
