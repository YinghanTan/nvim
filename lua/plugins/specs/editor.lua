return not dots.editor.enabled and {}
  or {
    {
      "chrisgrieser/nvim-various-textobjs",
      opts = {},
      event = "VeryLazy",
      keys = {
        {
          mode = { "x", "o" },
          "iw",
          "<cmd>lua require('various-textobjs').subword(true)<cr>",
          { desc = "inner subword" },
        },
        {
          mode = { "x", "o" },
          "aw",
          "<cmd>lua require('various-textobjs').subword(false)<cr>",
          { desc = "outer subword" },
        },
        {
          mode = { "x", "o" },
          "iW",
          "<cmd>lua require('various-textobjs').subword(true)<cr>",
          { desc = "inner subword" },
        },
        {
          mode = { "x", "o" },
          "aW",
          "<cmd>lua require('various-textobjs').subword(false)<cr>",
          { desc = "outer subword" },
        },
        {
          "gG",
          "<cmd>lua require('various-textobjs').entireBuffer()<CR>",
          mode = { "x", "o" },
        },
      },
    },
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
    -- {
    --   "gbprod/yanky.nvim",
    --   dependencies = { { "kkharji/sqlite.lua", enabled = not jit.os:find("Windows") } },
    --   opts = function()
    --     return {
    --       highlight = { timer = 200 },
    --       ring = { storage = jit.os:find("Windows") and "shada" or "sqlite" },
    --     }
    --   end,
    --   keys = {
    --     -- stylua: ignore
    --     { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
    --     { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor" },
    --     { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before cursor" },
    --     { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after selection" },
    --     { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before selection" },
    --     { "[y", "<Plug>(YankyCycleForward)", desc = "Cycle forward through yank history" },
    --     { "]y", "<Plug>(YankyCycleBackward)", desc = "Cycle backward through yank history" },
    --     { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
    --     { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
    --     { "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
    --     { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
    --     { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put and indent right" },
    --     { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put and indent left" },
    --     { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put before and indent right" },
    --     { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put before and indent left" },
    --     { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put after applying a filter" },
    --     { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put before applying a filter" },
    --   },
    -- },
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
      event = { "BufReadPost", "BufNewFile" },
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
        { "<leader>S", "<cmd>lua require('spectre').open()<CR>", desc = "Open Spectr" },
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
        vim.g.matchup_matchparen_offscreen = { method = nil } -- empty = disables
        vim.g.matchup_matchpref = { html = { nolists = 1 } }
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

          vim.o.undodir = target_path
          vim.o.undofile = true
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
  }
