" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
    " hi CursorLineNR ctermbg=blue guibg=blue
    " hi CursorLine ctermbg=blue guibg=blue
endif

if !exists('g:syntax_on')
  syntax on
endif

if !exists('g:loaded_color')
  let g:loaded_color = 1

  set background=dark
  " Put your favorite colorscheme here
  " colorscheme onedark
  colorscheme dracula
endif


hi DiffAdd gui=none guifg=none guibg=#2D4B4C
hi DiffChange gui=none guifg=none guibg=#2D435D
hi DiffText gui=none guifg=#FFFFFF guibg=#33699A
hi DiffDelete gui=none guifg=#B44A34 guibg=none " as a key to the music opposite for 
" hi diffRemoved gui=none guifg=#EA4A34 guibg=none
" Linux Vim

" --- coc-git color configs ---
hi MyDiffAdd gui=bold guifg=#FFFFFF guibg=#307265
hi MyDiffChange gui=bold guifg=#FFFFFF guibg=#2F628D
hi MyDiffText gui=bold guifg=#FFFFFF guibg=#2F628D
hi MyDiffDelete gui=bold guifg=#FFFFFF guibg=#EA4A34
hi MyDiffBase gui=bold guifg=#FFFFFF guibg=#31343B

" --- git-conflict color configs ---
hi GitDiffAdd gui=bold guifg=#FFFFFF guibg=#307265
hi GitDiffChange gui=bold guifg=#FFFFFF guibg=#2F628D
hi GitDiffText gui=bold guifg=#FFFFFF guibg=#2F628D
hi GitDiffDelete gui=bold guifg=#FFFFFF guibg=#EA4A34
hi GitDiffBase gui=bold guifg=#FFFFFF guibg=#31343B


" " Linux Vim
" hi DiffAdd gui=none guifg=none guibg=#23394C
" hi DiffChange gui=none guifg=none guibg=#2D2C4C
" hi DiffText gui=none guifg=none guibg=#414868
" hi DiffDelete gui=none guifg=#EA4A34 guibg=none " as a key to the music opposite for 
" hi diffRemoved gui=none guifg=#EA4A34 guibg=none


" --- Diff Color Reference ---
" DiffAdd diff mode: Added line
" DiffChange diff mode: Changed line
" DiffDelete diffmode: Deleted line
" DiffText diffmode: Changed text within a changed line
" Linux Vim
" <<<<<< #307265
" #2D4B4C
" >>>>>> #2F628D
" #2D435D
" |||||| #3D4045
" #31343A

" --- remove background color from popup menu
highlight Pmenu ctermbg=none guibg=none
