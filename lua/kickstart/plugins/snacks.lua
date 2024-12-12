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
    statuscolumn = { enabled = true },
    words = {
      enabled = true,
    },
    styles = {
      notification = {
        wo = { wrap = true } -- Wrap notifications
      }
    },
    scroll = {
      animate = {
        duration = { step = 15, total = 250 },
        easing = "linear",
      },
      -- what buffers to animate
      filter = function(buf)
        return vim.g.snacks_scroll ~= false and vim.b[buf].snacks_scroll ~= false and vim.bo[buf].buftype ~= "terminal"
      end,
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
    { "<leader>S.", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>Sb", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
    { "<leader>Snh", function() Snacks.notifier.show_history() end, desc = "Notification History" },
    { "<leader>Snd", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
    -- { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
    -- { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
    { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse" },
    -- { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
    { "<leader>ggh", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
    { "<leader>ggl", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>ggL", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)"},
    -- { "<c-/>", function() Snacks.terminal() end, desc = "Toggle Terminal" },
    -- { "<c-_>", function() Snacks.terminal() end, desc = "which_key_ignore"},
    -- { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
    -- { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
    {
      "<leader>SN",
      desc = "Neovim News",
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
            conceallevel = 3,
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
        -- Snacks.toggle.zoom():map("yoz")
        -- Snacks.toggle.new():map("yoz")
      end,
    })
  end,
}
