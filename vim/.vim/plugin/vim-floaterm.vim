let g:floaterm_width  = 0.9
let g:floaterm_height = 0.9

" Close window if the job exits normally, otherwise stay it with messages like
" [Process exited 101]
let g:floaterm_autoclose = 1

" Opening strategy for COMMIT_EDITMSG window by running git commit in the
" floaterm window
if has('nvim')
    let g:floaterm_gitcommit = "vsplit"
endif

" Keymaps
let g:floaterm_keymap_new    = "<C-t>t"
let g:floaterm_keymap_next   = "<C-t>n"
let g:floaterm_keymap_prev   = "<C-t>p"
let g:floaterm_keymap_toggle = "<C-t>o"

nnoremap <silent> <C-t>g :FloatermNew lazygit<CR>
