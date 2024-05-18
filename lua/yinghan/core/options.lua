
-- files and file navigtation
vim.opt.backup = false  -- don't use backup files
vim.opt.writebackup = false  -- don't backup the file while editing
vim.opt.swapfile = false  -- don't create swap files for new buffers
vim.opt.updatecount = 0  -- don't write swap files after some number of updates
vim.g.netrw_banner = 0  -- remove top banner in netrw, you can toggle banner with I
vim.g.netrw_mouse = 2  -- enables mouse buttons while browsing


-- tabs & indentation
vim.opt.tabstop = 2  -- 2 spaces for tabs (prettier default)
vim.opt.shiftwidth = 2  -- 2 spaces for indent width
vim.opt.expandtab = true  -- expand tab to spaces
vim.opt.autoindent = true  -- copy indent from current line when starting new one
vim.opt.wrap = false

-- search settings
vim.opt.ignorecase = true  -- ignore case when searching
vim.opt.smartcase = true  -- if you include mixed case in your search, assumes you want case-sensitive

-- cusor
vim.opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
vim.opt.termguicolors = true
vim.opt.background = "dark"  -- colorschemes that can be light or dark will be made dark

-- sidebar options
vim.opt.signcolumn = "yes"  -- show sign column so that text doesn't shift
vim.opt.relativenumber = false
vim.opt.number = true

-- backspace
vim.opt.backspace = "indent,eol,start"  -- allow backspace on indent, end of line or insert mode start position

-- clipboard
vim.opt.clipboard:append("unnamedplus")  -- use system clipboard as default register

-- split windows
vim.opt.splitright = true  -- split vertical window to the right
vim.opt.splitbelow = true  -- split horizontal window to the bottom
