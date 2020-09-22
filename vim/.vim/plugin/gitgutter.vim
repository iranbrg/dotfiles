" Configure whether GitGutter preserves or clobbers other signs
let g:gitgutter_sign_allow_clobber = 0

" To use floating/popup windows for hunk previews
let g:gitgutter_preview_win_floating = 1

" I don't want vim-gitgutter to set up any mappings at all
let g:gitgutter_map_keys = 0

" Toggle git hunks highlighting
nnoremap <silent> <Leader>hg :GitGutterLineHighlightsToggle<CR>

" Jump between hunks
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" Preview the hunk
nmap <Leader>hp <Plug>(GitGutterPreviewHunk)
