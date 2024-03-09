local M = {
  "jinh0/eyeliner.nvim",
  event = "VeryLazy",
}


function M.config()

  vim.api.nvim_set_hl(0, 'EyelinerPrimary', { fg='#98971a', bold = true, underline = true })
  vim.api.nvim_set_hl(0, 'EyelinerSecondary', { fg='#fb4934', bold = true, underline = true })
  vim.api.nvim_set_hl(0, 'EyelinerDimmed', { fg='#000000', bold = true, underline = true })

  vim.api.nvim_create_autocmd('ColorScheme', {
    pattern = '*',
    callback = function()
      vim.api.nvim_set_hl(0, 'EyelinerPrimary', { fg='#98971a', bold = true, underline = true })
      vim.api.nvim_set_hl(0, 'EyelinerSecondary', { fg='#fb4934', bold = true, underline = true })
      vim.api.nvim_set_hl(0, 'EyelinerDimmed', { fg='#000000', bold = true, underline = true })
    end,
  })

  require("eyeliner").setup {
    highlight_on_key = true,
    dim = true
  }
end

return M
