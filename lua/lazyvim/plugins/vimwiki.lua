return {

  {
    "vimwiki/vimwiki",
    event = "Bufenter *.md",
    keys = { "<leader>ww", "<leader>wt" },
    init = function()
      --- Vim Wiki & Instant Markdown Plugin ---
      vim.g.vimwiki_listsyms = " x"
      vim.g.vimwiki_ext2syntax = {
        [".md"] = "markdown",
        [".markdown"] = "markdown",
        [".mdown"] = "markdown",
      }
      local wiki_1 = {
        path = "~/vimwiki/",
        syntax = "markdown",
        ext = ".md",
      }

      vim.g.vimwiki_list = { wiki_1 }
      vim.g.vimwiki_folding = "expr"
      vim.g.vimwiki_global_ext = 1 -- make sure vimwiki doesn't own all .md files
    end,
  },
  {
    "michal-h21/vimwiki-sync",
    config = function()
      vim.g.vimwiki_sync_branch = "master"
      vim.g.sync_taskwarrior = 0
      vim.g.vimwiki_sync_commit_message = "Auto commit + push. %c"
    end,
  },

}
