return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {  -- by default opts table gets passed to the setup function for bufferline
    options = {
      mode = "tabs",
      seperator_style = "slant",
    },
  },
}
