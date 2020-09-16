" Disable setting the 'statusline' option
let g:airline_skip_empty_sections = 1

" Enable powerline fonts
let g:airline_powerline_fonts = 1

" Enable tabline extension and its configs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Change how columns are displayed for the csv extension
let g:airline#extensions#csv#column_display = 'Name'

" Invert the order that branch and hunks appear in the statusline
autocmd VimEnter * let g:airline_section_b = airline#section#create_left(['branch', 'hunks'])

" Force hunks to be shown in windows with smaller width
call airline#parts#define_minwidth('hunks', 50)

" Sections layout (first array is the left side, second array is the right side)
" let g:airline#extensions#default#layout = [ [ 'a', 'b', 'c' ], [ 'x', 'y', 'z' ] ]