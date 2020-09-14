" I don't want vim-gitgutter to set up any mappings at all
let g:gitgutter_map_keys = 0

" Toggle git hunks highlighting
nnoremap <silent> <Leader>hg :GitGutterLineHighlightsToggle<CR>

" Jump between hunks
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
