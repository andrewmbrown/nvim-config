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

" set control n to nerdtree focus in current directory
map <C-n> :NERDTreeToggle %<CR>
" for surround map s to surround
nmap s ys 

" set up barbar
" close tabs
" Move to previous/next
nnoremap <silent>    <C-h> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <C-l> <Cmd>BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <C-<> <Cmd>BufferMovePrevious<CR>
nnoremap <silent>    <C->> <Cmd>BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <C-1> <Cmd>BufferGoto 1<CR>
nnoremap <silent>    <C-2> <Cmd>BufferGoto 2<CR>
nnoremap <silent>    <C-3> <Cmd>BufferGoto 3<CR>
nnoremap <silent>    <C-4> <Cmd>BufferGoto 4<CR>
nnoremap <silent>    <C-5> <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <C-6> <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <C-7> <Cmd>BufferGoto 7<CR>
nnoremap <silent>    <C-8> <Cmd>BufferGoto 8<CR>
nnoremap <silent>    <C-9> <Cmd>BufferGoto 9<CR>
nnoremap <silent>    <C-0> <Cmd>BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <C-p> <Cmd>BufferPin<CR>

" Change window mapping from C-w to C-m
" terminal must enter normal mode before switching, map it easier
tnoremap <C-W>h <C-\><C-n><C-W>h
tnoremap <C-W>l <C-\><C-n><C-W>l
tnoremap <C-W>j <C-\><C-n><C-W>j
tnoremap <C-W>k <C-\><C-n><C-W>k
" Close buffer
nnoremap <silent>    <C-y> <Cmd>BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout
" Close commands
"                          :BufferCloseAllButCurrent
"                          :BufferCloseAllButPinned
"                          :BufferCloseAllButCurrentOrPinned
"                          :BufferCloseBuffersLeft
"                          :BufferCloseBuffersRight
" Sort automatically by...
nnoremap <silent> <Space>bb <Cmd>BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd <Cmd>BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl <Cmd>BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw <Cmd>BufferOrderByWindowNumber<CR>

" Float term open like vscode - small terminal at bottom of screen
nnoremap <silent> <C-t> <Cmd>:FloatermNew --height=0.2 --wintype=split --name=floaterm1 --position=botright --autoclose=0<CR>
" Regular FloatTerm
nnoremap <silent> <C-\><C-t> <Cmd>:FloatermNew --height=1.0 --width=0.8 --wintype=float --position=center --autoclose=0<CR>

" Allow Coc to autocomplete with tab
" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" shortcut for fuzzyfinder
nnoremap <C-f> <Cmd>:Files .<CR>

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
set tabstop=4
set softtabstop=4
set expandtab
set relativenumber
set shiftwidth=4

