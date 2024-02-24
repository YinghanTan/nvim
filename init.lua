-- UI/Theme
require("user.launch")
require("user.options")
require("user.keymaps")
require("user.autocmds")
spec("user.colorscheme")
spec("user.devicons")
spec("user.colorizer")
spec("user.illuminate")
spec("user.nvimtree")
spec("user.lualine")
spec("user.modicator")
spec("user.alpha")
spec("user.cellular-automaton")
spec("user.tabby")
spec("user.neoscroll")
spec("user.dressing")

-- coding
spec("user.mason")
spec("user.treesitter")
spec("user.schemastore")
spec("user.lspconfig")
spec("user.cmp")
spec("user.none-ls")
spec("user.comment")
spec("user.autopairs")
spec("user.nvim-ts-autotag")
spec("user.project")
spec("user.indentline")
spec("user.nvim-surround")
spec("user.todo-comments")
spec("user.dial")
spec("user.ufo")
spec("user.ultisnips")
-- spec("user.copilot")
-- spec("user.lab")

-- testing
spec("user.neotest")
spec("user.trouble")
spec("user.vimspector")
spec("user.undotree")
spec("user.spectre")

-- navigation
spec("user.breadcrumbs")
-- spec("user.harpoon")
spec("user.navic")
spec("user.hop")
spec("user.navbuddy")
spec("user.rnvimr")
spec("user.vim-fetch")
-- spec("user.oil")

-- search
spec("user.telescope")

-- keys
spec("user.unimpaired")
spec("user.unimpaired-which-key")
spec("user.whichkey")

-- vimscript
spec("user.vinegar")
-- spec("user.vim-abolish")
spec("user.repeat")
spec("user.bqf")
spec("user.vim-togglelist")

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


require("user.lazy")

