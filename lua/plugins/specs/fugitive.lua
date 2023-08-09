return {
  {
    "tpope/vim-fugitive",
    dependencies = { "tpope/vim-rhubarb", "shumphrey/fugitive-gitlab.vim", "tommcdo/vim-fubitive" },
    -- cmd = { "Git" },
    lazy = false,
    init = function()
      vim.g.fugitive_summary_format = "%<(12,trunc)%an | %<(14,trunc)%cr | %s"
    end,
  },
}
