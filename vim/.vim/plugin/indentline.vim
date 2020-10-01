" Specify a character to be used as indent line
let g:indentLine_char = '│'

" Better performance for indentLine
let g:indentLine_faster = 1

" Specify indent line color
let g:indentLine_color_term = 240

" Disabled in these file types
let g:indentLine_fileTypeExclude = ['text']

" Disabled in these buffer types
let g:indentLine_bufTypeExclude = ['help', 'terminal']

" Disabled in these buffer names (specified by regex)
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*', '.*CoC.*']
