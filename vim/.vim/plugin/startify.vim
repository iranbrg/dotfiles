 " Disable default startup message
set shortmess+=I

" Once a session is loaded, it gets saved automatically when Vim is quit
let g:startify_session_persistence = 1

" Once Vim is started in a directory that contains a `Session.vim`, that session will be loaded automatically.
" Otherwise it will be shown as the top entry in the Startify buffer.
let g:startify_session_autoload = 1

" Delete all buffers when loading or closing a session
" let g:startify_session_delete_buffers = 1

" When opening a file, seek and change to the root directory of the VCS.
let g:startify_change_to_vcs_root = 1

let g:startify_fortune_use_unicode = 1

" The number of spaces used for left padding.
" let g:startify_padding_left = 10

" Doesn't show <empty buffer> and <quit>.
let g:startify_enable_special = 0

" Define and center a random boxed quotes header.
" let g:startify_custom_header = 'startify#center(startify#fortune#boxed())'

" Disable random quotes header
let g:startify_custom_header = []

" Enable cursorline in Startify screen
autocmd User Startified setlocal cursorline

" Get both NERDTree and Startify working at startup
" autocmd VimEnter *
"             \   if !argc()
"             \ |   Startify
"             \ |   NERDTree
"             \ |   wincmd w
"             \ | endif

" Run Startify for each new tab
" TODO: Only wheter it's an empty buffer
 " if has('nvim')
 "   autocmd TabNewEntered * Startify
 " else
 "   autocmd BufWinEnter *
 "         \ if !exists('t:startify_new_tab')
 "         \     && empty(expand('%'))
 "         \     && empty(&l:buftype)
 "         \     && &l:modifiable |
 "         \   let t:startify_new_tab = 1 |
 "         \   Startify |
 "         \ endif
 " endif

let g:startify_lists = [
      \ { 'type': 'files',     'header': ['    Recent Files']            },
      \ { 'type': 'dir',       'header': ['    Recent Files In Current Directory '.''.getcwd()] },
      \ { 'type': 'sessions',  'header': ['    Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['    Bookmarks']      },
      \ { 'type': 'commands',  'header': ['    Commands']       },
      \ ]

let g:startify_bookmarks = [
            \  '~/.vim/vimrc',
            \  '~/.tmux.conf',
            \  '~/.zshrc',
            \  '~/.config/kitty/kitty.conf',
            \ ]
