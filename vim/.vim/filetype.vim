augroup filetypedetect
    autocmd BufNewFile,BufRead .sequelizerc set filetype=javascript
    autocmd BufNewFile,BufRead .babelrc set filetype=jsonc

    " Set column to match PEP8 maximum number of characters per line
    autocmd FileType javascript,python setlocal colorcolumn=80

    " Enable folding
    autocmd FileType vim setlocal foldmethod=marker
augroup END
