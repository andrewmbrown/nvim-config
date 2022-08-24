" NVIM Configuration File
" Created By: Andrew Brown
" Created On: Aug 9, 2022
" Description: nvim config file
" I use vim-plug to manage plugins, might migrate to all lua soon
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
" tpope surround for easy surround edits
Plug 'tpope/vim-surround'
" tpope vim-commentary for easy commenting
Plug 'tpope/vim-commentary'
" barbar for nvim tabs
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
call plug#end()

" enable NERDTreeFocus to show hidden files/folders
let NERDTreeShowHidden=1
" set colorscheme
colorscheme gruvbox

" set control n to nerdtree focus
map <silent> <C-n> :NERDTreeFocus <CR>
" for surround map s to surround
nmap s ys 

" set up barbar
" close tabs
" Move to previous/next
nnoremap <silent>    <C-h> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <C-l> <Cmd>BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> <Cmd>BufferMovePrevious<CR>
nnoremap <silent>    <A->> <Cmd>BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
nnoremap <silent>    <A-5> <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <A-p> <Cmd>BufferPin<CR>

" Close buffer
nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout
" Close commands
"                          :BufferCloseAllButCurrent
"                          :BufferCloseAllButPinned
"                          :BufferCloseAllButCurrentOrPinned
"                          :BufferCloseBuffersLeft
"                          :BufferCloseBuffersRight
" Magic buffer-picking mode
nnoremap <silent> <C-p>    <Cmd>BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bb <Cmd>BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd <Cmd>BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl <Cmd>BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw <Cmd>BufferOrderByWindowNumber<CR>

filetype plugin indent on
syntax on
"enable scrolling with mouse a
set mouse=a
set encoding=utf-8
set background=dark
set number
set nowrap
set smartcase
set hlsearch
set tabstop=4 softtabstop=4
set expandtab
set smartindent
set relativenumber

