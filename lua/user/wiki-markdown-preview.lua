local M = {
  "iamcco/markdown-preview.nvim",
  keys = {
    {"yom", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Toggle Preview"},
    {"<leader>mp", "<cmd>MarkdownPreview<cr>", desc = "Markdown Preview"},
    {"<leader>ms", "<cmd>MarkdownPreviewStop<cr>", desc = "Markdown Stop Preview"},
  },
  ft = {"wiki", "markdown", "md", "pum1"},
  build = function() vim.fn["mkdp#util#install"]() end,
}

return M
