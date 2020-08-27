"Iran Braga
"https://github.com/iranbrg
"http://www.linkedin.com/in/iranbrg

"----------------
" Some Pre-config
"----------------
" Vi compatible mode is disabled so that Vim things work properly
set nocompatible

" Setting the output encoding shown in the terminal
set encoding=UTF-8

" Always show the status line at the bottom, even if you only have one window open.                                
set laststatus=2

" Let you hide a buffer (i.e. have a buffer that isn't shown in any window)
set hidden

" Enable mouse support
set mouse+=a

" To get rid of thing like --INSERT--
set noshowmode

" To get rid of display of last command
set noshowcmd

" Load filetype-specific indent and plugin files
filetype plugin indent on

" Improve smoothness of redrawing
set ttyfast

" Set to force 256 colors
set t_Co=256

" Create the '.vim' folder if it doesn't exist
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif

" Create the 'undodir' folder if it doesn't exist
if !isdirectory($HOME."/.vim/undodir")
    call mkdir($HOME."/.vim/undodir", "", 0700)
endif

" Automatic vim-plug (plugin manager) installation
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    " --sync flag is used to block the execution until the installer finishes
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"---------------------
" Basic Editing Config
"---------------------
" Turn on syntax highlighting
syntax on

" Show matching braces when text indicator is over them
set showmatch

" Use 4 spaces instead of tabs during formatting
set tabstop=4       " Number of visual spaces per TAB
set softtabstop=4   " Number of spaces in tab when editing
set shiftwidth=4    " Insert 4 spaces on a tab
set expandtab       " Tabs are spaces

" Smart indenting
set autoindent
set smartindent

" Line numbering
set nu
set rnu

" Search config
set hlsearch
set incsearch
set ignorecase
set smartcase

" Backup config
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Visual autocompletion for command-line mode
set wildmenu
set wildmode=list:full

" Have lines wrap instead of continue off-screen
set linebreak

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Show lines above and below cursor (when possible)
set scrolloff=3

" Highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

"---------------------
" Plugins Installation
"---------------------
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" ### Text editing ###
" Code completion
Plug 'valloric/youcompleteme', { 'do': 'python3 install.py --all' }

" Text alignment
Plug 'godlygeek/tabular'

" Comment stuff out
Plug 'tpope/vim-commentary'

" Easily delete, change and add surroundings in pairs.
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

" Wisely add 'end' in ruby, endfunction/endif/more in vim script, etc
Plug 'tpope/vim-endwise'

" Linter
 Plug 'w0rp/ale'

" ### Files ###
" File finder
Plug 'kien/ctrlp.vim'

" Tree explorer
Plug 'scrooloose/nerdtree'

" ### Git ###
" Git integration
Plug 'tpope/vim-fugitive'

" Git status in NERDTree explorer
Plug 'xuyuanp/nerdtree-git-plugin'

" Shows which lines have been added, modified, or removed and more
Plug 'airblade/vim-gitgutter'

" ### GUI ###
" Color scheme
Plug 'morhetz/gruvbox'

" Statusline and its themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ### Utilities ###
" Make a yanked region apparent
Plug 'machakann/vim-highlightedyank'

" Multiple cursors
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Undo history visualizer
Plug 'mbbill/undotree'

" Integrate grep like utilities (specially ripgrep)
Plug 'yegappan/grep'

" Display the indention levels
Plug 'yggdroot/indentline'

" A filetype plugin for csv files 
Plug 'chrisbra/csv.vim'

" Initialize plugin system
call plug#end()

"----------------------
" Plugins Configuration
"----------------------
" ### Gruvbox ###
colorscheme gruvbox
set background=dark

" ### NERDTree ###
" Automatically open when Vim starts up
autocmd vimenter * NERDTree

" After automatically NERDTree is opened the cursor is moved to right window
autocmd vimenter * wincmd l

" Automatically open when Vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close Vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Resize NERDTree window
let g:NERDTreeWinSize=30

" ### Undotree ###
" Open the undotree window relative to the tracked window and resizes it
let g:undotree_CustomUndotreeCmd = 'vertical 30 new'
let g:undotree_CustomDiffpanelCmd= 'belowright 10 new'

" Undotree window get focus after being opened
let g:undotree_SetFocusWhenToggle = 1

" Set short relative timestamps (e.g. '5 s' rather '5 seconds ago')
let g:undotree_RelativeTimestamp=1
let g:undotree_ShortIndicators=1

" Close Vim if the only window left open is a undotree
autocmd bufenter * if (winnr("$") == 1 && exists("b:UndotreeToggle") && b:UndotreeToggle.isTabTree()) | q | endif

" ### CtrlP ###
" Disable per-session caching
let g:ctrlp_use_caching=0

" ### Vim-airline ###
" Enable powerline fonts
let g:airline_powerline_fonts = 1

" Enable plain ascii symbols
let g:airline_symbols_ascii = 1

" Smarter tab line
let g:airline#extensions#tabline#enabled = 1

" Enable tab line to show buffer number
let g:airline#extensions#tabline#buffer_nr_show = 1

" Disable setting the 'statusline' option 
let g:airline_skip_empty_sections = 1

" Set which path formatter vim-airline uses on tab line
let g:airline#extensions#tabline#formatter = 'unique_tail'

" ### indentLine ###
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

"------------
" Keybindings
"------------
" Setting <Leader> key to spacebar
let mapleader=" "

" Make backspace behave more reasonably, in that you can backspace over anything
set backspace=indent,eol,start

" Unbind the annoying 'Q' which in normal mode enters Ex mode
nmap Q <Nop> 

" Search results are centered
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz

" Stop indenting when text is pasted
set pastetoggle=<F2>

" Toggle relative numbering
nnoremap <silent> <F3> :set rnu!<CR>

" Ctrl+h to stop searching
vnoremap <silent> <C-h> :nohlsearch<cr>
nnoremap <silent> <C-h> :nohlsearch<cr>

" (Shift+)Tab (de)indents code
inoremap <silent> <S-Tab> <C-d>
vnoremap <silent> <Tab> >gv
vnoremap <silent> <S-Tab> <gv
nnoremap <silent> <Tab> >>_
nnoremap <silent> <S-Tab> <<_

" F4/F5 to move code lines/blocks up and down
nnoremap <F4> :m .+1<CR>==
nnoremap <F5> :m .-2<CR>==
inoremap <F4> <Esc>:m .+1<CR>==gi
inoremap <F5> <Esc>:m .-2<CR>==gi
vnoremap <F4> :m '>+1<CR>gv=gv
vnoremap <F5> :m '<-2<CR>gv=gv

" Navigation through windows
nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>k :wincmd k<CR>
nnoremap <silent> <leader>l :wincmd l<CR>

" Undotree toggle
nnoremap <silent> <F7> :UndotreeToggle<CR>

" NERDTree toggle
nnoremap <silent> <F6> :NERDTreeToggle<CR>

" Find and reveal a file in the NERDTree window
nnoremap <Leader>pf :NERDTreeFind<SPACE>

" Go to definition
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

" Start ripgrep
nnoremap <Leader>ps :Rg<SPACE>

" Navigate through tabs
nnoremap <silent> tk :tabnew<CR>
nnoremap <silent> tj :tabclose<CR>
nnoremap <silent> tl :tabnext<CR>
nnoremap <silent> th :tabprev<CR>

" Callback function, so the key mappings only works on the undotree window
function g:Undotree_CustomMap()
    " Clear undotree history
    nmap <buffer> H <plug>UndotreeClearHistory
endfunc

" Split window
nnoremap <silent> <Leader>wh :sp<CR>
nnoremap <silent> <Leader>wv :vsp<CR>

" Close window
nnoremap <silent> <Leader>wc :wincmd c<CR>

" Resize window
noremap <silent> <Leader><Left> :vertical resize +5<CR>
noremap <silent> <Leader><Right> :vertical resize -5<CR>
noremap <silent> <Leader><Up> :resize +5<CR>
noremap <silent> <Leader><Down> :resize -5<CR>
noremap <silent> <Leader>= :wincmd =<CR>

" Open terminal window
nnoremap <Leader>wt :terminal<CR>

" Close terminal window
tnoremap <Leader>wc <C-\><C-n>:q!<CR>

" Enter terminal normal mode
tnoremap <ESC> <C-\><C-n>

" Change window from vertical to horizontal
map <Leader>w<Up> :call VerticalToHorizontal()<CR>

" Change window from horizontal to vertical
map <Leader>w<Down> :call HorizontalTovertical()<CR>

" Close NERDTree if it's open before flip window from vertical to horizontal and after that reopen it
function g:VerticalToHorizontal()
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
        execute ":NERDTreeClose"
        execute ":wincmd" "t"
        execute ":wincmd" "H"
        execute ":NERDTree"
    else
        execute ":wincmd" "t"
        execute ":wincmd" "H"
    endif
endfunc

" Close NERDTree if it's open before flip window from horizontal to vertical and after that reopen it
function g:HorizontalTovertical()
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
        execute ":NERDTreeClose"
        execute ":wincmd" "t"
        execute ":wincmd" "K"
        execute ":NERDTree"
    else
        execute ":wincmd" "t"
        execute ":wincmd" "K"
    endif
endfunc

" Fast edit '.vimrc' file
nmap <leader>e :e! $MYVIMRC<CR>
