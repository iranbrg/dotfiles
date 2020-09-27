" To get rid of the original statusline
set noshowmode
set noshowcmd

" Always show tabs
set showtabline=2

" Setting a theme
" let g:airline_theme='tomorrow'

" Disable setting the 'statusline' option
let g:airline_skip_empty_sections = 1

" Enable powerline fonts
let g:airline_powerline_fonts = 1

" Enable tabline extension and its configs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:airline#extensions#tabline#show_buffers = 0

" Change how columns are displayed for the csv extension
let g:airline#extensions#csv#column_display = 'Name'

" If not set to 1, vim-airline will not consider to use coc-git for the hunks extension.
let g:airline#extensions#hunks#coc_git = 1

" enable/disable showing only non-zero hunks.
" let g:airline#extensions#hunks#non_zero_only = 1

" Invert the order that branch and hunks appear in the statusline
autocmd VimEnter * let g:airline_section_b = airline#section#create_left(['branch', 'hunks'])

" Force hunks to be shown in windows with smaller width
call airline#parts#define_minwidth('hunks', 50)

" Sections layout (first array is the left side, second array is the right side)
" let g:airline#extensions#default#layout = [ [ 'a', 'b', 'c' ], [ 'x', 'y', 'z' ] ]
