return {
  settings = {
    bashIde = {
      globPattern = "*@(.sh|.inc|.bash|.command)"
    }
  },
  cmd = { "bash-language-server", "start" },
  filetypes = { "sh" },
  single_file_support = true
}
