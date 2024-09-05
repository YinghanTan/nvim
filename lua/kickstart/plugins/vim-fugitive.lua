return {
  "tpope/vim-fugitive",
  dependencies = { "tpope/vim-rhubarb", "shumphrey/fugitive-gitlab.vim", "tommcdo/vim-fubitive" },
  event = "VeryLazy", -- let lazy.nvim know can load later, not that important for the initial UI
  -- ft = {"fugitive"},
  config = function()
    vim.g.fugitive_summary_format = "%<(12,trunc)%an | %<(14,trunc)%cr | %s"

    local wk = require("which-key")
    wk.add({
      { "yoD", "<cmd>diffoff!<cr>", desc = "[D]iffoff all" },
    })
    wk.add({
      { "<leader>gb", "<cmd>Git blame<cr>", desc = "[b]lame" },
      { "<leader>gB", "<cmd>GBrowse<cr>", desc = "[B]rowse" },
      { "<leader>g.B", "<cmd>.GBrowse<cr>", desc = "[.]line [b]rowse" },
      { "<leader>gc", "<cmd>BCommits<cr>", desc = "[c]ommits" },
      { "<leader>gC", "<cmd>Commits<cr>", desc = "all [C]ommits" },
      { "<leader>ge", ":Gedit ", desc = "󰏫 g[e]dit" }, -- todo: show in cmd input without running :
      { "<leader>gh", "<cmd>0Gclog<cr>", desc = " file [h]istory" },
      { "<leader>gL", "<cmd>Git log<cr>", desc = "[L]og long" },
      { "<leader>gp", "<cmd>GGrep<cr>", desc = " Gre[p]" },
      { "<leader>gr", "<cmd>GDelete<cr>", desc = "[r]emove" },
      { "<leader>gd", group = " [d]iff", mode = { "n", "v" } },
      { "<leader>gdd", "<cmd>Gdiff<cr>", desc = " [d]iff" },
      { "<leader>gds", "<cmd>Gdiffsplit<cr>", desc = "[s]plit" },
      { "<leader>gdu", "<cmd>diffupdate<cr>", desc = "[u]pdate" },
      { "<leader>gdo", "<cmd>diffoff!<cr>", desc = " diff[o]ff all" },
    })
  end,
}
