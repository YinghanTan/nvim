return {
  { -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/playground",
      "nvim-treesitter/nvim-treesitter-context",
    },
    main = "nvim-treesitter.configs", -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    keys = {
      { "<leader>Ti", "<cmd>TSInstallInfo<cr>", desc = " [T]S [i]nfo" },
      { "<leader>Tp", "<cmd>TSPlaygroundToggle<cr>", desc = "󰙅 [T]S [p]layground" },
    },
    opts = {
      ignore_install = { "smali", "help" },
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "query",
        "vim",
        "vimdoc",
        "python",
        "dockerfile",
        "typescript",
        -- "javacript",
        "css",
        "json",
        "yaml",
        "tmux",
        "terraform",
      },
      auto_install = true,
      highlight = {
        enable = true,
        disable = { "help" },
        additional_vim_regex_highlighting = { "ruby" },
      },
      indent = { enable = true, disable = { "ruby" } },


      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-M-space>",
          node_incremental = "<C-M-space>",
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

      -- -- treesitter-textobjects
      -- textobjects = {
      --   select = {
      --     enable = false,
      --     lookahead = true,  -- Automatically jump forward to textobj, similar to targets.vim
      --     keymaps = {
      --       -- You can use the capture groups defined in textobjects.scm
      --       ["aa"] = "@parameter.outer",
      --       ["ia"] = "@parameter.inner",
      --       ["af"] = "@function.outer",
      --       ["if"] = "@function.inner",
      --       ["ac"] = "@class.outer",
      --       ["ic"] = "@class.inner",
      --       ["il"] = "@loop.inner",
      --       ["al"] = "@loop.outer",
      --       ["at"] = "@comment.outer",
      --       ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
      --     },
      --     selection_modes = {
      --       ["@parameter.outer"] = "v", -- charwise
      --       ["@function.outer"] = "V", -- linewise
      --       ["@class.outer"] = "<c-v>", -- blockwise
      --     },
      --     include_surrounding_whitespace = false,
      --   },
      --   move = {
      --     enable = true,
      --     set_jumps = true, -- whether to set jumps in the jumplist
      --     goto_next_start = {
      --       ["]m"] = "@function.outer",
      --       ["]k"] = "@class.outer",
      --     },
      --     goto_next_end = {
      --       ["]M"] = "@function.outer",
      --       ["]K"] = "@class.outer",
      --     },
      --     goto_previous_start = {
      --       ["[m"] = "@function.outer",
      --       ["[k"] = "@class.outer",
      --     },
      --     goto_previous_end = {
      --       ["[M"] = "@function.outer",
      --       ["[K"] = "@class.outer",
      --     },
      --   },
      -- },

      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
      },

    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
