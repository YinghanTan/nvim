return {
  {
    "tpope/vim-vinegar",
    lazy = false,
  },
  {
    "tpope/vim-repeat",
    lazy = false,
  },
  {
    "tpope/vim-abolish",
    lazy = false,
    key = {
      { "<leader>cr", "<plug>(abolish-coerce)", mode = "v", desc = "coerce" },
    },
  },
  {
    "wsdjeg/vim-fetch",
    lazy = false,
  },
  {
    "ahmedkhalf/project.nvim",
    lazy = false,
  },
  {
    "tpope/vim-unimpaired",
    lazy = false,
  },
  {
    "milkypostman/vim-togglelist",
    lazy = false,
  },

  {
    "iamcco/markdown-preview.nvim",
    lazy = false,
  },
  {
    "Bryley/neoai.nvim",
    lazy = false,
  },
  {
    "junegunn/fzf",
    lazy = false,
  },
  {
    "junegunn/fzf.vim",
    lazy = false,
  },
  {
    "jremmen/vim-ripgrep",
    lazy = false,
  },
  {
    "troydm/zoomwintab.vim",
    lazy = true,
    keys = {
      { "<C-w>z", "<cmd>ZoomWinTabToggle<cr>", desc = "zoom" },
    },
    config = function()
      vim.g.zoomwintab_hidetabbar = 0
      vim.g.zoomwintab_remap = 0
    end,
  },
  {
    "nelstrom/vim-visual-star-search",
    lazy = true,
  },
  {
    "andymass/vim-matchup",
    lazy = true,
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = nil }
      vim.g.matchup_matchpref = { html = { nolists = 1 } }
    end,
  },
  {
    "jpalardy/vim-slime",
    lazy = false,
    config = function()
      vim.g.slime_target = "tmux"
      vim.g.slime_paste_file = vim.fn.expand("$HOME/.slime_paste") -- file socket
      vim.g.slime_bracketed_paste = 0 -- can be set to 1 to prevent autocompletion from repl
      vim.g.slime_no_mappings = 0 -- 1 if you don't want the default key mappings
      vim.g.slime_default_config = { socket_name = "default", target_pane = "{right-of}" }
      vim.b.slime_bracketed_paste = 0
      vim.g.slime_dont_ask_default = 1 -- If you want vim-slime to bypass the prompt and use the specified default configuration options
      -- vim.g.slime_python_ipython = 1

      -- vim.api.nvim_set_keymap("x", "<C-s><C-s>", "<Plug>SlimeRegionSend", {})
      -- xmap <c-c><c-c> <Plug>SlimeRegionSend
      -- nmap <c-c><c-c> <Plug>SlimeParagraphSend
      -- nmap <c-c>v     <Plug>SlimeConfig
      -- {right-of}

      -- Commands --
      -- :SlimeConfig
    end,
  },
  {
    "tpope/vim-fugitive",
    dependencies = { "tpope/vim-rhubarb", "shumphrey/fugitive-gitlab.vim", "tommcdo/vim-fubitive" },
    lazy = false,
    init = function()
      vim.g.fugitive_summary_format = "%<(12,trunc)%an | %<(14,trunc)%cr | %s"
    end,
  },
}