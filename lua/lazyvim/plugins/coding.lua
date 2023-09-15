return {


  -- -- snippets
  -- {
  --   "L3MON4D3/LuaSnip",
  --   -- follow latest release.
  --   version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  --   build = (not jit.os:find("Windows"))
  --       and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
  --     or nil,
  --   dependencies = {
  --     {
  --       "rafamadriz/friendly-snippets",
  --       config = function()
  --         require("luasnip.loaders.from_vscode").lazy_load()
  --         require('luasnip').filetype_extend("ruby", {"rails"})
  --       end,
  --     },
  --     "molleweide/LuaSnip-snippets.nvim",
  --   },
  --   opts = {
  --     history = true,
  --     delete_check_events = "TextChanged",
  --   },
  --   config = function()
  --     require("luasnip").config.set_config({
  --       history = false,
  --       updateevents = "TextChanged,TextChangedI",
  --     })
  --     require("luasnip.loaders.from_snipmate").lazy_load()
  --     require("luasnip.loaders.from_snipmate").lazy_load({ paths = "./snippets" })
  --   end,
  --   -- stylua: ignore
  --   keys = {
  --     { "\\<tab>",  function() require("luasnip").expand() end, mode = {"i", "s"} },
  --     { "<C-j>", function() require("luasnip").jump(1) end, mode = {"i", "s"} },
  --     { "<C-k>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
  --     { "<C-e>", function()
  --       if require("luasnip").choice_active() then
  --         require("luasnip").change_choice(1)
  --       end
  --     end, mode = { "i", "s" }, silent = true },
  --   },
  -- },

  {
    "SirVer/ultisnips",
    lazy = false,
    init = function()

      vim.cmd("autocmd BufWritePost *.snippets :call UltiSnips#RefreshSnippets() | :CmpUltisnipsReloadSnippets")
      vim.cmd("autocmd FileType tex,latex UltiSnipsAddFiletypes tex.latex")

      vim.g.UltiSnipsExpandTrigger = "<leader><tab>"
      vim.g.UltiSnipsJumpForwardTrigger = "<C-j>"
      vim.g.UltiSnipsJumpBackwardTrigger = "<C-k>"
      vim.g.UltiSnipsEditSplit = "vertical"

      vim.g.snips_author = "Yinghan Tan"
      vim.g.UltiSnipsSnippetDirectories = {"ultisnips"}
      vim.g.UltiSnipsSnippetsDir = "~/.config/nvim/ultisnips"
      vim.g.UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit = "~/.config/nvim/ultisnips"
    end,
    keys = {
      { "\\ue",  "<cmd>UltiSnipsEdit<cr>", desc = "ultisnips edit" },
    },
  },
  { "honza/vim-snippets" },

  -- auto completion
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      -- "saadparwaiz1/cmp_luasnip",
      {
        "quangnguyen30192/cmp-nvim-ultisnips",
        config = function()
          require("cmp_nvim_ultisnips").setup({})
        end,
      }
    },
    opts = function()
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()
      return {
        completion = {
          completeopt = "menu,menuone,noinsert,noselect",
        },
        snippet = {
          expand = function(args)
            -- require("luasnip").lsp_expand(args.body)
            vim.fn["UltiSnips#Anon"](args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),

          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),

          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["\\<tab>"] = cmp.mapping.confirm({
            select = false,
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

          -- ["<S-CR>"] = cmp.mapping.confirm({
          --   behavior = cmp.ConfirmBehavior.Replace,
          --   select = true,
          -- }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          -- { name = "luasnip" },
          { name = "ultisnips" },
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }),
        formatting = {
          format = function(_, item)
            local icons = require("lazyvim.config").icons.kinds
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end
            return item
          end,
        },
        -- experimental = {
        --   ghost_text = {
        --     hl_group = "CmpGhostText",
        --   },
        -- },
        sorting = defaults.sorting,
        preselect = "none",
      }
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },

  -- comments
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        end,
      },
    },
  },

  -- Better text-objects
  {
    "echasnovski/mini.ai",
    -- keys = {
    --   { "a", mode = { "x", "o" } },
    --   { "i", mode = { "x", "o" } },
    -- },
    event = "VeryLazy",
    dependencies = { "nvim-treesitter-textobjects" },
    opts = function()
      local ai = require("mini.ai")
      return {
        n_lines = 500,
        custom_textobjects = {
          o = ai.gen_spec.treesitter({
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }, {}),
          f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
          c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
        },
      }
    end,
    config = function(_, opts)
      require("mini.ai").setup(opts)
      -- register all text objects with which-key
      require("lazyvim.util").on_load("which-key.nvim", function()
        ---@type table<string, string|table>
        local i = {
          [" "] = "Whitespace",
          ['"'] = 'Balanced "',
          ["'"] = "Balanced '",
          ["`"] = "Balanced `",
          ["("] = "Balanced (",
          [")"] = "Balanced ) including white-space",
          [">"] = "Balanced > including white-space",
          ["<lt>"] = "Balanced <",
          ["]"] = "Balanced ] including white-space",
          ["["] = "Balanced [",
          ["}"] = "Balanced } including white-space",
          ["{"] = "Balanced {",
          ["?"] = "User Prompt",
          _ = "Underscore",
          a = "Argument",
          b = "Balanced ), ], }",
          c = "Class",
          f = "Function",
          o = "Block, conditional, loop",
          q = "Quote `, \", '",
          t = "Tag",
        }
        local a = vim.deepcopy(i)
        for k, v in pairs(a) do
          a[k] = v:gsub(" including.*", "")
        end

        local ic = vim.deepcopy(i)
        local ac = vim.deepcopy(a)
        for key, name in pairs({ n = "Next", l = "Last" }) do
          i[key] = vim.tbl_extend("force", { name = "Inside " .. name .. " textobject" }, ic)
          a[key] = vim.tbl_extend("force", { name = "Around " .. name .. " textobject" }, ac)
        end
        require("which-key").register({
          mode = { "o", "x" },
          i = i,
          a = a,
        })
      end)
    end,
  },
}
