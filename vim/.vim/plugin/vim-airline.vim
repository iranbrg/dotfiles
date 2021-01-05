" To get rid of the original statusline
set noshowmode
set noshowcmd

" Enable powerline fonts
let g:airline_powerline_fonts = 1

" Enable tabline extension and its configs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_buffers = 0

" enable/disable showing only non-zero hunks.
let g:airline#extensions#hunks#non_zero_only = 1
