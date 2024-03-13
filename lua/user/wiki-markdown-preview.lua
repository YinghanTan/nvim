local M = {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  -- keys = {
  --   {"yom", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Toggle Preview"},
  --   {"<leader>mp", "<cmd>MarkdownPreview<cr>", desc = "Markdown Preview"},
  --   {"<leader>ms", "<cmd>MarkdownPreviewStop<cr>", desc = "Markdown Stop Preview"},
  -- },
  ft = {"wiki", "markdown", "md", "pum1"},
  build = function() vim.fn["mkdp#util#install"]() end,
}

function M.config()
  local wk = require("which-key")
  wk.register({
    ["yom"] = { "<cmd>MarkdownPreviewToggle<cr>", "markdown preview" },
    ["<leader>mp"] = {"<cmd>MarkdownPreview<cr>", "Markdown Preview"},
    ["<leader>ms"] = {"<cmd>MarkdownPreviewStop<cr>", "Markdown Stop Preview"},
  })
end

return M
