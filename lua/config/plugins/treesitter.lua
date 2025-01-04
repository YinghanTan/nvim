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
        "yaml",
        "tmux",
        "terraform",
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true, -- false will disable the whole extension
        disable = {}, -- list of language that will be disabled
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { "ruby" },
      },
      indent = { enable = true, disable = { "ruby" } },
    },
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    -- incremental_selection = {
    --   enable = true,
    --   keymaps = {
    --     init_selection = "<C-M-space>",
    --     node_incremental = "<C-M-space>",
    --     scope_incremental = false,
    --     node_decremental = "<bs>",
    --   },
    -- },

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
  },
}
-- vim: ts=2 sts=2 sw=2 et
