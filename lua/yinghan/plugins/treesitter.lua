return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" }, -- when open an already existing file or when a new file is opened
  build = ":TSUpdate", -- execute whenever this plugin is installed or updated, so that whenever this plugin is installed or update allt he language parsers that we're going to be using with it also gets updated
  dependencies = {
    "windwp/nvim-ts-autotag", -- autoclose functionality for tags
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/playground",
    "nvim-treesitter/nvim-treesitter-context",
  },
  cmd = { "TSUpdateSync" },
  config = function()

    -- configure treesitter
    require("nvim-treesitter.configs").setup({
      sync_install = false, -- synchronous parser install
      auto_install = true, -- auto install missing parser for buffer
      ignore_install = { "smali", "help" },
      highlight = {
        enable = true, -- false will disable the whole extension
        disable = {}, -- list of language that will be disabled
        additional_vim_regex_highlighting = {},
      },
      indent = { enable = true }, -- enable indentation

      ensure_installed = {
        "angular",
        "awk",
        "bash",
        "bibtex"
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
        "hcl",
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
        "latex",
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
        "regex",
        "requirements",
        "ron",
        "rst",
        "ruby",
        "rust",
        "scss",
        "sql",
        "ssh_config",
        "terraform",
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
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },

      -- treesitter playground
      playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = "o",
          toggle_hl_groups = "i",
          toggle_injected_languages = "t",
          toggle_anonymous_nodes = "a",
          toggle_language_display = "I",
          focus_language = "f",
          unfocus_language = "F",
          update = "R",
          goto_node = "<cr>",
          show_help = "?",
        },
      },

      -- treesitter-textobjects
      textobjects = {
        select = {
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            -- ['ii'] = '@conditional.inner',
            -- ['ai'] = '@conditional.outer',
            ["il"] = "@loop.inner",
            ["al"] = "@loop.outer",
            ["at"] = "@comment.outer",
            ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
          },
          selection_modes = {
            ["@parameter.outer"] = "v", -- charwise
            ["@function.outer"] = "V", -- linewise
            ["@class.outer"] = "<c-v>", -- blockwise
          },
          include_surrounding_whitespace = true,
        },

        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]k"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]K"] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[k"] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[K"] = "@class.outer",
          },
        },
      },

      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
      },
    })

    require('nvim-ts-autotag').setup({
      opts = {
        -- Defaults
        enable_close = true, -- Auto close tags
        enable_rename = true, -- Auto rename pairs of tags
        enable_close_on_slash = false -- Auto close on trailing </
      },
      -- Also override individual filetype configs, these take priority.
      -- Empty by default, useful if one of the "opts" global settings
      -- doesn't work well in a specific filetype
      per_filetype = {
        ["html"] = {
          enable_close = false
        }
      }
    })

    vim.cmd([[set foldmethod=expr]]) -- use treesitter folding support
    vim.cmd([[set foldexpr=nvim_treesitter#foldexpr()]])

    -- set keymaps
    vim.keymap.set("n", "<leader>Ti", "<cmd>TSInstallInfo<cr>", { desc = "TS info" }) -- restore workspace
    vim.keymap.set("n", "<leader>Tp", "<cmd>TSPlaygroundToggle<cr>", { desc = "TS playground" }) -- restore workspace
  end,
}

-- :TSInstall all -- outside of tmux
-- :TSUpdate all
-- :TSUpdateSync all
-- :TSPlaygroundToggle
-- :TSInstallInfo
