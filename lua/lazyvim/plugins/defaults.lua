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
  { "afreakk/unimpaired-which-key.nvim"
    , dependencies = { "tpope/vim-unimpaired" }
    , config = function()
        local wk = require("which-key")
        local uwk = require("unimpaired-which-key")
        wk.register(uwk.normal_mode)
        wk.register(uwk.normal_and_visual_mode, { mode = { "n", "v" } })
    end
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
    lazy = true,
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = {"fugitive"},
    init = function()
      vim.g.fugitive_summary_format = "%<(12,trunc)%an | %<(14,trunc)%cr | %s"
      local g_opts = {
        mode = "n", -- NORMAL mode
        prefix = "<leader>",
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = false, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap`
        nowait = true, -- use `nowait` when creating keympas
      }
      local g_mappings = {
        ["g"] = {
          name = "+git",
          b = { "<cmd>Git blame<cr>", "blame" },
          B = { "<cmd>GBrowse<cr>", "browse" },
          [".B"] = { "<cmd>.GBrowse<cr>", "line browse" },
          c = { "<cmd>BCommits<cr>", "commits" },
          C = { "<cmd>Commits<cr>", "all commits" },
          d = {
            name = "diff",
            ["d"] = { "<cmd>Gdiff<cr>", "diff" },
            ["s"] = { "<cmd>Gdiffsplit<cr>", "split" },
            ["u"] = { "<cmd>diffupdate<cr>", "update" },
            ["O"] = { "<cmd>diffoff!<cr>", "diffoff all" },
          },
          e = { ":Gedit ", "gedit" }, -- todo: show in cmd input without running :
          G = { "<cmd>FloatermNew lazygit<CR>", "gui" },
          h = { "<cmd>0Gclog<cr>", "file history" },
          ["lo"] = { "<cmd>Commits<cr>", "all commits" },
          ["lO"] = { "<cmd>BCommits<cr>", "commits" },
          L = { "<cmd>Git log<cr>", "Log long" },
          p = { "<cmd>GGrep<cr>", "Grep" },
          r = { "<cmd>GDelete<cr>", "remove" },
          v = { "<cmd>GV!<cr>", "file commits" },
          V = { "<cmd>GV<cr>", "all commits" },
        }
      }
      local wk = require("which-key")
      wk.register(g_mappings, g_opts)
    end,
  },
  {
    "mattn/vim-gist",
    event = "BufRead",
    dependencies = "mattn/webapi-vim",
    init = function()
      local G_opts = {
        mode = "n", -- NORMAL mode
        prefix = "<leader>",
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = false, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap`
        nowait = true, -- use `nowait` when creating keympas
      }
      local G_mappings = {
        ["G"] = {
          name = "+gist",
          a = { "<cmd>Gist -b -a<cr>", "create anon" },
          d = { "<cmd>Gist -d<cr>", "delete" },
          f = { "<cmd>Gist -f<cr>", "fork" },
          g = { "<cmd>Gist -b<cr>", "create" },
          l = { "<cmd>Gist -l<cr>", "list" },
          p = { "<cmd>Gist -b -p<cr>", "create private" },
        }
      }
      local wk = require("which-key")
      wk.register(G_mappings, G_opts)
    end,
  }
}
