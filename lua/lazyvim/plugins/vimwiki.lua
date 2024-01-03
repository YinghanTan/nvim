return {

  {
    "vimwiki/vimwiki",
    event = "Bufenter *.md",
    keys = {
      "<leader>ww",
      "<leader>wt"
    },
    init = function()
      --- Vim Wiki & Instant Markdown Plugin ---
      vim.g.vimwiki_conceallevel = 0
      vim.g.vimwiki_listsyms = " x"
      vim.g.vimwiki_global_ext = 0 -- This option will treat all markdown files in your system as part of vimwiki
      vim.g.vimwiki_ext2syntax = {
        [".md"] = "markdown",
        [".markdown"] = "markdown",
        [".mdown"] = "markdown",
      }
      local wiki_1 = {
        path = "~/vimwiki/",
        syntax = "markdown",
        ext = ".md",
        nested_syntaxes = {
          ["python"] = "python",
          ["js"]= "js",
          ["html"]= "html",
          ["css"]= "css",
          ["json"]= "json",
          ["c++"]= "cpp"
        },
        diary_rel_path = "inbox/"
      }
      local wiki_2 = {
        path = "~/notes/",
        syntax = "markdown",
        ext = ".md",
        nested_syntaxes = {
          ["python"] = "python",
          ["js"]= "js",
          ["html"]= "html",
          ["css"]= "css",
          ["json"]= "json",
          ["c++"]= "cpp"
        },
        diary_rel_path = "inbox/"
      }

      vim.g.vimwiki_list = { wiki_1, wiki_2 }
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
