" Editor settings
:set nobackup
:set nowritebackup
:set nocompatible
:set number
:colorscheme koehler
:set shiftwidth=4
:set softtabstop=4
:syntax on
:filetype off
:set expandtab
:set guifont=Hack\ for\ Powerline
:set clipboard=unnamed

" Pathogen Package Manager
" execute pathogen#infect() 

" Powerline Settings
let g:Powerline_symbols = 'fancy'

" Python Interpretor
let g:python_host_prog = '/usr/bin/python'

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

