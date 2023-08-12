return not dots.editor.enabled and {}
  or {
    {
      "kylechui/nvim-surround",
      opts = true,
      event = "VeryLazy",
    },

    -- Treesitter is a new parser generator tool that we can
    -- use in Neovim to power faster and more accurate
    -- syntax highlighting.
    {
      "nvim-treesitter/nvim-treesitter",
      version = false, -- last release is way too old and doesn't work on Windows
      lazy = false,
      build = ":TSUpdate",
      event = {
        "BufReadPost",
        "BufWinEnter",
        "BufNewFile",
      },
      cmd = { "TSUpdateSync" },
      -- keys = {
      --   { "as", desc = "Increment selection", mode = "x" },
      --   { "<bs>", desc = "Decrement selection", mode = "x" },
      -- },
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
          "nvim-treesitter/playground",
        },
        {
          "nvim-treesitter/nvim-treesitter-context",
        },
      },
      opts = {
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,
        -- List of parsers to ignore installing (for "all")
        ignore_install = { "smali" },
        ensure_installed = dots.editor.treesitter.parsers,
        highlight = {
          enable = true, -- false will disable the whole extension
          disable = {}, -- list of language that will be disabled
          additional_vim_regex_highlighting = true,
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
        },
        matchup = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
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
        query_linter = {
          enable = true,
          use_virtual_text = true,
          lint_events = { "BufWrite", "CursorHold" },
        },
        autopairs = {
          enable = false,
        },
        autotag = {
          enable = true,
        },
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
      "echasnovski/mini.ai",
      opts = function()
        local ai = require("mini.ai")
        return {
          n_lines = 500,
          custom_textobjects = {
            f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
          },
        }
      end,
      dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        init = function()
          require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
        end,
      },
      event = "VeryLazy",
    },
    {
      "RRethy/vim-illuminate",
      opts = {
        delay = 200,
        large_file_cutoff = 2000,
        large_file_overrides = {
          providers = { "lsp" },
        },
      },
      config = function(_, opts)
        require("illuminate").configure(opts)

        local function map(key, dir, buffer)
          vim.keymap.set("n", key, function()
            require("illuminate")["goto_" .. dir .. "_reference"](false)
          end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
        end

        map("]]", "next")
        map("[[", "prev")

        -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
        vim.api.nvim_create_autocmd("FileType", {
          callback = function()
            local buffer = vim.api.nvim_get_current_buf()
            map("]]", "next", buffer)
            map("[[", "prev", buffer)
          end,
        })
      end,
      event = "VeryLazy",
    },
    {
      "echasnovski/mini.files",
      opts = true,
      init = function()
        if vim.fn.argc() == 1 then
          local stat = vim.loop.fs_stat(vim.fn.argv(0))
          if stat and stat.type == "directory" then
            require("mini.files")
          end
        end
      end,
      keys = {
        {
          "<leader>to",
          function()
            require("mini.files").open()
          end,
        },
      },
    },
    {
      "nvim-pack/nvim-spectre",
      cmd = "Spectre",
      opts = { open_cmd = "noswapfile vnew" },
      keys = {
        { "<leader>Sr", "<cmd>lua require('spectre').open()<CR>", desc = "Open Spectr" },
        {
          "<leader>Sw",
          "<cmd>lua require('spectre').open_visual({ select_word=true })<CR>",
          desc = "Search current word",
        },
        { "<leader>Sw", "<cmd>lua require('spectre').open_visual()<CR>", mode = "x", desc = "Search current word" },
        {
          "<leader>Sp",
          "<cmd>lua require('spectre').open_file_search({ select_word=true })CR>",
          mode = "n",
          desc = "Search on current word",
        },
      },
    },
    {
      "andymass/vim-matchup",
      dependencies = "nvim-treesitter/nvim-treesitter",
      config = function()
        vim.g.matchup_matchparen_offscreen = {} -- empty = disables
        vim.cmd("silent! do FileType")
      end,
      event = "VeryLazy",
    },
    {
      "echasnovski/mini.bracketed",
      opts = {
        yank = { suffix = "" },
        indent = { suffix = "" },
      },
      event = "VeryLazy",
    },
    {
      "kevinhwang91/nvim-ufo",
      opts = {
        provider_selector = function()
          return { "treesitter", "indent" }
        end,
      },
      dependencies = "kevinhwang91/promise-async",
      event = "VeryLazy",
    },
    {
      "mbbill/undotree",
      lazy = false,
      keys = {
        { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Toggle Undotree" },
      },
      init = function()
        table.insert(dots.editor.treesitter.parsers, "diff")
        if vim.fn.has("persistent_undo") then
          local target_path = vim.fn.expand("~/.undodir")

          -- create the directory and any parent directories
          -- if the location does not exist.
          if not vim.fn.isdirectory(target_path) then
            vim.fn.mkdir(target_path, "p", 0700)
          end

          vim.opt.undodir = target_path
          vim.opt.undofile = true
        end

        vim.g.undotree_RelativeTimestamp = 1
        vim.g.undotree_ShortIndicators = 1
        vim.g.undotree_HelpLine = 0
        vim.g.undotree_WindowLayout = 2
      end,
    },
    {
      "mg979/vim-visual-multi",
      event = "VeryLazy",
    },
    {
      "phaazon/hop.nvim",
      event = "BufRead",
      branch = "v2",
      keys = {
        { "<leader>\\f", "<cmd>HopChar2<cr>", desc = "Find" },
        { "<leader>\\w", "<cmd>HopWord<cr>", desc = "Word" },
        { "<leader>\\l", "<cmd>HopLineStart<cr>", desc = "Line" },
        { "<leader>\\f", "<cmd>HopChar2<cr>", mode = "v", desc = "Find" },
        { "<leader>\\w", "<cmd>HopWord<cr>", mode = "v", desc = "Word" },
        { "<leader>\\l", "<cmd>HopLineStart<cr>", mode = "v", desc = "Line" },
      },
      config = function()
        require("hop").setup({})
      end,
    },
    -- buffer remove
    {
      "echasnovski/mini.bufremove",
      -- stylua: ignore
      keys = {
        { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
        { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
      },
    },
  }
