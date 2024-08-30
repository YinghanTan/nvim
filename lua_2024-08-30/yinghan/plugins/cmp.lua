return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",  -- plugin only loads once we enter insert mode
  dependencies = {
    "hrsh7th/cmp-buffer",  -- source for text in buffer
    "hrsh7th/cmp-path",  -- source for file system paths
    "hrsh7th/cmp-cmdline",

    -- Ultisnips
    {
      "quangnguyen30192/cmp-nvim-ultisnips",
      event = "InsertEnter",
    },
    {
      "SirVer/ultisnips",
      event = "InsertEnter",
      dependencies = {
        "honza/vim-snippets"
      },
    },
    "hrsh7th/cmp-nvim-lua",
    "onsails/lspkind.nvim",  -- vs-code like pictograms
    {
      "hrsh7th/cmp-nvim-lsp",
      event = "InsertEnter",
    },
    "hrsh7th/cmp-emoji",
  },
  config = function()
    local cmp = require("cmp")  -- completion
    local lspkind = require("lspkind")  -- vscode like pictograms

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = {
        expand = function(args)
          vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
      },
      mapping = cmp.mapping.preset.insert({  -- keymaps to use with completion menu
        ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
        ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
        ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }), -- show completion suggestions
        ["<C-e>"] = cmp.mapping {
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }, --close application window
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm { select = false },
        ["\\<tab>"] = cmp.mapping.confirm({
          select = false,
        }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "ultisnips" },  -- snippets
        { name = "nvim_lsp" },  -- lsp
        { name = "buffer" },  -- text within current buffer
        { name = "path" },  -- file system paths
        { name = "calc" },
        { name = "emoji" },
      }),
      preselect = "None",
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      experimental = {
        ghost_text = false,
      },
      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })
  end,
}
