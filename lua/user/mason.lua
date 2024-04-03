local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
}

function M.config()
  local servers = {
    "ansiblels",
    "ansible-lint",
    "awk_ls",
    "bashls",
    "cssls",
    "codelldb",
    "docker_compose_language_service",
    "dockerls",
    "eslint",
    "html",
    "jdtls",
    "jsonls",
    "lua_ls",
    "marksman",
    "neocmake",
    "puppet",
    "pyright",
    "ruff_lsp",
    "rust_analyzer",
    "sqlls",
    "tailwindcss",
    "taplo",
    "terraformls",
    "tflint",
    "texlab",
    "tsserver",
    "vimls",
    "vuels",
    "yamlls",
    -- "gopls",
    -- "black",
    -- "debugpy",
    -- "flake8",
    -- "hadolint",
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

