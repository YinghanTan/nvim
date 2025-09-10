return {
  "bullets-vim/bullets.vim",
  lazy = false,
  config = function()
    vim.g.bullets_enabled_file_types = { "markdown", "text", "gitcommit", "scratch" }

    vim.g.bullets_set_mappings = 0
    vim.g.bullets_checkbox_markers = ' x'
    vim.g.bullets_outline_levels = {}

    vim.g.bullets_custom_mappings = {
      { "i", "<cr>", "<Plug>(bullets-newline)" },
      { "n", "o", "<Plug>(bullets-newline)" },
      { "n", "O", "<Plug>(bullets-newline)" },

      { "v", "gN", "<Plug>(bullets-renumber)" },
      { "n", "<leader>l1", "<Plug>(bullets-renumber)" },

      { "n", "<C-space>", "<Plug>(bullets-toggle-checkbox)" },
      -- { "nmap", "<leader>x", "<Plug>(bullets-toggle-checkbox)" },

      { "i", "<C-t>", "<Plug>(bullets-demote)" },
      { "n", ">>", "<Plug>(bullets-demote)" },
      { "v", ">", "<Plug>(bullets-demote)" },
      { "i", "<C-d>", "<Plug>(bullets-promote)" },
      { "n", "<<", "<Plug>(bullets-promote)" },
      { "v", "<", "<Plug>(bullets-promote)" },
    }
  end,
}
