return {
  "bullets-vim/bullets.vim",
  lazy = false,
  config = function()
    vim.g.bullets_enabled_file_types = { "markdown", "text", "gitcommit", "scratch" }
    vim.g.bullets_custom_mappings = {
      { "imap", "<cr>", "<Plug>(bullets-newline)" },
      { "nmap", "o", "<Plug>(bullets-newline)" },

      { "vmap", "gl1", "<Plug>(bullets-renumber)" },
      { "nmap", "gl1", "<Plug>(bullets-renumber)" },
      -- { "vmap", "gN", "<Plug>(bullets-renumber)" },
      -- { "nmap", "gN", "<Plug>(bullets-renumber)" },

      { "nmap", "<C-cr>", "<Plug>(bullets-toggle-checkbox)" },
      -- { "nmap", "<leader>x", "<Plug>(bullets-toggle-checkbox)" },

      { "imap", "<C-t>", "<Plug>(bullets-demote)" },
      { "nmap", ">>", "<Plug>(bullets-demote)" },
      { "vmap", ">", "<Plug>(bullets-demote)" },
      { "imap", "<C-d>", "<Plug>(bullets-promote)" },
      { "nmap", "<<", "<Plug>(bullets-promote)" },
      { "vmap", "<", "<Plug>(bullets-promote)" },
    }
  end,
}
