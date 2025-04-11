return {
  { -- Autocompletion
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- Adds other completion capabilities.
      --  nvim-cmp does not ship with all sources by default. They are split
      --  into multiple repos for maintenance purposes.
      "hrsh7th/cmp-buffer", -- source for text in buffer
      "hrsh7th/cmp-path", -- source for file system paths
      "hrsh7th/cmp-cmdline",
      { "petertriho/cmp-git", opts = {} },
      -- Ultisnips
      {
        "quangnguyen30192/cmp-nvim-ultisnips",
        event = "InsertEnter",
      },
      {
        "SirVer/ultisnips",
        event = "InsertEnter",
        dependencies = {
          "honza/vim-snippets",
        },
      },
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "onsails/lspkind.nvim", -- vs-code like pictograms
      "hrsh7th/cmp-emoji",
    },
    config = function()
      -- See `:help cmp`
      local cmp = require("cmp") -- completion
      local lspkind = require("lspkind") -- vscode like pictograms

      cmp.setup({
        completion = {
          completeopt = "menu,menuone,preview,noselect",
        },
        snippet = {
          expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          end,
        },

        -- For an understanding of why these mappings were
        -- chosen, you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item(), -- Select the [n]ext item
          ["<C-p>"] = cmp.mapping.select_prev_item(), -- Select the [p]revious item
          ["<Down>"] = cmp.mapping.select_next_item(), -- Select the [n]ext item
          ["<Up>"] = cmp.mapping.select_prev_item(), -- Select the [p]revious item
          ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Scroll the documentation window [b]ack / [f]orward
          ["<C-f>"] = cmp.mapping.scroll_docs(4), -- Scroll the documentation window [b]ack / [f]orward
          ["<C-Space>"] = cmp.mapping.complete({}), -- show completion suggestions
          ["<C-e>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }), --close application window


          -- Accept ([y]es) the completion.
          --  This will auto-import if your LSP supports it.
          --  This will expand snippets if the LSP sent a snippet.
          ["<C-y>"] = cmp.mapping.confirm({ select = false }),

          -- If you prefer more traditional completion keymaps,
          -- you can uncomment the following lines
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
          -- ["\\<Tab>"] = cmp.mapping.confirm({ select = false }),
          --['<Tab>'] = cmp.mapping.select_next_item(),
          --['<S-Tab>'] = cmp.mapping.select_prev_item(),
        }),

        -- sources for autocompletion
        sources = {
          {
            name = "lazydev",
            -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
            group_index = 0,
          },
          { name = "nvim_lsp" }, -- lsp
          { name = "ultisnips" }, -- snippets
          { name = "buffer" }, -- text within current buffer
          { name = "path" }, -- file system paths
          { name = "calc" },
          { name = "emoji" },
        },
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
  },
}
-- vim: ts=2 sts=2 sw=2 et
