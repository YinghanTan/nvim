return {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",
  config = function()
    require("project_nvim").setup({
      active = true,
      on_config_done = nil,
      manual_mode = false,
      detection_methods = { "pattern" },
      patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "pom.xml" },
      ignore_lsp = {},
      exclude_dirs = {},
      show_hidden = false,
      silent_chdir = true,
      scope_chdir = "global",
    })

    -- keymaps
    vim.keymap.set( "n", "<leader>sp", ":lua require('telescope').extensions.projects.projects()<CR>", { noremap = true, silent = true, desc = "[p]rojects" })
  end,
}

-- <c-p>  recent projects
-- \sp  recent projects
