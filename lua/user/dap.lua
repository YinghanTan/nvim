local M = {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "jay-babu/mason-nvim-dap.nvim"
  },
}

function M.setup()
  local wk = require("which-key")
  wk.register({
    ["<leader>db"] = { ":DapToggleBreakpoint<CR>", "toggle breakpoint" },
    ["<leader>dc"] = { ":DapContinue<CR>", "continue" },
    ["<leader>do"] = { ':lua require("dapui").open()<CR>', "open ui" },
  })
vim.api.nvim_set_keymap("n", "<leader>db", ":DapToggleBreakpoint<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>dc", ":DapContinue<CR>", {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>do', ':lua require("dapui").open()<CR>', { noremap = true, silent = true })
end

return M
