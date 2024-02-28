return {
  settings = {
    css = {
      validate = true
    },
    less = {
      validate = true
    },
    scss = {
      validate = true
    }
  },
  cmd = { "vscode-css-language-server", "--stdio" },
  init_options = {
    provideFormatter = true
  },
  filetypes = { "css", "scss", "less" },
  single_file_support = true
}
