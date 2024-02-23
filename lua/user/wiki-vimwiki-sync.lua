local M = {
  "michal-h21/vimwiki-sync",
  event = "Bufenter *.md",
  -- lazy = false, -- make sure we load this during startup
}

function M.config()
  vim.g.vimwiki_sync_branch = "master"
  vim.g.sync_taskwarrior = 0
  vim.g.vimwiki_sync_commit_message = "Auto commit + push. %c"
end

return M

