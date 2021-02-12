call plug#begin('~/.vim/plugged')

Plug 'rafi/awesome-vim-colorschemes'
Plug 'wellle/targets.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'preservim/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'bronson/vim-visual-star-search'
Plug 'tpope/vim-rhubarb'

call plug#end()

let mapleader = ","

let g:deoplete#enable_at_startup = 1

let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let g:NERDTreeGitStatusUseNerdFonts = 1
map <Leader>n :NERDTreeFind<CR>

set number
set ignorecase
set updatetime=100
set mouse=a
set history=5000

let g:gitgutter_highlight_linenrs=1
" let g:gitgutter_highlight_lines=1

imap jj <ESC>

colorscheme OceanicNext

" This allows you to run :TS and it will search for the file name. Helpful in
" ruby with the naming convention
command! -nargs=* TS call fzf#run(fzf#wrap({ 'options': '--query ' . '"' . expand("%:t") . ' test"' }))
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
" map <C-t> <esc>:tabnew<CR>

map <C-h> :nohl<CR>
map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>


command! -bang -nargs=* Rgp
  \ call fzf#vim#grep(
  \   'rg --line-number --no-heading --color=always --smart-case '. <q-args>, 1,
  \   fzf#vim#with_preview({'options': ['--preview-window=up:60%']}), <bang>1)
