" " Automatically open when Vim starts up
" autocmd vimenter * NERDTreeFind

" " After automatically NERDTree is opened the cursor is moved to right window
" autocmd vimenter * wincmd l

" " Automatically open when Vim starts up if no files were specified
" " autocmd StdinReadPre * let s:std_in=1
" " autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" " Close Vim if the only window left open is a NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" " Show hidden files by default
" let NERDTreeShowHidden=1

" " Resize NERDTree window
" let g:NERDTreeWinSize=30

" " Don't show messages above file tree
" let NERDTreeMinimalUI=1

" " let g:NERDTreeShowBookmarks=1
" " let g:nerdtree_tabs_focus_on_files=1
" " let g:NERDTreeChDirMode=2

" " " sync open file with NERDTree
" " " Check if NERDTree is open or active
" " function! IsNERDTreeOpen()
" "   return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
" " endfunction

" " " Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" " " file, and we're not in vimdiff
" " function! SyncTree()
" "   if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
" "     NERDTreeFind
" "     wincmd p
" "   endif
" " endfunction

" " " Highlight currently open buffer in NERDTree
" " autocmd BufEnter * call SyncTree()

" " NERDTree toggle
" nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" " Find and reveal a file in the NERDTree window
" nnoremap <silent> <C-f> :NERDTreeFind<CR>
