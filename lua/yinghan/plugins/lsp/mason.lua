return {
  -- mason install language servers for lsp
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()



    -- enable mason and configure icons
    require("mason").setup({
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-lspconfig").setup({
      -- list of servers for mason to install
      ensure_installed = {
        "tsserver",  -- requires npm to be installed
        "html",  -- requires npm to be installed
        "cssls",  -- requires npm to be installed
        "tailwindcss",
        "svelte",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "prismals",
        "pyright",
        "yamlls",  -- requires npm to be installed
        "jsonls",  -- requires npm to be installed
        "vimls",
        "texlab",
        "terraformls",
        "sqlls",
        "rust_analyzer",
        "ruff_lsp",
        "marksman",
        "neocmake",
        "dockerls",
        "docker_compose_language_service",
        "ansiblels",
        "awk_ls",
        "bashls",  -- requires npm to be installed
      },
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "prettier",
        "stylua",
        "isort",
        "black",
        "pylint",
        "eslint_d",
        "tflint",
      },
    })
  end,
}
