local load_textobjects = false
return {
  -- Treesitter is a new parser generator tool that we can
  -- use in Neovim to power faster and more accurate
  -- syntax highlighting.
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    lazy = false,
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
    },
    cmd = { "TSUpdateSync" },
    keys = {
      { "af", desc = "Increment selection", mode = "x" },
      { "<bs>", desc = "Decrement selection", mode = "x" },
    },
    ---@type TSConfig
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "html",
        "javascript",
        "json",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
        "help",
        "go",
        "rust",
        "css",
      },
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,
      -- List of parsers to ignore installing (for "all")
      ignore_install = { 'smali' },
      highlight = {
        enable = true, -- false will disable the whole extension
        disable = {},  -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
      },
      indent = { enable = true },

      -- rainbow = {
      --   enable = true,
      --   colors = {
      --     "Gold",
      --     "Orchid",
      --     "DodgerBlue"
      --     -- "Cornsilk",
      --     -- "Salmon",
      --     -- "Lawngreen",
      --   },
      --   disable = { "html" },
      -- },
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
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn", -- set to `false` to disable one of the mappings
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },

      -- -- treesitter-textobjects configs
      -- -- disabled rtp plugin, as we only need its queries for mini.ai
      -- textobjects = {
      --   select = {
      --     enable = true,
      --     lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      --     keymaps = {
      --       -- You can use the capture groups defined in textobjects.scm
      --       ['aa'] = '@parameter.outer',
      --       ['ia'] = '@parameter.inner',
      --       ['af'] = '@function.outer',
      --       ['if'] = '@function.inner',
      --       ['ac'] = '@class.outer',
      --       ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
      --       ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
      --     },
      --   },
      --   move = {
      --     enable = true,
      --     set_jumps = true, -- whether to set jumps in the jumplist
      --     goto_next_start = {
      --       [']m'] = '@function.outer',
      --       [']]'] = '@class.outer',
      --     },
      --     goto_next_end = {
      --       [']M'] = '@function.outer',
      --       [']['] = '@class.outer',
      --     },
      --     goto_previous_start = {
      --       ['[m'] = '@function.outer',
      --       ['[['] = '@class.outer',
      --     },
      --     goto_previous_end = {
      --       ['[M'] = '@function.outer',
      --       ['[]'] = '@class.outer',
      --     },
      --   },
      --   swap = {
      --     enable = true,
      --     swap_next = {
      --       ["<leader>a"] = "@parameter.inner",
      --     },
      --     swap_previous = {
      --       ["<leader>A"] = "@parameter.inner",
      --     },
      --   },
      -- },
      autopairs = {
        enable = false,
      },
      autotag = {
        enable = true,
      }
    },

    ---@param opts TSConfig
    config = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        ---@type table<string, boolean>
        local added = {}
        opts.ensure_installed = vim.tbl_filter(function(lang)
          if added[lang] then
            return false
          end
          added[lang] = true
          return true
        end, opts.ensure_installed)
      end
      require("nvim-treesitter.configs").setup(opts)

      if load_textobjects then
        -- PERF: no need to load the plugin, if we only need its queries for mini.ai
        if opts.textobjects then
          for _, mod in ipairs({ "move", "select", "swap", "lsp_interop" }) do
            if opts.textobjects[mod] and opts.textobjects[mod].enable then
              local Loader = require("lazy.core.loader")
              Loader.disabled_rtp_plugins["nvim-treesitter-textobjects"] = nil
              local plugin = require("lazy.core.config").plugins["nvim-treesitter-textobjects"]
              require("lazy.core.loader").source_runtime(plugin.dir, "plugin")
              break
            end
          end
        end
      end
    end,
  },
  {

    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require'treesitter-context'.setup{
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
        trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20, -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          -- For all filetypes
          -- Note that setting an entry here replaces all other patterns for this entry.
          -- By setting the 'default' entry below, you can control which nodes you want to
          -- appear in the context window.
          default = {
            "function",
            "method",
            "for",
            "while",
            "if",
            "switch",
            "case",
          },

          rust = {
            "loop_expression",
            "impl_item",
          },

          typescript = {
            "class_declaration",
            "abstract_class_declaration",
            "else_clause",
          },

        },
      }
    end,
  },
  {
    'nvim-treesitter/playground'
  },
}


-- :TSUninstall all
-- :TSInstall all -- outside of tmux
-- :TSUpdate all
-- :TSUpdateSync all
