-- Here is a more advanced example where we pass configuration
-- options to `gitsigns.nvim`. This is equivalent to the following Lua:
--    require('gitsigns').setup({ ... })
--
-- See `:help gitsigns` to understand what the configuration keys do
return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]h", bang = true })
          else
            gitsigns.nav_hunk("next")
          end
        end, { desc = "next [h]unk" })

        map("n", "[h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[h", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end, { desc = "prev [h]unk" })

        -- Actions
        -- visual mode
        map("v", "<leader>ggs", function()
          gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "[s]tage hunk" })
        map("v", "<leader>ggr", function()
          gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "[r]eset git hunk" })
        -- normal mode
        map("n", "<leader>ggs", gitsigns.stage_hunk, { desc = "[s]tage hunk" })
        map("n", "<leader>ggr", gitsigns.reset_hunk, { desc = "[r]eset hunk" })
        map("n", "<leader>ggS", gitsigns.stage_buffer, { desc = "[S]tage buffer" })
        map("n", "<leader>ggu", gitsigns.undo_stage_hunk, { desc = "[u]ndo stage hunk" })
        map("n", "<leader>ggR", gitsigns.reset_buffer, { desc = "[R]eset buffer" })
        map("n", "<leader>ggp", gitsigns.preview_hunk, { desc = "[p]review hunk" })
        map("n", "<leader>ggb", gitsigns.blame_line, { desc = "[b]lame line" })
        map("n", "<leader>ggB", gitsigns.toggle_current_line_blame, { desc = " toggle [B]lame line" })
        map("n", "<leader>ggd", gitsigns.diffthis, { desc = " [d]iff against index" })
        map("n", "<leader>ggD", function()
          gitsigns.diffthis("@")
        end, { desc = " [D]iff against last commit" })
        -- Toggles
        -- map("n", "<leader>tD", gitsigns.toggle_deleted, { desc = "[t]oggle git show [D]eleted" })

        map("n", "<leader>ggo", "<cmd>lua require('gitsigns').toggle_signs()<cr>", { desc = "toggle signs" })

        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Gitsigns select hunk" })
      end,
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
