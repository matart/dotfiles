call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs' " Add bracket pair
Plug 'tpope/vim-commentary' " add comment gcc, gc, etc
Plug 'tpope/vim-endwise' " completed do end blocks for ruby
Plug 'tpope/vim-fugitive' " Git functionality
Plug 'tpope/vim-rhubarb' " Github extension for fugitive
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " FZF short cuts
Plug 'junegunn/fzf.vim' " ?
Plug 'preservim/nerdtree' " File viewer
Plug 'rafi/awesome-vim-colorschemes' " Colorschemes
Plug 'airblade/vim-gitgutter' " Adds changed lines in the right gutter
Plug 'vim-airline/vim-airline' " Adds line at the bottom of the 
Plug 'wellle/targets.vim'
Plug 'junegunn/vim-peekaboo'
" Plug 'tpope/vim-rails'
" Plug 'junegunn/gv.vim'
" Plug 'ryanoasis/vim-devicons'
" Plug 'bronson/vim-visual-star-search'

call plug#end()

let mapleader = ","
" 
" 
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
map <Leader>n :NERDTreeFind<CR>
" 
set number
set relativenumber
" set ignorecase
" set updatetime=100
set mouse=a
set history=5000
" 
" let g:gitgutter_highlight_linenrs=1
" " let g:gitgutter_highlight_lines=1
" 
imap jj <ESC>
" 
colorscheme OceanicNext
" 
" " This allows you to run :TS and it will search for the file name. Helpful in
" " ruby with the naming convention
command! -nargs=* TS call fzf#run(fzf#wrap({ 'options': '--query ' . '"' . expand("%:t") . ' test.rb$"' }))
" map <C-s> <esc>:w<CR>
" imap <C-s> <esc>:w<CR>
" map <C-t> <esc>:tabnew<CR>
map <C-h> :nohl<CR>
map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>
" 
" 
" command! -bang -nargs=* Rgp
"   \ call fzf#vim#grep(
"   \   'rg --line-number --no-heading --color=always --smart-case '. <q-args>, 1,
"   \   fzf#vim#with_preview({'options': ['--preview-window=up:60%']}), <bang>1)
