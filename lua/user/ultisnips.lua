local M = {
  "SirVer/ultisnips",
  lazy = false,
  keys = {
    { "\\ue",  "<cmd>UltiSnipsEdit<cr>", desc = "ultisnips edit" },
  },
  dependencies = { "honza/vim-snippets" }
}

function M.config()
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
