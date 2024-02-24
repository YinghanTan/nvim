local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
}

function M.config()
  local servers = {
    "lua_ls",
    "cssls",
    "html",
    "puppet",
    "tsserver",
    "pyright",
    "black",
    "debugpy",
    "flake8",
    "ruff_lsp",
    "bashls",
    "jsonls",
    "sqlls",
    "ansiblels",
    "marksman",
    "vimls",
    "yamlls",
    "terraformls",
    "texlab",
    "tailwindcss",
    "rust_analyzer",
    "taplo",
    "jdtls",
    "dockerls",
    "docker_compose_language_service",
    "neocmake",
    "eslint"
  }

  require("mason").setup {
    ui = {
      border = "rounded",
    },
  }

  require("mason-lspconfig").setup {
    ensure_installed = servers,
  }
end

return M

