"----------------
" Some Pre-config
"----------------
" Vi compatible mode is disabled so that Vim things work properly
set nocompatible

" Setting the output encoding shown in the terminal
set encoding=UTF-8

" Create the '.vim' folder if it doesn't exist
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif

" Create the 'undodir' folder if it doesn't exist
if !isdirectory($HOME."/.vim/undodir")
    call mkdir($HOME."/.vim/undodir", "", 0700)
endif

"---------------------
" Basic Editing Config
"---------------------
" Turn on syntax highlighting
syntax on

" Show matching braces when text indicator is over them
set showmatch

" Use 4 spaces instead of tabs during formatting
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Smart indenting
set autoindent
set smartindent

" Line numbering
set nu
set rnu

" Search config
set ignorecase
set smartcase
set hls
set incsearch

" Backup config
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Highlight current line
set cursorline

" Visual autocompletion for command-line mode
set wildmenu

" Have lines wrap instead of continue off-screen
set linebreak

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

"-------------------------------
" Plugins Instalation (vim-plug)
"-------------------------------
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" ### Text editing ###
" Code completion (after installation run: cd ~/.vim/plugged/youcompleteme and
" python3 install.py --all)
Plug 'valloric/youcompleteme'

" Text alignment
Plug 'godlygeek/tabular'

" Comment stuff out
Plug 'tpope/vim-commentary'

" Grammar checker
Plug 'rhysd/vim-grammarous'

" ### Files ###
" File finder
Plug 'kien/ctrlp.vim'

" Tree explorer
Plug 'scrooloose/nerdtree'

" ### Git ###
" Git integration
Plug 'tpope/vim-fugitive'

" Git status in tree explorer
Plug 'xuyuanp/nerdtree-git-plugin'

" Shows which lines have been added, modified, or removed and more
Plug 'airblade/vim-gitgutter'

" ### GUI ###
" Color scheme
Plug 'morhetz/gruvbox'

" Statusline
Plug 'itchyny/lightline.vim'

" ### Utilities ###
" Make a yanked region apparent
Plug 'machakann/vim-highlightedyank'

" Multiple cursors
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Undo history visualizer
Plug 'mbbill/undotree'

" Integrate grep like utilities (specially ripgrep)
Plug 'yegappan/grep'

" Initialize plugin system
call plug#end()

"----------------------
" Plugins configuration
"----------------------
" ### Gruvbox ###
colorscheme gruvbox
set background=dark

" ### NERDTree ###
" Automatically open when Vim starts up
autocmd vimenter * NERDTree

" After automatically NERDTree is opened the cursor is moved to left window
autocmd vimenter * wincmd l

" Automatically open when Vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close Vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ### Ctrlp ###
" Disable per-session caching
let g:ctrlp_use_caching=0

"------------
" Keybindings
"------------
" Setting <Leader> key to spacebar
let mapleader=" "

" toggle relative numbering
nnoremap <C-n> :set rnu!<CR>

" Ctrl+h to stop searching
vnoremap <C-h> :nohlsearch<cr>
nnoremap <C-h> :nohlsearch<cr>

" (Shift+)Tab (de)indents code
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_

" TODO: Alt+j/Alt+k to move code lines/blocks up and down (find a away to map
" the Alt key)
" nnoremap <A-j> :m .+1<CR>==
" nnoremap <A-k> :m .-2<CR>==
" inoremap <A-j> <Esc>:m .+1<CR>==gi
" inoremap <A-k> <Esc>:m .-2<CR>==gi
" vnoremap <A-j> :m '>+1<CR>gv=gv
" vnoremap <A-k> :m '<-2<CR>gv=gv

" Navigation through windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Undotree toggle
nnoremap <leader>u :UndotreeToggle<CR>

" NERDTree toggle and resizing
nnoremap <Leader>pt :NERDTreeToggle<CR> :vertical resize 30<CR>

" Find and reveal a file in the NERDTree window
nnoremap <Leader>pf :NERDTreeFind<SPACE>

" Go to definition
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

" Start ripgrep
nnoremap <Leader>ps :Rg<SPACE>
