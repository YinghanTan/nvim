-- install without yarn or npm
return {
  -- "Tweekism/markdown-preview.nvim",  -- temorary fork
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "wiki", "markdown", "md", "pum1" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  config = function()
    local wk = require("which-key")
    wk.add({
      {"yom", "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle [m]arkdown preview" },
      {"<leader>mp", "<cmd>MarkdownPreview<cr>", desc = "[m]arkdown [p]review" },
      {"<leader>ms", "<cmd>MarkdownPreviewStop<cr>", desc = "[m]arkdown [s]top preview" },
    })
  end,
}
