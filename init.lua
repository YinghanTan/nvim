-- UI/Theme
require("user.launch")
require("user.options")
require("user.keymaps")
require("user.autocmds")
spec("user.colorscheme")
spec("user.devicons")
spec("user.colorizer")
spec("user.illuminate")
spec("user.lualine")
spec("user.alpha")
spec("user.tabby")
spec("user.neoscroll")
spec("user.dressing")
spec("user.pretty-fold")

-- coding
spec("user.mason")
spec("user.treesitter")
spec("user.schemastore")
spec("user.treesj")
spec("user.lspconfig")
spec("user.cmp")
spec("user.ultisnips")
spec("user.none-ls")
spec("user.comment")
spec("user.autopairs")
spec("user.nvim-ts-autotag")
spec("user.project")
spec("user.indentline")
spec("user.indentscope")
spec("user.nvim-surround")

spec("user.todo-comments")
spec("user.dial")
-- spec("user.copilot")
-- spec("user.lab")

-- testing
spec("user.neotest")
spec("user.vimspector")
spec("user.undotree")
spec("user.spectre")

-- navigation
spec("user.breadcrumbs")
-- spec("user.harpoon")
spec("user.navic")
spec("user.hop")
spec("user.navbuddy")
spec("user.vim-fetch")

-- file/dirs
spec("user.rnvimr")
spec("user.nvimtree")
spec("user.vinegar")
-- spec("user.oil")

-- search
spec("user.telescope")
spec("user.fzf")
spec("user.trouble")
spec("user.bqf")
spec("user.vim-togglelist")

-- keys
spec("user.unimpaired")
spec("user.unimpaired-which-key")
spec("user.whichkey")

-- vimscript
-- spec("user.vim-abolish")
spec("user.repeat")


-- window
spec("user.win-zoomwintab")

-- wiki
spec("user.wiki-vimwiki")
spec("user.wiki-img-clip")
spec("user.wiki-vimwiki-sync")
spec("user.wiki-vim-inkscape-insert")
spec("user.wiki-markdown-preview")
spec("user.wiki-vimtex")

-- git
spec("user.git-gitsigns")
spec("user.git-vim-fugitive")
spec("user.git-gitlinker")
spec("user.git-diffview")

-- terminal
spec("user.term-vim-slime")
spec("user.term-toggleterm")
spec("user.vim-matchup")

-- Extras
spec("user.eyeliner")
spec("user.fidget")
spec("user.rest")


-- bottom of file
require("user.lazy")

