local M = {
  "tpope/vim-fugitive",
  dependencies = { "tpope/vim-rhubarb", "shumphrey/fugitive-gitlab.vim", "tommcdo/vim-fubitive", "junegunn/gv.vim" },
  lazy = false,
  ft = {"fugitive"},
}

function M.config()
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
      -- v = { "<cmd>GV!<cr>", "file commits" },
      -- V = { "<cmd>GV<cr>", "all commits" },

      v = {
        name = "view",
        F = { "<cmd>GV!<cr>", "current file commits" },
        f = { "<cmd>GV<cr>", "all commits" },
        h = { "<cmd>GV?<cr>", "current file history" },
      },
    }
  }
  local wk = require("which-key")
  wk.register(g_mappings, g_opts)
end

return M
