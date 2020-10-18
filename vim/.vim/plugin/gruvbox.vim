colorscheme gruvbox
set background=dark

" Changes dark mode contrast
let g:gruvbox_contrast_dark = 'hard'

" Enables italic text.
let g:gruvbox_italic = 1

" Enable truecolor and set Vim-specific sequences for RGB colors
if (has("termguicolors"))
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

if !has('gui_running')
    set t_Co=256
endif

" Comments become italic
highlight Comment cterm=italic gui=italic
