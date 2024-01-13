-- This file is automatically loaded by plugins.core
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

vim.opt.autowrite = true -- Enable auto write

-- vim.opt.confirm = true -- Confirm to save changes before exiting modified buffer
-- seems to affect saving of fugitive diff buffers

vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.inccommand = "nosplit" -- preview incremental substitute
vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 -- Maximum number of entries in a popup
vim.opt.relativenumber = false -- Relative line numbers
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
vim.opt.shortmess:append({ W = true, I = true, c = true })
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.spelllang = { "en" }
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.winminwidth = 5 -- Minimum window width

if vim.fn.has("nvim-0.9.0") == 1 then
  vim.opt.splitkeep = "screen"
  vim.opt.shortmess:append({ C = true })
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

vim.opt.swapfile = false -- disable swapfiles because they are fucking garbage

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
vim.cmd("syntax enable") -- Turn on syntax highlighting
vim.cmd("filetype plugin indent on")
vim.opt.compatible = false -- incompatible with vi
vim.opt.swapfile = false -- do not create a swap file                                        "
vim.opt.backup = false -- no backup because we have undodir                                "
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
vim.opt.hidden = true -- Hide files in the background instead of closing them "
vim.opt.showmode = true -- Last line                                            "
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
vim.opt.signcolumn = "yes:1" -- always show the sign column, otherwise it would shift the text each time
vim.opt.completeopt = "menu,menuone,noselect" -- options for Insert mode completion
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
vim.opt.timeoutlen = 300 -- By default timeoutlen is 1000 ms
vim.opt.clipboard = "unnamedplus" -- Copy paste between vim and everything else
vim.opt.autochdir = true -- Your working directory will always be the same as your file directory
vim.opt.textwidth = 0 -- maximum width of text that is being inserted
vim.opt.wrapmargin = 0 -- chars from the right where wrapping starts

--- Normalise Backspace ---
vim.opt.backspace = { "indent", "eol", "start" } -- how backspace works at start of line
vim.cmd("set whichwrap+=<,>,[,],h,l") -- allow specified keys to cross line boundaries

vim.opt.formatoptions = "jqn"
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

--- Indentation ---
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.shiftround = true -- Round indent

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


vim.cmd([[
let g:inkscape_graphs_dir = "./assets/"
function! ink#Ink(image)
	if getcwd() !~ expand("%:p:h")
		cd %:p:h
	endif
	if !isdirectory(g:inkscape_graphs_dir)
	    call mkdir(g:inkscape_graphs_dir, "p")
	endif
	let b:inline = '![' . a:image . ']('. g:inkscape_graphs_dir . a:image . '.svg)\'
	call append(line('.'),b:inline)
	normal jo
	if filereadable(expand("~/.config/inkscape/templates/default.svg"))
		exe ":!cp ~/.config/inkscape/templates/default.svg" g:inkscape_graphs_dir . a:image . ".svg"
	elseif filereadable("/usr/share/inkscape/templates/default.svg")
		exe ":!cp /usr/share/inkscape/templates/default.svg" g:inkscape_graphs_dir . a:image . ".svg"
	else 
		finish
	endif
	exe ":!inkscape" g:inkscape_graphs_dir . a:image . ".svg"
endfunction
]])
