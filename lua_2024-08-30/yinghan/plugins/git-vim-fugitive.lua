return {
  "tpope/vim-fugitive",
  dependencies = { "tpope/vim-rhubarb", "shumphrey/fugitive-gitlab.vim", "tommcdo/vim-fubitive" },
  event = "VeryLazy",  -- let lazy.nvim know can load later, not that important for the initial UI
  -- ft = {"fugitive"},
  config = function()
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
          ["o"] = { "<cmd>diffoff!<cr>", "diffoff all" },
        },
        e = { ":Gedit ", "gedit" }, -- todo: show in cmd input without running :
        h = { "<cmd>0Gclog<cr>", "file history" },
        L = { "<cmd>Git log<cr>", "Log long" },
        p = { "<cmd>GGrep<cr>", "Grep" },
        r = { "<cmd>GDelete<cr>", "remove" }
      }
    }
    local wk = require("which-key")
    wk.register(g_mappings, g_opts)
    wk.register({
      ["yoD"] = { "<cmd>diffoff!<cr>", "diffoff all" },
    })
  end,
}
