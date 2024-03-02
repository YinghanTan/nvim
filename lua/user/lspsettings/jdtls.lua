return {
  init_options = {
    jvm_args = {},
    workspace = "/home/user/.cache/jdtls/workspace"
  },
  cmd = { "jdtls", "-configuration", "/home/user/.cache/jdtls/config", "-data", "/home/user/.cache/jdtls/workspace" },
  filetypes = { "java" },
  root_dirs = {
    -- Single-module projects
    {
      'build.xml', -- Ant
      'pom.xml', -- Maven
      'settings.gradle', -- Gradle
      'settings.gradle.kts', -- Gradle
    },
    -- Multi-module projects
    { 'build.gradle', 'build.gradle.kts' },
  } or vim.fn.getcwd(),
  single_file_support = true
}
