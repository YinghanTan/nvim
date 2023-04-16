-- remove dots or spaces to indicate folded line
-- vim.opt.fillchars = {
--   vert = "│",
--   diff = "╱",
--   foldclose = "",
--   foldopen = "",
--   fold = " ",
--   msgsep = "─"
-- }

vim.opt.fillchars = {
  vert = "│",
  diff = "╱",
  foldclose = "",
  foldopen = "",
  fold = " ",
  eob = " ",
  foldsep: " ",
  msgsep = "─",
}
vim.opt.listchars = {
  tab = '▸ ',
  precedes = '←',
  extends = '→',
  eol = '¬',
  trail = '.'
}
vim.cmd("syntax on") -- Turn on syntax highlighting
vim.cmd("filetype plugin indent on")
vim.opt.compatible = false -- incompatible with vi
vim.opt.swapfile = false   -- do not create a swap file                                        "
vim.opt.backup = false     -- no backup because we have undodir                                "
vim.opt.writebackup = false           -- This is recommended by coc
vim.opt.incsearch = true   -- starting search before typing the parameter completes
vim.opt.ignorecase = true  -- Ignore case when searching
vim.opt.smartcase = true   -- search only include case when a case is added
vim.opt.hlsearch = true    -- highlight search results
vim.opt.showmatch = true   -- highlight matching brackets [{()}]
vim.opt.lazyredraw = false -- Don't redraw while executing macros (good performance config)
vim.opt.magic = true       -- For regular expressions turn magic on
vim.opt.errorbells = false -- No error sounds
vim.opt.belloff = "all"    -- turn off visual bell
vim.opt.ttimeoutlen = 20   -- Time in milliseconds to wait for a key code sequence to complete
vim.opt.colorcolumn = "79" -- Color column at 80 characters to keep code short
vim.cmd("highlight ColorColumn ctermbg=0 guibg=lightgrey")
vim.opt.hidden = true      -- Hide files in the background instead of closing them "
vim.opt.showmode = true    -- Last line                                            "
vim.opt.showcmd = true   -- show (partial) command somewhere
vim.opt.cursorline = true  -- highlight current line
vim.opt.number = true      -- show line numbers
vim.opt.wildmenu = true    -- visual autocomplete for command menu
vim.opt.wildmode = "longest:full,list:full"
vim.opt.ruler = true       -- show current row and column
vim.opt.encoding = "utf-8" -- encoding/format
vim.opt.history = 1000     -- increate the undo limit
vim.opt.scrolloff = 3      -- line buffer of 3 lines when scrolling
vim.opt.sidescrolloff = 5  -- min. nr. of columns to left and right of cursor
vim.opt.list = false -- show <Tab> and <EOL>
vim.opt.relativenumber = false      -- set relative numbered lines
vim.opt.numberwidth = 1    -- set number column width to 2 {default 4}
vim.opt.shortmess:append('I') -- Don't have intro message when starting vim
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.completeopt = { 'menu', 'menuone' } -- options for Insert mode completion
vim.opt.termguicolors = true
vim.opt.errorformat:append('%f:%l:%c%p%m') -- description of the lines in the error file


--- NVIM Settings ---
vim.opt.pumheight = 10         -- Makes popup menu smaller
vim.opt.fileencoding = "utf-8" -- The encoding written to file
vim.opt.cmdheight = 2          -- More space for displaying messages"
vim.opt.iskeyword:append '-'   -- treat dash separated words as a word text object
vim.opt.mouse = 'a'            -- enable your mouse
vim.opt.splitbelow = true      -- Horizontal splits will automatically be below
vim.opt.splitright = true      -- Vertical splits will automatically be to the right
vim.opt.conceallevel = 0       -- So that I can see `` in markdown files
vim.opt.background = "dark"    -- tell vim what the background color looks like
vim.opt.updatetime = 100          -- Faster completion
vim.opt.timeoutlen = 800          -- By default timeoutlen is 1000 ms
vim.opt.clipboard = "unnamedplus" -- Copy paste between vim and everything else
vim.opt.autochdir = true               -- Your working directory will always be the same as your file directory 
vim.opt.textwidth = 0 -- maximum width of text that is being inserted
vim.opt.wrapmargin = 0  -- chars from the right where wrapping starts


--- Normalise Backspace ---
vim.opt.backspace={'indent','eol','start'} -- how backspace works at start of line
vim.cmd("set whichwrap+=<,>,[,],h,l") -- allow specified keys to cross line boundaries

vim.cmd("autocmd BufNewFile,BufRead,FileType,OptionSet * set formatoptions-=cro")
vim.cmd("autocmd BufNewFile,BufRead,FileType,OptionSet * setlocal formatoptions-=cro")

--- Ignore compiled files ---
vim.opt.wildignore = { '*/cache/', '*/tmp/', '*/.git/*', '*/.hg/*', '*/.svn/*', '*/.DS_Store', }

--- Syntax ---
vim.cmd("set omnifunc=syntaxcomplete#Complete")        -- AutoCompletion Insert Mode - <C-X><C-O> Navigate - <C-N><C-P>
vim.cmd("nnoremap gV `[v`]")   -- highlight last inserted text

--- Theme ---
vim.opt.laststatus = 2 -- tells when last window has status lines
vim.cmd("highlight NonText guifg=#4a4a59")    -- Invisible character colors
vim.cmd("highlight SpecialKey guifg=#4a4a59") -- Invisible character colors


--- Resize ---
vim.cmd("nnoremap <M-j>    :resize -2<CR>")
vim.cmd("nnoremap <M-k>    :resize +2<CR>")
vim.cmd("nnoremap <M-h>    :vertical resize -2<CR>")
vim.cmd("nnoremap <M-l>    :vertical resize +2<CR>")
--- --- ---

-- --- highlight without moving ---
-- vim.cmd("nnoremap <silent> * :let @/= '\<' . expand('<cword>') . '\>' <bar> set hls <cr>")
-- vim.cmd("nnoremap <silent> g* :let @/=expand('<cword>') <bar> set hls <cr>")
-- --- --- --

--- Refresh VIMRC on Save ---
vim.cmd("au! BufWritePost $MYVIMRC source %")      -- auto source when writing to init.vim alternatively you can run :source $MYVIMRC
-- write or save file with sudo
--- --- ---

-- -- Indentation
-- vim.opt.tabstop = 2
-- vim.opt.shiftwidth = 2
-- vim.opt.softtabstop = 2
-- vim.opt.expandtab = true
-- vim.opt.wrap = false


-- Shada --
-- vim.cmd("set shada='NONE'")
-- vim.o.shada = "NONE"
