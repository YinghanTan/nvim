local M = {
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
  },
}

function M.config()
  require("mason-nvim-dap").setup({
    ensure_installed = {
      "python",
      "stylua",
      "jq",
      "cppdbg",
      "node2",
      "chrome",
      "js",
      "bash",
      "mock",
      "dart",
    },
    automatic_installation = true,
  })
end

return M
