local M = {
  "jay-babu/mason-nvim-dap.nvim",
  cmd = { "DapInstall", "DapUninstall" },
  dependencies = {
    "williamboman/mason.nvim"
  },
}

function M.config()
  require("mason-nvim-dap").setup({
    automatic_installation = true,
    handlers = {},
    ensure_installed = {
      "python",
      "stylua",
      "jq",
      "node2",
      "chrome",
      "js",
      "bash",
      "dart",
    },
  })
end

return M
