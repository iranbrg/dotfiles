" Don't pass messages to 'ins-completion-menu'
set shortmess+=c

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Update signature help on jump placeholder
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" Automatically install extensions on server start
let g:coc_global_extensions = [
  \ 'coc-yank',
  \ 'coc-snippets',
  \ 'coc-highlight',
  \ 'coc-pairs',
  \ 'coc-tabnine',
  \ 'coc-git',
  \ 'coc-prettier',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-markdownlint',
  \ 'coc-python',
  \ 'coc-java',
  \ 'coc-sh',
  \ 'coc-sql',
  \ 'coc-vimlsp',
  \ 'coc-yaml',
  \ 'coc-clangd'
  \ ]

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use <C-Space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <C-Space> coc#refresh()
else
  inoremap <silent><expr> <C-@> coc#refresh()
endif

" Use <CR> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <CR> could be remapped by other vim plugin, try `:verbose imap <CR>`.
inoremap <silent><expr> <Plug>CustomCocCR pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
imap <CR> <Plug>CustomCocCR<Plug>DiscretionaryEnd

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use [g and ]g to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Search the symbol below the cursor accross the projects files
nnoremap <leader>rr :CocSearch <C-R>=expand("<cword>")<CR><CR>

" Use <C-l> for trigger snippet expand.
" imap <C-l> <Plug>(coc-snippets-expand)
 
" Use <C-j> for select text for visual placeholder of snippet.
" vmap <C-j> <Plug>(coc-snippets-select)
 
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
" let g:coc_snippet_next = '<c-j>'
 
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
" let g:coc_snippet_prev = '<c-k>'

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" navigate chunks of current buffer
nmap [h <Plug>(coc-git-prevchunk)
nmap ]h <Plug>(coc-git-nextchunk)

" Show chunk diff at current position
nmap <Leader>hp <Plug>(coc-git-chunkinfo)

" Open current line in browser (remote repository)
nmap <Leader>hb :CocCommand git.browserOpen<CR>

" Stage current chunk.
nmap <Leader>hs :CocCommand git.chunkStage<CR>

" Undo current chunk.
nmap <Leader>hu :CocCommand git.chunkUndo<CR>

" Command :Prettier to format current buffer
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Add :Format command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
