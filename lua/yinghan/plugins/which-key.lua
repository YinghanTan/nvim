return {
  "folke/which-key.nvim",
  event = "VeryLazy",  -- let lazy.nvim know can load later, not that important for the initial UI
  init = function()  -- runs when during neovim startup instead of when plugin actually loads
    vim.o.timeout = true
    vim.o.timeoutlen = 500  -- how long whichkey will wait before activating
  end,
  opts = {  -- table of options that gets passed to the setup function, by using opts lazy automatically calls setup() passing the opts table as input to the setup function
    -- you configuration comes here
    -- or leave it empty to use the default settings
  },
}
