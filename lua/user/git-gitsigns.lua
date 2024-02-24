local M = {
  "lewis6991/gitsigns.nvim",
  event = "BufEnter",
  cmd = "Gitsigns",
}

M.config = function()


  local icons = require("user.icons")
  require("gitsigns").setup({

    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns
      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      local function map_opts(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map_opts("n", "]c", function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return "<Ignore>"
      end, { expr = true, desc = "next chunk" })

      map_opts("n", "[c", function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return "<Ignore>"
      end, { expr = true, desc = "prev chunck" })

      -- Text object
      map("o", "ih", ":<C-U>Gitsigns select_hunk<CR>")
      map("x", "ih", ":<C-U>Gitsigns select_hunk<CR>")

      -- Keymaps


      local wk = require("which-key")
      wk.register({
        ["<leader>ggj"] = { "<cmd>lua require('gitsigns').next_hunk({navigation_message = false})<cr>", "Next Hunk" },
        ["<leader>ggk"] = { "<cmd>lua require('gitsigns').prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
        ["<leader>ggi"] = { "<cmd>lua require('gitsigns').preview_hunk()<cr>", "Hunk info" },
        ["<leader>ggr"] = { "<cmd>lua require('gitsigns').reset_hunk()<cr>", "Reset Hunk" },
        ["<leader>ggb"] = { "<cmd>lua require('gitsigns').blame_line()<cr>", "Blame" },
        ["<leader>ggR"] = { "<cmd>lua require('gitsigns').reset_buffer()<cr>", "Reset Buffer" },
        ["<leader>ggs"] = { "<cmd>lua require('gitsigns').stage_hunk()<cr>", "Stage Hunk" },
        ["<leader>ggo"] = { "<cmd>lua require('gitsigns').toggle_signs()<cr>", "toggle signs" },
        ["<leader>ggu"] = { "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", "Undo Stage Hunk", },
        ["<leader>ggd"] = {
          "<cmd>Gitsigns diffthis HEAD<cr>",
          "Git Diff",
        },
      })

    end,

    signs = {
      add = {
        hl = "GitSignsAdd",
        text = icons.ui.BoldLineMiddle,
        numhl = "GitSignsAddNr",
        linehl = "GitSignsAddLn",
      },
      change = {
        hl = "GitSignsChange",
        text = icons.ui.BoldLineDashedMiddle,
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn",
      },
      delete = {
        hl = "GitSignsDelete",
        text = icons.ui.TriangleShortArrowRight,
        numhl = "GitSignsDeleteNr",
        linehl = "GitSignsDeleteLn",
      },
      topdelete = {
        hl = "GitSignsDelete",
        text = icons.ui.TriangleShortArrowRight,
        numhl = "GitSignsDeleteNr",
        linehl = "GitSignsDeleteLn",
      },
      changedelete = {
        hl = "GitSignsChange",
        text = icons.ui.BoldLineMiddle,
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn",
      },
    },
    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },
    attach_to_untracked = true,
    current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
    update_debounce = 200,
    max_file_length = 40000,
    preview_config = {
      border = "rounded",
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },
  })
end

return M
