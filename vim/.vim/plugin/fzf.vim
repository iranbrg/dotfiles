" Centralize fzf window
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

" Set top to bottom layout
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'

if executable('rg')
    let g:rg_derive_root='true'
endif

" if executable('rg')
"   let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
"   set grepprg=rg\ --vimgrep
"   command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
" endif

nnoremap <silent> <Leader>ff :Files<CR>
nnoremap <silent> <Leader>fh :History:<CR>
nnoremap <silent> <Leader>fs :History/<CR>
nnoremap <silent> <Leader>fb :Buffers<CR>
nnoremap <silent> <Leader>fc :Commits<CR>
nnoremap <silent> <Leader>fr :Rg<CR>
nnoremap <silent> <Leader>fg :GFiles<CR>
