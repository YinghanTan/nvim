local M = {
  "andymass/vim-matchup",
  lazy = true,
}

function M.config()
  vim.g.matchup_matchparen_offscreen = { method = nil }
  vim.g.matchup_matchpref = { html = { nolists = 1 } }
end

return M
