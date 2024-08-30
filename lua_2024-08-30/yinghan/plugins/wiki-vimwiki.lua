return {
  "vimwiki/vimwiki",
  lazy = false,
  ft = { "md", "markdown", "wiki", "vimwiki"},
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
    wk.register({
      mode = { "n", "v" },
      ["<leader>w-"] = { "<Plug>VimwikiRemoveHeaderLevel", desc = "reduce header level" },
      ["<leader>w="] = { "<Plug>VimwikiAddHeaderLevel", desc = "reduce header level" },
      ["<leader>ww"] = { desc = "wiki" },
      ["<leader>wt"] = { desc = "wiki new tab" },
      ["<leader>ws"] = { desc = "wiki select" },
      ["<leader>wr"] = { desc = "wiki rename" },
      ["<leader>wd"] = { desc = "wiki delete" },
    })
  end,
}
