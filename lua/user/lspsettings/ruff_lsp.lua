return {
  init_options = {
    settings = {
      -- Any extra CLI arguments for `ruff` go here.
      args = {},
    }
  },
  settings = {},
  cmd = { "ruff-lsp" },
  filetypes = { "python" },
  single_file_support = true
}

