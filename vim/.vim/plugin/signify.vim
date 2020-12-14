" Make the gutter (sign column) invisible
highlight SignColumn ctermbg=NONE cterm=NONE guibg=NONE gui=NONE

" The sign to use if a line was added, deleted or changed
let g:signify_sign_add = '▐'
let g:signify_sign_delete = '▐'
let g:signify_sign_change = '▐'
let g:signify_sign_delete_first_line = '▐'

" Don't show the number of deleted lines to |g:signify_sign_delete|
let g:signify_sign_show_count = 0

" Colors for the signs
highlight SignifySignAdd    guifg=#b8ba25 cterm=NONE gui=NONE
highlight SignifySignDelete guifg=#fa4933 cterm=NONE gui=NONE
highlight SignifySignChange guifg=#458488 cterm=NONE gui=NONE

" Colors for the lines when highlighted
highlight SignifyLineAdd    guibg=#b8ba25 guifg=Black cterm=NONE gui=NONE
highlight SignifyLineDelete guibg=#fa4933 guifg=Black cterm=NONE gui=NONE
highlight SignifyLineChange guibg=#458488 guifg=Black cterm=NONE gui=NONE

" Navigate hunks of current buffer
nmap ]h <Plug>(signify-next-hunk)
nmap [h <Plug>(signify-prev-hunk)

" Show hunk diff at current position
nmap <silent> <Leader>hp :SignifyHunkDiff<CR>

" TODO: Command to stage current hunk (like this below with coc-git)
" nmap <silent> <Leader>hs :CocCommand git.chunkStage<CR>

" Undo current hunk.
nmap <silent> <Leader>hu :SignifyHunkUndo<CR>

nnoremap <Leader>hh :SignifyToggleHighlight<CR>
