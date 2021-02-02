" Automatically install extensions on server start
let g:coc_global_extensions = [
    \ 'coc-marketplace',
    \ 'coc-explorer',
    \ 'coc-highlight',
    \ 'coc-pairs',
    \ 'coc-tabnine',
    \ 'coc-snippets',
    \ 'coc-floaterm',
    \ 'coc-eslint',
    \ 'coc-prettier',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-tsserver',
    \ 'coc-json',
    \ 'coc-python',
    \ 'coc-sh',
    \ 'coc-vimlsp',
    \ 'coc-vimtex',
    \ 'coc-clangd'
    \ ]

" Search the symbol below the cursor accross the projects files
nnoremap <Leader>rs :CocSearch <C-r>=expand("<cword>")<CR><CR>

" ### coc-marketplace ###
nnoremap <silent><nowait> <Leader>E :<C-u>CocList marketplace<CR>

" ### coc-snippets ###
" Use <leader>x for convert visual selected code to snippet
xmap <Leader>x <Plug>(coc-convert-snippet)

" ### coc-explorer ###
nmap <silent> <C-b> :CocCommand explorer<CR>

" ### coc-prettier ###
" Command :Prettier to format current buffer
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" ### coc-floaterm ###
nnoremap <silent><nowait> <Leader>T :<C-u>CocList floaterm<CR>

" ### General Settings ###
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_Space() ? "\<TAB>" :
        \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_Space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <C-Space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <C-Space> coc#refresh()
else
    inoremap <silent><expr> <C-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <CR> could be remapped by other vim plugin
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
                            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <Leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <Leader>f <Plug>(coc-format-selected)
nmap <Leader>f <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<Leader>aap` for current paragraph
xmap <Leader>a <Plug>(coc-codeaction-selected)
nmap <Leader>a <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <Leader>ac <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <Leader>qf <Plug>(coc-fix-current)

" Remap <C-d> and <C-u> for scroll float windows/popups.
nnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<CR>" : "\<Right>"
inoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<CR>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <Leader>g :<C-u>CocList diagnostics<CR>
" Manage extensions.
nnoremap <silent><nowait> <Leader>e :<C-u>CocList extensions<CR>
"Show commands.
nnoremap <silent><nowait> <Leader>c :<C-u>CocList commands<CR>
" Find symbol of current document.
nnoremap <silent><nowait> <Leader>o :<C-u>CocList outline<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <Leader>. :<C-u>CocListResume<CR>
