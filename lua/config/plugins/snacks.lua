return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    indent = {
      enabled = true,
      animate = {
        enabled = false
      },
      scope = {
        enabled = false
      }
    },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    quickfile = { enabled = true },
    scratch = { enabled = true },
    scroll = { enabled = true },
    gitbrowse = { enabled = true },
    statuscolumn = {
      enabled = false,
      left = { "mark", "sign" }, -- priority of signs on the left (high to low)
      right = { "fold", "git" }, -- priority of signs on the right (high to low)
      folds = {
        open = false, -- show open fold icons
        git_hl = false, -- use Git Signs hl for fold icons
      },
      git = {
        -- patterns to match Git signs
        patterns = { "GitSign", "MiniDiffSign" },
      },
      refresh = 50, -- refresh at most every 50ms
    },
    words = { enabled = true },
    styles = {
      notification = {
        wo = { wrap = true }, -- Wrap notifications
      },
    },
    toggle = { enabled = true },
    zen = {
      enabled = true,
      zoom = {
        toggles = {},
        show = { statusline = true, tabline = true },
        win = {
          backdrop = { transparent = true, blend = 40 },
          width = 0.97,
          height = 0.98, -- full height
          border = "rounded",
        },
      },
    },
  },
  keys = {
    -- Top Pickers & Explorer
    -- git
    -- { "<leader>sgC", function() require('snacks').picker.git_log() end, desc = "Git Log" },
    -- { "<leader>sgc", function() require('snacks').picker.git_log_file() end, desc = "Git Log File" },

    { "<leader>S.", function() require('snacks').scratch() end, desc = "toggle [S]cratch buffer" },
    {"<leader>Sb", function() require('snacks').scratch.select() end, desc = "select [S]cratch [b]uffer" },
    {"<leader>nh", function() require('snacks').notifier.show_history() end, desc = "[n]otify [h]istory" },
    {"<leader>nd", function() require('snacks').notifier.hide() end, desc = "[n]otify [d]ismiss" },
    {"<leader>bd", function() require('snacks').bufdelete() end, desc = "[b]uffer delete" },
    {"<leader>gB", function() require('snacks').gitbrowse() end, desc = "[g]it [B]rowse" },
    {"<leader>ggh", function() require('snacks').lazygit.log_file() end, desc = "lazygit file [h]istory" },
    {"<leader>tg", function() require('snacks').lazygit() end, desc = "[t]ui [g]it" },
    {"<leader>ggl", function() require('snacks').lazygit() end, desc = "[l]azygit" },
    {"<leader>ggL", function() require('snacks').lazygit.log() end, desc = "lazygit [L]og (cwd)" },
    { "yoz", function() require('snacks').zen.zoom() end, desc = "[w]in [z]oom" },
    {
      "<leader>nN",
      desc = "[n]otify nvim [N]ews",
      function()
        require('snacks').win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 0,
          },
        })
      end,
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          require('snacks').debug.inspect(...)
        end
        _G.bt = function()
          require('snacks').debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        require('snacks').toggle.option("spell", { name = "toggle spell" }):map("yos")
        require('snacks').toggle.option("wrap", { name = "toggle wrap" }):map("yow")
        require('snacks').toggle.option("relativenumber", { name = "toggle relative number" }):map("yor")
        require('snacks').toggle.line_number():map("yon")
        require('snacks').toggle.diagnostics():map("yoe")
        require('snacks').toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("yoH")
        require('snacks').toggle.treesitter():map("yoT")
        require('snacks').toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("yob")
        require('snacks').toggle.inlay_hints():map("yoI")
      end,
    })
  end,
}
