return {
  "vimwiki/vimwiki",
  lazy = false,
  ft = { "md", "markdown", "wiki", "vimwiki" },
  init = function()
    --- Vim Wiki & Instant Markdown Plugin ---
    -- vim.g.vimwiki_filetypes = { "markdown" }
    vim.g.vimwiki_conceallevel = 0
    vim.g.vimwiki_listsyms = " x"
    vim.g.vimwiki_global_ext = 1 -- This option will treat all markdown files in your system as part of vimwiki
    vim.g.vimwiki_ext2syntax = {
      [".md"] = "markdown",
      [".markdown"] = "markdown",
      [".mdown"] = "markdown",
    }
    local wiki_1 = {
      name = "wiki",
      path = "~/notes/",
      links_space_char = "-",
      syntax = "markdown",
      ext = ".md",
      nested_syntaxes = {
        ["bash"] = "bash",
        ["python"] = "python",
        ["js"] = "js",
        ["html"] = "html",
        ["css"] = "css",
        ["json"] = "json",
        ["c++"] = "cpp",
        ["latex"] = "tex",
      },
    }
    local wiki_2 = {
      name = "old",
      path = "~/vimwiki/",
      links_space_char = "-",
      syntax = "markdown",
      ext = ".md",
      nested_syntaxes = {
        ["bash"] = "bash",
        ["python"] = "python",
        ["js"] = "js",
        ["html"] = "html",
        ["css"] = "css",
        ["json"] = "json",
        ["c++"] = "cpp",
        ["latex"] = "tex",
      },
    }

    vim.g.vimwiki_list = { wiki_1, wiki_2 }
    vim.g.vimwiki_folding = "expr"
    vim.g.vimwiki_global_ext = 1 -- make sure vimwiki doesn't own all .md files

    local wk = require("which-key")
    wk.add({
      -- { "<leader>w", group = "[w]orkspace/[w]iki", mode = { "n", "v" } },
      { "<leader>w-", "<Plug>VimwikiRemoveHeaderLevel", desc = "[-] header lvl" },
      { "<leader>w=", "<Plug>VimwikiAddHeaderLevel", desc = "[+] header lvl" },
      { "<leader>ww", desc = "[w]iki" },
      { "<leader>wt", desc = "[w]iki new [t]ab" },
      { "<leader>ws", desc = "[w]iki [s]elect" },
      { "<leader>wr", desc = "[w]iki [r]ename" },
      { "<leader>wd", desc = "[w]iki [d]elete" },
    })
  end,
}
