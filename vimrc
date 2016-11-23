set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

Plugin 'ludovicchabant/vim-gutentags'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'janko-m/vim-test'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'sjl/gundo.vim'
Plugin 'sjl/vitality.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Pathogen
"filetype off
"call pathogen#incubate()
"call pathogen#helptags()

filetype indent on

autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

set number
set ttimeoutlen=30
set ts=2 sw=2 expandtab
set laststatus=2
set t_ti= t_te=
set directory=~/tmp
set wildmenu

let test#strategy = "dispatch"
let g:gutentags_cache_dir = '~/.tags_cache'

syntax enable
colorscheme solarized

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

nnoremap <Leader>a :Ag<space>

nnoremap <silent> <Leader>] :BufExplorer<CR>
nnoremap <silent> <Leader>o :NERDTreeToggle<CR>
nnoremap <silent> <Leader>d :GundoToggle<CR>
nnoremap <silent> <Leader>[ :A<CR>

nnoremap <silent> <Leader>r :source ~/.vimrc<CR>
nnoremap <silent> <Leader>z :edit $DOTFILES_PATH/zshrc<CR>
nnoremap <silent> <Leader>v :edit $DOTFILES_PATH/vimrc<CR>
nnoremap <silent> <Leader>c :edit $DOTFILES_PATH/tmux.conf<CR>

nnoremap <silent> <Leader>b :set background=dark<CR>
nnoremap <silent> <Leader>w :set background=light<CR>

inoremap <silent> jk <esc>:update<CR>
nnoremap <silent> <Leader>s :update<CR>

nnoremap <silent> <Leader>p :set paste!<CR>
nnoremap <silent> <Leader>n :set number!<CR>

nmap <silent> <Leader>t :TestNearest<CR>
nmap <silent> <Leader>T :TestFile<CR>
nmap <silent> <Leader>e :TestSuite<CR>
nmap <silent> <Leader>i :TestLast<CR>
nmap <silent> <Leader>h :TestVisit<CR>

nmap <silent> <Leader>g :Gstatus<CR>

nmap <silent> <Leader>m :!mine %<CR>

" Eye kan speel
inoremap acocunt account

" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
nnoremap <leader>f :call SelectaCommand("find * -type f", "", ":e")<cr>

set clipboard=unnamed
