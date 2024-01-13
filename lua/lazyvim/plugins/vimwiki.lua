return {
  {
    "vimwiki/vimwiki",
    event = "Bufenter *.md",
    keys = {
      { "<leader>w-", "<Plug>VimwikiRemoveHeaderLevel", desc = "reduce header level"},
      { "<leader>w=", "<Plug>VimwikiAddHeaderLevel", desc = "reduce header level"},
      "<leader>ww",
      "<leader>wt"
    },
    init = function()
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
        path = "~/vimwiki/",
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
        path = "~/notes/",
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
  {
    "HakonHarnes/img-clip.nvim",
    event = "BufEnter",
    opts = {
      -- add options here
      -- or leave it empty to use the default settings
      default = {
        dir_path = "assets",
      },
      vimwiki = {
        url_encode_path = true,
        template = "![$CURSOR $FILE_NAME_NO_EXT]($FILE_PATH)",
        drag_and_drop = {
          download_images = false,
        },
      },
    },
    keys = {
      -- suggested keymap
      { "<leader>pi", "<cmd>PasteImage<cr>", desc = "Paste clipboard image" },
    },
  },
}
