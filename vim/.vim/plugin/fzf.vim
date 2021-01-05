let g:fzf_command_prefix = 'Fzf'

" Centralize fzf window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }

nnoremap <silent> <C-p> :FzfFiles<CR>
nnoremap <silent> <C-g> :FzfRg<CR>
nnoremap <silent> <Leader>b :FzfBuffers<CR>
nnoremap <silent> q: :FzfHistory:<CR>
nnoremap <silent> q/ :FzfHistory/<CR>

" Path completion in insert mode (acts like C-t in terminal)
inoremap <expr> <C-t> fzf#vim#complete#path('fd --hidden --follow --exclude .git --exclude node_modules')

" Replace the default `FzfRg` command
command! -nargs=* -bang FzfRg call RipgrepFzf(<q-args>, <bang>0)

" fzf acts like a selector interface for ripgrep rather than a 'fuzzy finder'
function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --follow --column --line-number --no-heading --color=always --smart-case --hidden -g "!.git/*" -g "!node_modules/*" -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
