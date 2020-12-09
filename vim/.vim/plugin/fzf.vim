let g:fzf_command_prefix = 'Fzf'

" Centralize fzf window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }

nnoremap <silent> <C-p> :FzfFiles<CR>
nnoremap <silent> <C-g> :FzfRg<CR>
nnoremap <silent> <Leader>b :FzfBuffers<CR>
nnoremap <silent> q: :FzfHistory:<CR>
nnoremap <silent> <C-?> :FzfHistory/<CR>
" nnoremap <silent> <Leader>fc :Commits<CR>

imap <C-x><C-f> <plug>(fzf-complete-path)

" Search the symbol below the cursor accross the projects files
nnoremap <C-f> :FzfRg <C-r>=expand("<cword>")<CR><CR>

command! -nargs=* -bang FzfRg call RipgrepFzf(<q-args>, <bang>0)

function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --follow --column --line-number --no-heading --color=always --smart-case --hidden -g "!.git/*" -g "!node_modules/*" -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
