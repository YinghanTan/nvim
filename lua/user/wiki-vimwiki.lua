local M = {
  "vimwiki/vimwiki",
  lazy = false,
}

function M.init()
  --- Vim Wiki & Instant Markdown Plugin ---
  vim.g.vimwiki_conceallevel = 2
  vim.g.vimwiki_listsyms = " x"
  vim.g.vimwiki_global_ext = 1 -- This option will treat all markdown files in your system as part of vimwiki
  vim.g.vimwiki_ext2syntax = {
    [".md"] = "markdown",
    [".markdown"] = "markdown",
    [".mdown"] = "markdown",
  }
  local wiki_1 = {
    path = "~/notes/",
    links_space_char = "-",
    syntax = "markdown",
    ext = ".md",
    nested_syntaxes = {
      ["bash"] = "bash",
      ["python"] = "python",
      ["js"]= "js",
      ["html"]= "html",
      ["css"]= "css",
      ["json"]= "json",
      ["c++"]= "cpp",
      ["latex"]= "tex"
    },
    diary_rel_path = "inbox/"
  }
  local wiki_2 = {
    path = "~/vimwiki/",
    links_space_char = "-",
    syntax = "markdown",
    ext = ".md",
    nested_syntaxes = {
      ["bash"] = "bash",
      ["python"] = "python",
      ["js"]= "js",
      ["html"]= "html",
      ["css"]= "css",
      ["json"]= "json",
      ["c++"]= "cpp",
      ["latex"]= "tex"
    },
    diary_rel_path = "inbox/"
  }

  vim.g.vimwiki_list = { wiki_1, wiki_2 }
  vim.g.vimwiki_folding = "expr"
  vim.g.vimwiki_global_ext = 1 -- make sure vimwiki doesn't own all .md files


  local wk = require("which-key")
  wk.register {
    mode = { "n", "v" },
    ["<leader>w-"] = { "<Plug>VimwikiRemoveHeaderLevel", desc = "reduce header level" },
    ["<leader>w="] = { "<Plug>VimwikiAddHeaderLevel", desc = "reduce header level" },
    ["<leader>ww"] = { desc = "wiki" },
    ["<leader>wt"] = {  desc = "wiki new tab" },
    ["<leader>ws"] = {  desc = "wiki select" },
    ["<leader>wr"] = {  desc = "wiki rename" },
    ["<leader>wd"] = {  desc = "wiki delete" },
  }

end

return M


