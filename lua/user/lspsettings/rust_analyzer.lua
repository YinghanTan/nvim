return {
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = true;
      }
    }
  },
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  single_file_support = true
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
-- https://github.com/rust-lang/rust-analyzer
