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
hi DiffAdd gui=none guifg=none guibg=#23394C
hi DiffChange gui=none guifg=none guibg=#2D2C4C
hi DiffText gui=none guifg=none guibg=#414868
hi DiffDelete gui=none guifg=#EA4A34 guibg=none " as a key to the music opposite for 
hi diffRemoved gui=none guifg=#EA4A34 guibg=#E06C75



" highlight NonText ctermfg=bg guifg=bg

  " vim.g.terminal_color_0  = "#15161E"
  " vim.g.terminal_color_8  = "#414868"
  " -- red
  " vim.g.terminal_color_1  = "#f7768e"
  " vim.g.terminal_color_9  = "#f7768e"
  " -- green
  " vim.g.terminal_color_2  = "#9ece6a"
  " vim.g.terminal_color_10 = "#9ece6a"
  " -- yellow
  " vim.g.terminal_color_3  = "#e0af68"
  " vim.g.terminal_color_11 = "#e0af68"
  " -- blue
  " vim.g.terminal_color_4  = "#7aa2f7"
  " vim.g.terminal_color_12 = "#7aa2f7"
  " -- magenta
  " vim.g.terminal_color_5  = "#bb9af7"
  " vim.g.terminal_color_13 = "#bb9af7"
  " -- cyan
  " vim.g.terminal_color_6  = "#7dcfff"
  " vim.g.terminal_color_14 = "#7dcfff"
  " -- white
  " vim.g.terminal_color_7  = "#a9b1d6"
  " vim.g.terminal_color_15 = "#c0caf5"




