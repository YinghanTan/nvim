return {
  "HakonHarnes/img-clip.nvim",
  -- event = "BufEnter",
  lazy = "VeryLazy",
  opts = {
    -- add options here
    -- or leave it empty to use the default settings
    default = {
      dir_path = "assets",
    },
    vimwiki = {
      url_encode_path = true,
      template = "![$CURSOR $FILE_NAME_NO_EXT]($FILE_PATH)",
      drag_and_drop = {
        download_images = false,
      },
    },
  },
  keys = {
    -- suggested keymap
    { "<leader>pi", "<cmd>PasteImage<cr>", desc = "Paste clipboard image" },
  },
  config = true,
}
