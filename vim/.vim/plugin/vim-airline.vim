" To get rid of the original statusline
set noshowmode
set noshowcmd

" Enable powerline fonts
let g:airline_powerline_fonts = 1

" Enable tabline extension and its configs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_buffers = 0

" Change how columns are displayed for the csv extension
let g:airline#extensions#csv#column_display = 'Name'

" If not set to 1, vim-airline will not consider to use coc-git for the hunks extension.
let g:airline#extensions#hunks#coc_git = 1

" enable/disable showing only non-zero hunks.
let g:airline#extensions#hunks#non_zero_only = 1
