local M = {
  "SirVer/ultisnips",
  -- event = "InsertEnter",
  lazy = false,
  dependencies = { "honza/vim-snippets" }
}

function M.init()

  local wk = require("which-key")
  wk.register {
    ["<leader>ue"] = {  "<cmd>UltiSnipsEdit<cr>", "ultisnips edit" },
  }

  vim.cmd("autocmd BufWritePost *.snippets :call UltiSnips#RefreshSnippets() | :CmpUltisnipsReloadSnippets")
  vim.cmd("autocmd FileType tex,latex UltiSnipsAddFiletypes tex.latex")

  vim.g.UltiSnipsExpandTrigger = "<leader><tab>"
  vim.g.UltiSnipsJumpForwardTrigger = "<C-j>"
  vim.g.UltiSnipsJumpBackwardTrigger = "<C-k>"
  vim.g.UltiSnipsEditSplit = "vertical"

  vim.g.snips_author = "Yinghan Tan"
  vim.g.UltiSnipsSnippetDirectories = {"UltiSnips"}
  vim.g.UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit = "~/.config/nvim/UltiSnips"

end

return M
