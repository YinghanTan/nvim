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
    "dockerls",
    "docker_compose_language_service",
    "neocmake",
    "eslint",
    "taplo",
    "jdtls",
    "awk_ls",
    "vuels",

    -- "gopls",
    -- "black",
    -- "debugpy",
    -- "flake8",
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

