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
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    quickfile = { enabled = true },
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
    words = {
      enabled = true,
    },
    styles = {
      notification = {
        wo = { wrap = true } -- Wrap notifications
      }
    },
    toggle = {
      -- your toggle configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      map = vim.keymap.set, -- keymap.set function to use
      which_key = true, -- integrate with which-key to show enabled/disabled icons and colors
      notify = true, -- show a notification when toggling
      -- icons for enabled/disabled states
      icon = {
        enabled = " ",
        disabled = " ",
      },
      -- colors for enabled/disabled states
      color = {
        enabled = "green",
        disabled = "yellow",
      },
    }
  },
  keys = {
    { "<leader>S.", function() Snacks.scratch() end, desc = "toggle [S]cratch buffer" },
    { "<leader>Sb", function() Snacks.scratch.select() end, desc = "select [S]cratch [b]uffer" },
    { "<leader>nh", function() Snacks.notifier.show_history() end, desc = "[n]otify [h]istory" },
    { "<leader>nd", function() Snacks.notifier.hide() end, desc = "[n]otify [d]ismiss" },
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "[b]uffer delete" },
    { "<leader>gB", function() Snacks.gitbrowse() end, desc = "[g]it [B]rowse" },
    { "<leader>ggh", function() Snacks.lazygit.log_file() end, desc = "lazygit file [h]istory" },
    { "<leader>tg", function() Snacks.lazygit() end, desc = "[t]ui [g]it" },
    { "<leader>ggl", function() Snacks.lazygit() end, desc = "[l]azygit" },
    { "<leader>ggL", function() Snacks.lazygit.log() end, desc = "lazygit [L]og (cwd)"},
    {
      "<leader>nN",
      desc = "[n]otify nvim [N]ews",
      function()
        Snacks.win({
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
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option("spell", { name = "toggle spell" }):map("yos")
        Snacks.toggle.option("wrap", { name = "toggle wrap" }):map("yow")
        Snacks.toggle.option("relativenumber", { name = "toggle relative number" }):map("yor")
        Snacks.toggle.line_number():map("yon")
        Snacks.toggle.diagnostics():map("yoe")
        Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("yoH")
        Snacks.toggle.treesitter():map("yoT")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("yob")
        Snacks.toggle.inlay_hints():map("yoI")
      end,
    })
  end,
}
