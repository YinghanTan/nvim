-- lua/settings/options.lua
--
-- This is where I set my Neovim options.
--
-- This is over-documented so, you can use "}" to go foward a blankline and "}" to go backward to rapidly navigate through!
--
-- For now, this is how my configuration is structured.
--
-- LEGEND:
--
-- * 0 - Declaring variables
-- * 1 - Declaring general options.
-- * 2 - Declaring Editor options.
-- * 3 - Declaring UI options.
--
-- This is what each does:
-- *  0 - Set locals for easy use in the buffer.
-- *  1 - Set some general options that doesn't really belong to any category.
-- *  2 - Set some editor options for editing text fast!
--
-- For fast navigation, I've set codes before each category.
-- Here's the list:
-- *  0 - R9i
-- *  1 - Ayz
-- *  2 - iy0
-- *  3 - hFy
--
-- You can now go to each category by: "/ [CODE_GOES_HERE]"
-- To go back to the legend, you can press "gg". This will go to the first line in a buffer.
--
-- NOTE: None of these codes mean anything. I've generated them randomly via Random.org's random string generator.

-- CODE: R9i
--  ╭──────────────────────────────────────────────────────────╮
--  │ 0. Declaring variables                                   │
--  ╰──────────────────────────────────────────────────────────╯

-- Set local "o" to vim.opt.
--
-- vim.opt is basically a wrapper that sets options.
--
-- SYNTAX:
-- vim.opt.[option_name] = value

local o = vim.opt

-- Set local "g" to vim.g.
--
-- vim.g is basically a wrapper that sets globals.
--
-- Globals can be accessed anywhere once set.
--
-- SYNTAX:
-- vim.g.[global_name] = value

local g = vim.g

-- CODE: Ayz
--  ╭──────────────────────────────────────────────────────────╮
--  │ 1. General                                               │
--  ╰──────────────────────────────────────────────────────────╯

-- // 1.1 Leader.
-- Set <leader> to be <Space>.
g.mapleader = " "

-- Set <Localleader> to be "," (comma)
g.maplocalleader = ","

-- Map <Subleader> to be ";" (semicolon)
g.mapsubleader = ";"

-- CODE: iy0
--  ╭──────────────────────────────────────────────────────────╮
--  │ 2. Editor                                                │
--  ╰──────────────────────────────────────────────────────────╯

-- // 2.1 Indentation options.

-- Enable Autoindent.
--
-- If you're entering into a new line via <CR> in normal mode or `o` `O` in normal mode,
-- It'll automatically indent the newline.
-- For example:
--
-- {
--   |
-- }
--
-- <CR>
--
-- {
--
--   |
-- }
--
-- It does automatically indent but, except for when you don't type anything into the newline except for <BS> or <C-D>
-- and type <Esc>, <C-O> or <CR>, the indent is deleted once again.
--
-- Should be enabled by default. But, we're going to enable it anyways.
--

o.autoindent = true

-- Enable Smartindent.
-- Do smart auto-indenting when starting a new line.
-- Works for C-like programs, but can be used for most languages.
-- Similar to `cindent` but, less strict.
-- Not the most useful option for non-C-like languages.
--
-- Smartindent is usually enabled when Autoindent is enabled.
--
-- For example:
--
-- if something then
--   |
-- end
--
-- <ESC>
--
-- if something then
-- █
-- end
--
-- And:
-- if something then
--   |
-- end
--
-- <CR>
--
-- if something then
--
--   |
-- end
--
-- Here's a list of rules that are defined for Smartindent.
--
-- Insert an indent after a line ending with "{"
-- Insert an indent starting with a keyword from:
-- "if", "else", "while", "do", "for", "switch"
-- Insert and indent before a line from starting with "}" (Only with the "O" operator).
-- When typing '}' as the first character in a new line, that line is given the same indent as the matching "{".
-- When typing '#' as the first character in a new line, the indent for that line is removed, the '#' is put in the first column.
--
-- For example:
--
-- {
--
-- }█
--
-- O
--
-- {
--   |
-- }
--
--

o.smartindent = true

-- Set Shiftwidth to 2.
--
-- Shiftwidth sets the number of spaces of each (auto)indent.
-- Used for "cindent" >> and <<.
-- Other than the three listed above, "autoindent", "smartindent" also uses the value of shiftwidth.
--
-- When zero, the "tabstop" will be used.
--
-- SOME PERSONAL FACTORS:
-- Why I've used 2 is a matter of personal preferences.
-- But, here are some reasons on why:
--   * Spaces (which we'll be using) are more flexible than tabs and, more "global" than tabs.
--   * Two is the perfect balance of readability and screen real estate.
--   * Most people uses 2 spaces.
--
-- So, in summary, they're simply a matter of personal preferences.
--
-- FACT: "sw" abbreviates "shift width"

o.shiftwidth = 2

-- Set Tabstop to 2.
--
-- If "shiftwidth" is two, it's only logical to also set <Tab>s to two.
--
-- I'll go for a very brief explanation on what Tabstop does.
-- It's basically saying to Neovim to use two spaces for each <Tab> inserted.
-- So, it's mainly for consistency.
--

o.tabstop = 2

-- Enable Expandtab.
--
-- In Insert Mode: Use the appropriate number of spaces to insert a <Tab>.
-- Spaces will also be used in indents too!
--
-- TIP: To insert a real tab when, "expandtab" is turned on, use <C-v><Tab>!
--

o.expandtab = true

-- Jumplist options for <C-i> and <C-o> jump motions.
-- The following option allows you to modify how jumplist works in Neovim.

-- o.jop = "stack": When set to "stack", the jumplist behaves like a web browser.
-- The relative location of entries in the jumplist is preserved, but subsequent entries
-- are discarded when navigating backwards in the jumplist and then jumping to a location.

o.jumpoptions = "stack"

-- Enable mouse movement tracking in Neovim.
-- This option allows plugins to track mouse movements in Neovim.
-- o.mousemev = true: When set to true, mouse movements can be tracked in Neovim.

o.mousemoveevent = true

-- Enable breakindent.
-- This option allows you to visually indent every wrapped line.
-- o.bri = true: When set to true, every wrapped line will continue to be visually indented.

o.breakindent = true

-- Enable linebreak.
-- This option allows you to wrap long lines at a word instead of the final character.
-- o.lbr = true: When set to true, long lines will be wrapped at a word instead of the final character.

o.linebreak = true

-- Fold-related options.
-- The following options allow you to modify how folds are displayed in Neovim.

-- o.foldcolumn = "1": Set the fold column to be at the "later" column of line numbers.
-- o.foldlevel = 99: Set the fold level to be 99.
-- o.foldlevelstart = 99: Set the starting fold level to be 99.
-- o.foldenable = true: Enable folding.
--

o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true
-- HACK: Weird diagnostics with vim.opt 🤔
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- Undofile
--
-- Automatically save undo history to an undo file when writing a buffer to a file, and when reading a file, restores undo history from the same file on buffer read.
-- The directory used is set by 'undodir'.

vim.schedule(function()
  o.undofile = true

  -- Set "unnamedplus" as the clipboard register.
  --
  -- Use the "+" clipboard register for all clipboard stuff.
  -- That includes: yank, delete, change and put.

  o.clipboard = "unnamedplus"
end)

-- Virtual edit
--
-- We'll be setting virtual edit to be "block".
-- What it does in question is that it'll make us able to select more than EOL in virtual block mode
--
-- EXAMPLE:
--
-- Normal mode:
-- AAAAA█A -> $l -> AAAAAA█
--
-- You see, it's not going over EOL.
--
-- But, in visual block mode. (<C-v>)
--
-- it can go oer EOL
--
-- like:
--
-- ████ -> ra aaaa
-- ████       aaaa
-- Wow, there's a funny square

o.virtualedit = "block"

-- Searching

-- Ignore case
--
-- Ignore case in search patterns.
-- Kinda useful if you want to search but without the cAsE sEsEtIvEnEsS
-- This can be overruled via "\c" and "\C" - lower case and uppercase respectively.
o.ignorecase = true

-- Smart case
--
-- Do NOT ignore case in search patterns if an uppercase letter is in it.
o.smartcase = true

-- Timeout length
-- Set the timeout length to be a little shorter
o.timeoutlen = 500

-- Folds
o.foldmethod = "expr"

-- CODE: hFy
--
--  ╭──────────────────────────────────────────────────────────╮
--  │ 3. UI                                                    │
--  ╰──────────────────────────────────────────────────────────╯

-- // 3.1 Line numbers.

-- Enable numbers.
--
-- Print the corresponding line number before each line.
-- I don't really have any more context for this so, I'll end it right here.
--
-- EXAMPLE:
--  1  -- init.lua
--  2
--  3  -- Blanklines and comments are counted!
--  4  print("wow, this is so cool!")
--  5
--

o.number = true

-- Enable relative numbers
--
-- Print the corresponding relative numbers before each line.
--
-- EXAMPLE:
--  4 -- init.lua
--  3
--  2 -- Blanklines and comments are counted too!
--   4 print("wow, this is so cool!")
--  1

o.relativenumber = true

-- Enable cursorline.
--
-- Highlight the current line.
--
-- EXAMPLE:
--
-- (With relativenumbers)
--
-- 4 -- init.lua
-- 3
-- 2 -- Blanklines and comments are counted too!
--  4 print("wow, this is so cool!") <- This is highlighted
-- 1

o.cursorline = true

-- Set sign column to be 4.
-- So, if I have a new diff, It'll not feel weird, by the signcolumn expanding

o.signcolumn = "yes:1"

-- Enable TermGUIColors.
--
-- Enables 24-bit RGB colors in the TUI. Uses "gui" :highlight attributes instead of "cterm" attributes. BUT, requires an ISO-8613-3 compatible terminal. (most terminals)

o.termguicolors = true

-- Making pum menu a bit limited in the terms of screen real estate.
-- Basically it only shows 10 items into a popup menu.
-- Otherwise, it can be shown via scrolling.

o.pumheight = 10

-- Making the pum menu a bit transparent so it looks fancy :)
-- I really really like it :D

o.pumblend = 20

-- Command line options.

-- Cmdheight to zero.
--
-- Making noice.nvim not feel so late.
--
-- Otherwise, cmdheight is a cool option.
-- It basically prevents those wierd "Press ENTER or type command to continue" prompts.
--

o.cmdheight = 0

-- "Fix" emojis.
--
-- https://www.youtube.com/watch?v=F91VWOelFNE explains basically everything.
--
-- For a small TL;DR: Emojis are weird in width and might cause issues when editing and even displaying in TMUX.

o.emoji = false

-- Enable global status.
--
-- Set laststatus to 3
--
-- Here are some options:
-- - 0: Never show the statusline
-- - 1: Only show if there's two+ windows
-- - 2: Show always but, for all windows
-- - 3: show always but ONLY for the last window
--
-- I personally think that the 3rd looks the prettiest
--
-- If there are two windows, it'll always and ONLY show the one window last accessed.

o.laststatus = 3

-- Set scrolloff to be at the max.
--
-- It essentially specifies how many lines of lines should be kept above and below the cursor.
-- Setting it to 999 - the largest you can set, makes it so that the cursor is always kept in the middle.
-- Of course, this isn't true if there aren't enough lines above and below.
--
--

o.scrolloff = 16

-- Old

vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.autowrite = true -- Enable auto write
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 3 -- Hide * markup for bold and italic
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 0
opt.list = true -- Show some invisible characters (tabs...
opt.mouse = "a" -- Enable mouse mode
opt.number = true -- Print line number
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = false -- Relative line numbers
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true })
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en" }
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap

if vim.fn.has("nvim-0.9.0") == 1 then
  opt.splitkeep = "screen"
  opt.shortmess:append({ C = true })
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

vim.o.swapfile = false -- disable swapfiles because they are fucking garbage

-- remove dots or spaces to indicate folded line
vim.opt.fillchars = {
  vert = "│",
  diff = "╱",
  foldclose = "",
  foldopen = "",
  fold = " ",
  eob = " ",
  msgsep = "─",
}
vim.opt.listchars = {
  tab = "▸ ",
  precedes = "←",
  extends = "→",
  eol = "¬",
  trail = ".",
}
vim.cmd("syntax on") -- Turn on syntax highlighting
vim.cmd("filetype plugin indent on")
vim.opt.compatible = false -- incompatible with vi
vim.opt.swapfile = false -- do not create a swap file
vim.opt.backup = false -- no backup because we have undodir"
vim.opt.writebackup = false -- This is recommended by coc
vim.opt.incsearch = true -- starting search before typing the parameter completes
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true -- search only include case when a case is added
vim.opt.hlsearch = true -- highlight search results
vim.opt.showmatch = true -- highlight matching brackets [{()}]
vim.opt.lazyredraw = false -- Don't redraw while executing macros (good performance config)
vim.opt.magic = true -- For regular expressions turn magic on
vim.opt.errorbells = false -- No error sounds
vim.opt.belloff = "all" -- turn off visual bell
vim.opt.ttimeoutlen = 20 -- Time in milliseconds to wait for a key code sequence to complete
vim.opt.colorcolumn = "79" -- Color column at 80 characters to keep code short
vim.cmd("highlight ColorColumn ctermbg=0 guibg=lightgrey")
vim.opt.hidden = true -- Hide files in the background instead of closing them
vim.opt.showmode = true -- Last line
vim.opt.showcmd = true -- show (partial) command somewhere
vim.opt.cursorline = true -- highlight current line
vim.opt.number = true -- show line numbers
vim.opt.wildmenu = true -- visual autocomplete for command menu
vim.opt.wildmode = "longest:full,list:full"
vim.opt.ruler = true -- show current row and column
vim.opt.encoding = "utf-8" -- encoding/format
vim.opt.history = 1000 -- increate the undo limit
vim.opt.scrolloff = 3 -- line buffer of 3 lines when scrolling
vim.opt.sidescrolloff = 5 -- min. nr. of columns to left and right of cursor
vim.opt.list = false -- show <Tab> and <EOL>
vim.opt.relativenumber = false -- set relative numbered lines
vim.opt.numberwidth = 1 -- set number column width to 2 {default 4}
vim.opt.shortmess:append("I") -- Don't have intro message when starting vim
vim.opt.signcolumn = "yes:1" -- always show the sign column, otherwise it would shift the text each time
vim.opt.completeopt = { "menu", "menuone" } -- options for Insert mode completion
vim.opt.termguicolors = true
vim.opt.errorformat:append("%f:%l:%c%p%m") -- description of the lines in the error file
-- vertical splits when in diff, filler lines for left right symmetry between diffs, 3 context lines for each chunk, 1 column gutter for git diff
vim.opt.diffopt = "vertical,filler,context:3,foldcolumn:1,indent-heuristic,algorithm:patience,internal"
vim.opt.shada = "" -- disable shada
vim.opt.matchpairs = "(:),{:},[:],<:>"
vim.opt.spell = false

--- NVIM Settings ---
vim.opt.pumheight = 10 -- Makes popup menu smaller
vim.opt.fileencoding = "utf-8" -- The encoding written to file
vim.opt.cmdheight = 2 -- More space for displaying messages"
vim.opt.iskeyword:append("-") -- treat dash separated words as a word text object
vim.opt.mouse = "a" -- enable your mouse
vim.opt.splitbelow = true -- Horizontal splits will automatically be below
vim.opt.splitright = true -- Vertical splits will automatically be to the right
vim.opt.conceallevel = 0 -- So that I can see `` in markdown files
vim.opt.background = "dark" -- choose between "dark" or "light"
vim.opt.updatetime = 100 -- Faster completion
vim.opt.timeoutlen = 800 -- By default timeoutlen is 1000 ms
vim.opt.clipboard = "unnamedplus" -- Copy paste between vim and everything else
vim.opt.autochdir = true -- Your working directory will always be the same as your file directory
vim.opt.textwidth = 0 -- maximum width of text that is being inserted
vim.opt.wrapmargin = 0 -- chars from the right where wrapping starts

--- Normalise Backspace ---
vim.opt.backspace = { "indent", "eol", "start" } -- how backspace works at start of line
vim.cmd("set whichwrap+=<,>,[,],h,l") -- allow specified keys to cross line boundaries

vim.cmd("autocmd BufNewFile,BufRead,FileType,OptionSet * set formatoptions-=cro")
vim.cmd("autocmd BufNewFile,BufRead,FileType,OptionSet * setlocal formatoptions-=cro")

--- Ignore compiled files ---
vim.opt.wildignore = { "*/cache/", "*/tmp/", "*/.git/*", "*/.hg/*", "*/.svn/*", "*/.DS_Store" }

--- Syntax ---
vim.cmd("set omnifunc=syntaxcomplete#Complete") -- AutoCompletion Insert Mode - <C-X><C-O> Navigate - <C-N><C-P>
vim.cmd("nnoremap gV `[v`]") -- highlight last inserted text

--- Theme ---
vim.opt.laststatus = 2 -- tells when last window has status lines
vim.cmd("highlight NonText guifg=#4a4a59") -- Invisible character colors
vim.cmd("highlight SpecialKey guifg=#4a4a59") -- Invisible character colors

-- --- Indentation ---
-- vim.opt.tabstop = 2
-- vim.opt.shiftwidth = 2
-- vim.opt.softtabstop = 2
-- vim.opt.expandtab = true
-- vim.opt.wrap = false

-- return to last edit location when opening a buffer
-- vim.cmd([[ au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]])
vim.api.nvim_create_autocmd(
  "BufReadPost",
  { command = [[ if line("'\"") > 1 && line ("'\"") <= line("$") | execute "normal! g'\"" | endif ]] }
)

vim.cmd([[

" Add all TODO items to the quickfix list relative to where you opened Vim.
function! s:todo() abort
  let entries = []
  for cmd in ['git grep -niIw -e TODO -e FIXME 2> /dev/null',
            \ 'grep -rniIw -e TODO -e FIXME . 2> /dev/null']
    let lines = split(system(cmd), '\n')
    if v:shell_error != 0 | continue | endif
    for line in lines
      let [fname, lno, text] = matchlist(line, '^\([^:]*\):\([^:]*\):\(.*\)')[1:3]
      call add(entries, { 'filename': fname, 'lnum': lno, 'text': text })
    endfor
    break
  endfor
  if !empty(entries)
    call setqflist(entries)
    copen
  endif
endfunction
command! Todo call s:todo()

function! TabCloseRight(bang)
    let cur=tabpagenr()
    while cur < tabpagenr('$')
        exe 'tabclose' . a:bang . ' ' . (cur + 1)
    endwhile
endfunction

function! TabCloseLeft(bang)
    while tabpagenr() > 1
        exe 'tabclose' . a:bang . ' 1'
    endwhile
endfunction

command! -bang Tabcr call TabCloseRight('<bang>')
command! -bang Tabcl call TabCloseLeft('<bang>')

" -- Toggle paste mode on and off
function! TogglePaste()
    if(&paste == 0)
        set paste
        echo "Paste Mode Enabled"
    else
        set nopaste
        echo "Paste Mode Disabled"
    endif
endfunction
" nnoremap yop :call TogglePaste()<cr>


" Folding


nnoremap <silent> zj :call NextClosedFold('j')<cr>
nnoremap <silent> zk :call NextClosedFold('k')<cr>

function! NextClosedFold(dir)
    let cmd = 'norm!z'..a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction

function! RepeatCmd(cmd) range abort
    let n = v:count < 1 ? 1 : v:count
    while n > 0
        exe a:cmd
        let n -= 1
    endwhile
endfunction

nnoremap <silent> zj :<c-u>call RepeatCmd('call NextClosedFold("j")')<cr>
nnoremap <silent> zk :<c-u>call RepeatCmd('call NextClosedFold("k")')<cr>
]])

-- vim.cmd([[
--
--
-- " --- Diff Colors ---
--
-- hi DiffAdd gui=none guifg=none guibg=#2D4B4C
-- hi DiffChange gui=none guifg=none guibg=#2D435D
-- hi DiffText gui=none guifg=#FFFFFF guibg=#33699A
-- hi DiffDelete gui=none guifg=#B44A34 guibg=none " as a key to the music opposite for
-- " hi diffRemoved gui=none guifg=#EA4A34 guibg=none
-- " Linux Vim
--
-- " --- coc-git color configs ---
-- hi MyDiffAdd gui=bold guifg=#FFFFFF guibg=#307265
-- hi MyDiffChange gui=bold guifg=#FFFFFF guibg=#2F628D
-- hi MyDiffText gui=bold guifg=#FFFFFF guibg=#2F628D
-- hi MyDiffDelete gui=bold guifg=#FFFFFF guibg=#EA4A34
-- hi MyDiffBase gui=bold guifg=#FFFFFF guibg=#31343B
--
-- " --- git-conflict color configs ---
-- hi GitDiffAdd gui=bold guifg=#FFFFFF guibg=#307265
-- hi GitDiffChange gui=bold guifg=#FFFFFF guibg=#2F628D
-- hi GitDiffText gui=bold guifg=#FFFFFF guibg=#2F628D
-- hi GitDiffDelete gui=bold guifg=#FFFFFF guibg=#EA4A34
-- hi GitDiffBase gui=bold guifg=#FFFFFF guibg=#31343B
--
--
--
--
-- " --- Diff Color Reference ---
-- " DiffAdd diff mode: Added line
-- " DiffChange diff mode: Changed line
-- " DiffDelete diffmode: Deleted line
-- " DiffText diffmode: Changed text within a changed line
-- " Linux Vim
-- " <<<<<< #307265
-- " #2D4B4C
-- " >>>>>> #2F628D
-- " #2D435D
-- " |||||| #3D4045
-- " #31343A
--
-- ]])
