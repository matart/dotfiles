set number
" set relativenumber
set ignorecase
" set updatetime=100
set mouse=a
set history=5000

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
Plug 'wellle/targets.vim' " extended targets to change text
Plug 'junegunn/vim-peekaboo' " opens side panel with register values
Plug 'junegunn/gv.vim' " git commit viewer
Plug 'jeetsukumaran/vim-buffergator'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'benmills/vimux'
Plug 'dewyze/vim-ruby-block-helpers'
Plug 'dewyze/vim-tada'
Plug 'tpope/vim-abolish'
Plug 'henrik/vim-indexed-search'
Plug 'janko-m/vim-test'
Plug 'kana/vim-textobj-user'

" cs - change surround
" ys - you surround
" ds - delete surround
Plug 'tpope/vim-surround'

" Plug 'arthurxavierx/vim-caser'
" Plug 'edkolev/tmuxline.vim'
" Plug 'github/copilot.vim'
" Plug 'tpope/vim-rails'
" Plug 'ryanoasis/vim-devicons'
" Plug 'bronson/vim-visual-star-search'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_serverCommands = {
      \ 'ruby': ['bundle', 'exec', 'srb', 'tc', '--lsp'],
      \ 'typescript': ['typescript-language-server', '--stdio'],
      \ 'typescriptreact': ['typescript-language-server', '--stdio'],
      \ }
" Plug 'Shopify/vim-sorbet', { 'branch': 'main' } " Turns sorbet signatures to comment colorscheme	
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)

call plug#end()

let mapleader = ","
 
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
map <Leader>n :NERDTreeFind<CR>
 
let g:gitgutter_highlight_linenrs=1
" let g:gitgutter_highlight_lines=1
" 
imap jj <ESC>
 
colorscheme OceanicNext
 
" This allows you to run :TS and it will search for the file name. Helpful in
" ruby with the naming convention
command! -nargs=* TS call fzf#run(fzf#wrap({ 'options': '--query ' . '"' . expand("%:t") . ' test.rb$"' }))
nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>
nmap <C-f> :FZF<CR>
nmap <C-t> :TS<CR>
" Space + s to save current file
nmap <C-W>m <C-W>\| <C-W>_
nmap <leader>s :w<cr>
map <C-h> :nohl<CR>
 
" ========= Plugin Settings ========
" 'AndrewRadev/splitjoin.vim'
let g:splitjoin_trailing_comma = 1
let g:splitjoin_ruby_hanging_args = 0
let g:splitjoin_ruby_curly_braces = 0

" 'janko-m/vim-test'
let test#strategy = "vimux"
let test#ruby#rspec#executable = 'bundle exec rspec'

" function! TestContext()
"   wall
"   let [_, lnum, cnum, _] = getpos('.')
"   RubyBlockSpecParentContext
"   TestNearest
"   call cursor(lnum, cnum)
" endfunction

" command! TestContext :call TestContext()

" autocmd FileType ruby,erb nnoremap <silent> <LocalLeader>rc :TestContext<CR>
nnoremap <silent> <leader>rt :wa<CR>:TestNearest<CR>
nnoremap <silent> <leader>rf :wa<CR>:TestFile<CR>
nnoremap <silent> <leader>ra :wa<CR>:TestSuite<CR>
nnoremap <silent> <leader>rl :wa<CR>:TestLast<CR>

if filereadable(glob("dev.yml"))
  let test#ruby#rspec#executable = 'dev test'
  let test#ruby#minitest = 'dev test'
  let test#ruby#rails#executable = 'dev test'
end

" 'benmills/vimux'
let g:VimuxUseNearestPane = 1

" 'airblade/vim-gitgutter'
nmap <C-j> :GitGutterNextHunk<CR>
nmap <C-k> :GitGutterPrevHunk<CR>
