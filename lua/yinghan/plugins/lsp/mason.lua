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
        "ansiblels",
        "awk_ls",
        "bashls",  -- requires npm to be installed
        "cssls",  -- requires npm to be installed
        "docker_compose_language_service",
        "dockerls",
        "emmet_ls",
        "graphql",
        "html",  -- requires npm to be installed
        "jsonls",  -- requires npm to be installed
        "lua_ls",
        "marksman",
        "neocmake",
        "puppet",
        "prismals",
        "pyright",
        "ruff_lsp",
        "rust_analyzer",
        "sqlls",
        "svelte",
        "tailwindcss",
        "terraformls",
        "texlab",
        "tsserver",  -- requires npm to be installed
        "vimls",
        "vuels",
        "yamlls",  -- requires npm to be installed
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
        "luacheck",
        "ansible-lint",
        "gitlint",
        "yamllint",
        "vale",
        "hadolint",
        "djlint",
      },
    })
  end,
}
