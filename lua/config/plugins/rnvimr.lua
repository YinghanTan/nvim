return {
  "kevinhwang91/rnvimr",
  cmd = "RnvimrToggle",
  keys = {
    { "<M-i>", "<C-\\><C-n>:RnvimrResize 1,8,9,11,5<CR>", mode = { "t" }, desc = "resize default" },
    { "<M-l>", "<C-\\><C-n>:RnvimrResize<CR>", mode = { "t" }, desc = "resize special" },
    { "<leader>tr", ":RnvimrToggle<CR>", mode = { "n" }, desc = " [t]erm [r]anger" },
    { "<leader>tr", "<C-\\><C-n>:RnvimrToggle<CR>", mode = { "t" }, desc = " [t]erm [r]anger" },
  },
  config = function()
    vim.g.NERDTreeHijackNetrw = 0 -- add this line if you use NERDTree
    vim.g.ranger_map_keys = 0 -- let g:NERDTreeHijackNetrw = 0
    -- Make Ranger replace Netrw and be the file explorer
    vim.g.rnvimr_enable_ex = 0
    -- Make Ranger to be hidden after picking a file
    vim.g.rnvimr_enable_picker = 1
    vim.g.rnvimr_draw_border = 1
    vim.g.rnvimr_pick_enable = 1
    vim.g.rnvimr_bw_enable = 1
    -- Make Neovim wipe the buffers corresponding to the files deleted by Ranger
    vim.g.rnvimr_enable_bw = 1
    -- Add a shadow window, value is equal to 100 will disable shadow
    vim.g.rnvimr_shadow_winblend = 70
    -- Change the border's color
    vim.g.rnvimr_border_attr = { fg = 14, bg = -1 }
    -- Map Rnvimr action
    vim.g.rnvimr_action = {
      ["<C-t>"] = "NvimEdit tabedit",
      ["<C-x>"] = "NvimEdit split",
      ["<C-v>"] = "NvimEdit vsplit",
      gw = "JumpNvimCwd",
      yw = "EmitRangerCwd",
    }

    -- Link CursorLine into RnvimrNormal highlight in the Floating window
    vim.cmd([[ highlight link RnvimrNormal CursorLine ]])
  end,
}
