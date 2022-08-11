" NVIM Configuration File
" Created By: Andrew Brown
" Created On: Aug 9, 2022
" Description: This is the configuration file for the NVIM
"  I use vim-plug to manage plugins, might migrate to all lua soon
" to create this directory (using vim-plug), run the following command:
" curl -fLO $HOME/.conf/nvim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" ---------------------------------------------------------------------------------------------------------------------

" My setup
set nocompatible
" Turn filetype off while we load, then turn it on
filetype off

" Where all of our plugins go
call plug#begin('~/.config/nvim/plugged')
" Nice theme from gruvbox
Plug 'morhetz/gruvbox'
" Git control in local vim -> :Git {COMMAND}
Plug 'tpope/vim-fugitive'
" tree directory like vscode -> control n
Plug 'preservim/nerdtree'
" syntax checking, using node.js -> LSP language server protocol
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Smart parenthesis matching, and other stuff
Plug 'tmsvg/pear-tree'
" Treesitter is the syntax tree for vim
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" show git diff of added/removed lines, IDE-like
Plug 'airblade/vim-gitgutter'
" Float term allows us to spawn terminal inside vim
Plug 'voldikss/vim-floaterm'
" Github copilot for NLP autofill coding
Plug 'github/copilot.vim'
" fzf with fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" better fuzzy file searching with telescope
Plug 'BurntSushi/ripgrep'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

" enable NERDTreeFocus to show hidden files/folders
let NERDTreeShowHidden=1
" set colorscheme
colorscheme gruvbox

" set control n to nerdtree focus
map <silent> <C-n> :NERDTreeFocus <CR>

filetype plugin indent on
syntax on
set background=dark
set number
set nowrap
set smartcase
set hlsearch
set tabstop=4 softtabstop=4
set expandtab
set smartindent
set relativenumber

