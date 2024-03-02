return {
  settings = {
    ansible = {
      ansible = {
        path = "ansible"
      },
      executionEnvironment = {
        enabled = false
      },
      python = {
        interpreterPath = "python"
      },
      validation = {
        enabled = true,
        lint = {
          enabled = true,
          path = "ansible-lint"
        }
      }
    }
  },
  cmd = { "ansible-language-server", "--stdio" },
  filetypes = { "yaml.ansible" },
  single_file_support = true
}
