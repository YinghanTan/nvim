-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
-- For more options, you can see `:help option-list`

-- Mke line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
-- Experiment for yourself to see if you like it!
vim.opt.relativenumber = false

-- Enable mouse mode, can be useful for resizing splits for example
vim.opt.mouse = "a"

-- Don't show the mode since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim
-- Schedule the setting after `UiEnter` because it can increase startup-time
-- Remove this option if you want your OS clipboard to remain independent.
-- See `:help 'clipboard'`
-- vim.schedule(function()
--   vim.opt.clipboard = "unnamedplus"
-- end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more captial letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
-- See `:help 'list'`
-- and `:help 'listchars'`
vim.opt.list = false
vim.opt.listchars = {
  tab = "▸ ",
  precedes = "←",
  extends = "→",
  eol = "¬",
  trail = "·",
  nbsp = "␣",
}

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- files and file navigation
vim.opt.backup = false -- don't use backup files
vim.opt.writebackup = false -- don't backup the file while editing
vim.opt.swapfile = false -- don't create swap files for new buffers
vim.opt.updatecount = 0 -- don't write swap files after some number of updates
-- vim.opt.autochdir = true -- Your working directory will always be the same as your file directory
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }

-- undo
vim.opt.undofile = true -- enable persistent undo
vim.opt.undolevels = 10000
vim.opt.history = 1000 -- store the last 1000 commands entered

--- Normalise Backspace ---
vim.opt.backspace = { "indent", "eol", "start" } -- how backspace works at start of line, allow backspace on indent, end of line or insert mode start position
vim.cmd("set whichwrap+=<,>,[,],h,l") -- allow specified keys to cross line boundaries
-- vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register
vim.opt.mouse = "a" -- allow the mouse to be used in neovim

-- searching
vim.opt.ignorecase = true -- case insensitive searching
vim.opt.smartcase = true -- case-sensitive if expresson contains a capital letter
vim.opt.hlsearch = true -- highlight search results
vim.opt.incsearch = true -- set incremental search, like modern browsers
vim.opt.lazyredraw = false -- Don't redraw while executing macros (good performance config)
vim.opt.magic = true -- For regular expressions turn magic on
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
-- vim.opt.inccommand = "nosplit" -- preview incremental substitute

-- error bells
vim.opt.errorbells = false -- No error sounds
vim.opt.visualbell = true -- Visual error cues
vim.opt.errorformat:append("%f:%l:%c%p%m") -- description of the lines in the error file
vim.opt.timeoutlen = 400 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.ttimeoutlen = 20 -- Time in milliseconds to wait for a key code sequence to complete

-- appearance
vim.opt.background = "dark" -- set colorscheme theme to dark
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = false -- set relative numbered lines
vim.opt.numberwidth = 1 -- set number column width to 2 {default 4}
-- vim.opt.wrapmargin = 8 -- wrap lines when coming within n characters from side
-- vim.opt.linebreak = true -- set soft wrapping
vim.opt.showbreak = "↪"
-- vim.opt.autoindent = true -- automatically set indent of new line
vim.opt.ttyfast = true -- faster redrawing
vim.opt.mat = 2 -- how many tenths of a second to blink
vim.opt.updatetime = 300 -- faster completion (4000ms default)
vim.opt.hidden = true -- Hide files in the background instead of closing them "
vim.opt.scrolloff = 3 -- line buffer of 3 lines when scrolling
vim.opt.sidescrolloff = 5 -- min. nr. of columns to left and right of cursor
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications

-- popup
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.pumblend = 10 -- popup transparency

-- bottom/side/top bars
vim.opt.showtabline = 1 -- always show tabs
vim.opt.ruler = true -- show current row and column
-- vim.opt.laststatus = 3 -- global status line all the time
vim.opt.wildmenu = true -- autocomplete for command line
vim.opt.showcmd = true -- show incomplete commands
vim.opt.showmode = true -- don't show vim mode
vim.opt.wildmode = "longest:full,list:full"
vim.opt.cmdheight = 2 -- more space in the neovim command line for displaying messages
vim.opt.title = false -- set terminal title
vim.opt.showmatch = true -- highlight matching brackets [{()}]
vim.opt.signcolumn = "yes:1" -- always show the sign column so text doesn't shift
vim.opt.shortmess:append({ W = true, I = true, c = true })

-- window
vim.opt.winminwidth = 5 -- Minimum window width
vim.opt.splitkeep = "screen"
vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the bottom

--- Indentation ---
vim.opt.smarttab = true -- tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
vim.opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
vim.opt.shiftwidth = 2 -- 2 spaces for indent width
vim.opt.softtabstop = 2
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.shiftround = true -- Round indent
vim.opt.smartindent = true -- make indenting smarter again, disabled as it interferes with treesitter indent
vim.opt.autoindent = true -- copy indent from current line when starting new one
vim.opt.wrap = false -- turn off line wrapping

-- code folding
vim.cmd([[set foldmethod=expr]]) -- use treesitter folding support
vim.cmd([[set foldexpr=nvim_treesitter#foldexpr()]])
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 10 -- deepest fold is 10 levels
vim.opt.foldenable = false -- don't fold by default
vim.opt.foldlevel = 1

-- manage invisible characters
vim.opt.fillchars = {
  vert = "│",
  diff = "╱",
  foldclose = "",
  foldopen = "",
  -- fold = "•",
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
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.autoread = true
vim.opt.cursorline = true -- highlight the current line
vim.opt.autowrite = true
vim.opt.encoding = "utf-8" -- encoding/format
vim.opt.fileencoding = "utf-8" -- The encoding written to file
vim.opt.list = false -- show <Tab> and <EOL>
vim.opt.diffopt = "vertical,filler,context:3,foldcolumn:0,indent-heuristic,algorithm:patience,internal"
vim.opt.matchpairs = "(:),{:},[:],<:>"
vim.opt.spell = false
vim.cmd("highlight NonText guifg=#4a4a59") -- Invisible character colors
vim.cmd("highlight SpecialKey guifg=#4a4a59") -- Invisible character colors

--- Syntax ---
vim.opt.textwidth = 0 -- maximum width of text that is being inserted
vim.opt.wrapmargin = 0 -- chars from the right where wrapping starts
vim.cmd("set omnifunc=syntaxcomplete#Complete") -- AutoCompletion Insert Mode - <C-X><C-O> Navigate - <C-N><C-P>
-- Fix markdown indentation settings
-- vim.g.markdown_recommended_style = 0
vim.opt.spelllang = { "en" }
vim.opt.formatoptions = "jqn" -- formatting and text wrapping behaviour
vim.cmd("autocmd BufNewFile,BufRead,FileType,OptionSet * set formatoptions-=cro")
vim.cmd("autocmd BufNewFile,BufRead,FileType,OptionSet * setlocal formatoptions-=cro")
vim.opt.wildignore = { "*/cache/", "*/tmp/", "*/.git/*", "*/.hg/*", "*/.svn/*", "*/.DS_Store" } -- Ignore compiled files
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- mostly just for cmp
vim.opt.colorcolumn = "79" -- Color column at 80 characters to keep code short
vim.cmd("highlight ColorColumn ctermbg=0 guibg=lightgrey")
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.opt.iskeyword:append("-") -- treat dash separated words as a word text object

-- vim: ts=2 sts=2 sw=2 et

-- vim.g.python3_host_prog = '/home/yinghan/.pyenv/versions/3.10.12/bin/python3'
local python_path = '/home/yinghan/.pyenv/versions/3.10.12/bin/python3'

-- Check if the file exists
if vim.loop.fs_stat(python_path) then
  vim.g.python3_host_prog = python_path
else
  print("Python3 executable not found at " .. python_path)
end

-- diagnostics
vim.diagnostic.config({
  signs = {
    severity = {
      min = vim.diagnostic.severity.WARN,
    },
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = "󰌵 ",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
    },
  },
  virtual_text = {
    prefix = "",
    severity = {
      min = vim.diagnostic.severity.WARN, -- Only show WARN and ERROR
    },
  },
  float = {
    severity = {
      min = vim.diagnostic.severity.WARN,
    },
  },
})

-- vim.diagnostic.config {
--   virtual_text = {
--     prefix = function(diagnostic)
--       if diagnostic.severity == vim.diagnostic.severity.ERROR then
--         return signs['Error']
--       elseif diagnostic.severity == vim.diagnostic.severity.WARN then
--         return signs['Warning']
--       elseif diagnostic.severity == vim.diagnostic.severity.INFO then
--         return signs['Hint']
--       else
--         return signs['Info']
--       end
--     end,
--   },
-- }
