return not dots.editor.enabled and {}
  or {
    {
      "kylechui/nvim-surround",
      opts = true,
      event = "VeryLazy",
    },

    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        auto_install = true,
        ensure_installed = dots.editor.treesitter.parsers,
        highlight = {
          enable = true,
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
      },
      config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
      end,
      event = {
        "BufReadPost",
        "BufWinEnter",
        "BufNewFile",
      },
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
      opts = true,
      keys = {
        { "<leader>s", "<cmd>lua require('spectre').open()<CR>", desc = "Open Spectr" },
        {
          "<leader>sw",
          "<cmd>lua require('spectre').open_visual({ select_word=true })<CR>",
          desc = "Search current word",
        },
        { "<leader>sw", "<cmd>lua require('spectre').open_visual()<CR>", mode = "x", desc = "Search current word" },
        {
          "<leader>sp",
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

    -- git
    {
      "lewis6991/gitsigns.nvim",
      event = "VeryLazy",
      opts = {
        signs = dots.UI.icons.Git.Signs,
        on_attach = function()
          local gs = require("gitsigns")

          local map = vim.keymap.set

          -- stylua: ignore start
          map("n", "]h", gs.next_hunk, { desc = "Next Hunk" })
          map("n", "[h", gs.prev_hunk, { desc= "Prev Hunk" })
        end,
      },
    },


  }
