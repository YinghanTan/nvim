return {
  "SirVer/ultisnips",
  -- event = "InsertEnter",
  lazy = false,
  dependencies = {
    "honza/vim-snippets",
    lazy = false,
  },
  init = function()
    -- vim.g.UltiSnipsExpandTrigger = "<leader><tab>"
    vim.g.UltiSnipsExpandTrigger = "<C-y>"
    vim.g.UltiSnipsJumpForwardTrigger = "<C-j>"
    vim.g.UltiSnipsJumpBackwardTrigger = "<C-k>"
    vim.g.UltiSnipsEditSplit = "vertical"

    vim.g.snips_author = "Yinghan Tan"
    vim.g.UltiSnipsSnippetDirectories = { "UltiSnips" }
    vim.g.UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit = "~/.config/nvim/UltiSnips"

    local wk = require("which-key")
    wk.add({
      { "<leader>ue", "<cmd>UltiSnipsEdit<cr>", desc = "󰏫 [u]ltisnips [e]dit" },
    })

    vim.cmd("autocmd BufWritePost *.snippets :call UltiSnips#RefreshSnippets() | :CmpUltisnipsReloadSnippets")
    vim.cmd("autocmd FileType tex,latex UltiSnipsAddFiletypes tex.latex")
  end,
}
