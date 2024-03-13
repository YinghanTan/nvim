local M = {
  "nvim-treesitter/nvim-treesitter",
  version = false, -- last release is way too old and doesn't work on Windows
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      init = function()
        -- disable rtp plugin, as we only need its queries for mini.ai
        -- In case other textobject modules are enabled, we will load them
        -- once nvim-treesitter is loaded
        require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
        load_textobjects = true
      end,
    },
    {
      'nvim-treesitter/playground'
    },
    {
      "nvim-treesitter/nvim-treesitter-context"
    }
  },
  cmd = { "TSUpdateSync" },
}

function M.config()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "angular",
      "awk",
      "bash",
      "c",
      "cmake",
      "cpp",
      "css",
      "csv",
      "dart",
      "dockerfile",
      "dot",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "go",
      "godot_resource",
      "graphql",
      "groovy",
      "html",
      "htmldjango",
      "http",
      "java",
      "javascript",
      "jq",
      "jsdoc",
      "json",
      "json5",
      "jsonc",
      "lua",
      "luadoc",
      "luap",
      "make",
      "markdown",
      "markdown_inline",
      "mermaid",
      "ninja",
      "pem",
      "puppet",
      "python",
      "query",
      "r",
      "rst",
      "regex",
      "requirements",
      "ruby",
      "ron",
      "rust",
      "scss",
      "sql",
      "ssh_config",
      "terraform",
      "hcl",
      "tmux",
      "todotxt",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "vue",
      "yaml",
      "zathurarc",
      "latex",
      "bibtex"
    },
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,
    -- List of parsers to ignore installing (for "all")
    ignore_install = { 'smali', 'help' },
    highlight = {
      enable = true, -- false will disable the whole extension
      disable = { },  -- list of language that will be disabled
      additional_vim_regex_highlighting = {},
    },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },

    -- treesitter playground
    playground = {
      enable = true,
      disable = {},
      updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
        toggle_query_editor = 'o',
        toggle_hl_groups = 'i',
        toggle_injected_languages = 't',
        toggle_anonymous_nodes = 'a',
        toggle_language_display = 'I',
        focus_language = 'f',
        unfocus_language = 'F',
        update = 'R',
        goto_node = '<cr>',
        show_help = '?',
      }
    },
    query_linter = {
      enable = true,
      use_virtual_text = true,
      lint_events = { "BufWrite", "CursorHold" },
    },
  })
end

return M


-- :TSInstall all -- outside of tmux
-- :TSUpdate all
-- :TSUpdateSync all
-- :TSPlaygroundToggle
-- :TSInstallInfo
