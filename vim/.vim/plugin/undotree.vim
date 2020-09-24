" Open the undotree window relative to the tracked window and resizes it
let g:undotree_CustomUndotreeCmd = 'vertical 30 new'
let g:undotree_CustomDiffpanelCmd = 'belowright 10 new'

" Undotree window get focus after being opened
let g:undotree_SetFocusWhenToggle = 1

" Set short relative timestamps (e.g. '5s' rather than '5 seconds ago')
let g:undotree_RelativeTimestamp=1
let g:undotree_ShortIndicators=1

" Close Vim if the only window left open is a undotree
autocmd bufenter * if (winnr("$") == 1 && exists("b:UndotreeToggle") && b:UndotreeToggle.isTabTree()) | q | endif

" Undotree toggle
nnoremap <silent> <Leader>u :UndotreeToggle<CR>
