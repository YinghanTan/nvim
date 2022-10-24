" --- Reference ---
" https://www.chrisatmachine.com/Neovim/03-vim-themes/
" https://www.chrisatmachine.com/Linux/05-nerd-fonts/

" onedark.vim override: Don't set a background color when running in a terminal;
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

hi Comment cterm=italic
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256


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
  colorscheme onedark
  " colorscheme gruvbox
endif


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

" #EA4A34
" #4B1818
hi DiffAdd gui=none guifg=none guibg=#2D4B4C
hi DiffChange gui=none guifg=none guibg=#2D435D
hi DiffText gui=none guifg=#FFFFFF guibg=#33699A
hi DiffDelete gui=none guifg=#B44A34 guibg=none " as a key to the music opposite for 
" hi diffRemoved gui=none guifg=#EA4A34 guibg=none
" Linux Vim
hi MyDiffAdd gui=bold guifg=#FFFFFF guibg=#307265
hi MyDiffChange gui=bold guifg=#FFFFFF guibg=#2F628D
hi MyDiffText gui=bold guifg=#FFFFFF guibg=#2F628D
hi MyDiffDelete gui=bold guifg=#FFFFFF guibg=#EA4A34
hi MyDiffBase gui=bold guifg=#FFFFFF guibg=#31343B

hi GitConflictCurrent gui=bold guifg=white guibg=#307265
hi GitConflictIncoming gui=bold guifg=white guibg=#2F628D
hi GitConflictAncestor gui=bold guifg=white guibg=#2D2C4C

" " Linux Vim
" hi DiffAdd gui=none guifg=none guibg=#23394C
" hi DiffChange gui=none guifg=none guibg=#2D2C4C
" hi DiffText gui=none guifg=none guibg=#414868
" hi DiffDelete gui=none guifg=#EA4A34 guibg=none " as a key to the music opposite for 
" hi diffRemoved gui=none guifg=#EA4A34 guibg=none
