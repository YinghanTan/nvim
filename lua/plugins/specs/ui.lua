local sources = dots.coding.cmp.sources
return {

  -- colorscheme
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require('gruvbox').setup({
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        dim_inactive = false,
        transparent_mode = false,
        overrides = {
          -- DiffChange = {bg="#rgbcolor", fg="#rgbcolor", ...},
          -- DiffAdd = {bg="#rgbcolor", fg="#rgbcolor", ...},
          DiffDelete = {bg="none" },
          -- DiffText = {bg="#rgbcolor", fg="#rgbcolor", ...},
        }
      })
    end
  },
  {
    "catppuccin/nvim",
    opts = {
      custom_highlights = function(C)
        return {
          Pmenu = { bg = C.mantle },
          PmenuSel = { bg = C.blue, fg = C.base, style = { "bold" } },
          CmpItemKindCodeium = { fg = C.green },
          CmpItemMenu = { fg = C.overlay0 },
          MatchParen = { fg = C.peach, bg = C.none, style = { "bold" } },

          DiagnosticVirtualTextError = {
            fg = C.red,
            bg = C.none,
            style = { "italic" },
          },
          DiagnosticVirtualTextWarn = {
            fg = C.yellow,
            bg = C.none,
            style = { "italic" },
          },
          DiagnosticVirtualTextInfo = {
            fg = C.sky,
            bg = C.none,
            style = { "italic" },
          },
          DiagnosticVirtualTextHint = {
            fg = C.teal,
            bg = C.none,
            style = { "italic" },
          },
        }
      end,
      integrations = {
        telescope = { style = "nvchad" },
        illuminate = true,
        notify = true,
        mini = true,
        flash = true,
        barbecue = false,
        dashboard = false,
        alpha = false,
        nvimtree = false,
        ts_rainbow2 = false,
        ts_rainbow = false,
      },
    },
    name = "catppuccin",
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      on_highlights = function(hl, C)
        hl.CmpItemKindCodeium = { fg = C.green }

        hl.TelescopeBorder = { fg = C.bg_dark, bg = C.bg_dark }
        hl.TelescopeMatching = { fg = C.blue }
        hl.TelescopeNormal = { bg = C.bg_dark }
        hl.TelescopePromptBorder = { fg = C.comment, bg = C.comment }
        hl.TelescopePromptNormal = { fg = C.bg_dark, bg = C.comment }
        hl.TelescopePromptPrefix = { fg = C.magenta }
        hl.TelescopePreviewTitle = { fg = C.bg_dark, bg = C.green }
        hl.TelescopePromptTitle = { fg = C.bg_dark, bg = C.red }
        hl.TelescopeResultsTitle = { fg = C.bg_dark, bg = C.purple }
        hl.TelescopeSelection = { fg = C.fg, bg = C.comment }
        hl.TelescopeSelectionCaret = { fg = C.purple }
      end,
    },
  },


  -- Better `vim.notify()`
  {
    "rcarriga/nvim-notify",
    opts = function()
      local api = vim.api
      local stages = require("notify.stages.fade_in_slide_out")("top_down")
      local base = require("notify.render.base")
      return {
        render = function(bufnr, notif, highlights, config)
          local max_message_width = math.max(math.max(unpack(vim.tbl_map(function(line)
            return vim.fn.strchars(line)
          end, notif.message))))
          local title = notif.title[1]
          local title_accum = vim.str_utfindex(title)

          local title_buffer =
            string.rep(" ", (math.max(max_message_width, title_accum, config.minimum_width()) - title_accum) / 2)

          local namespace = base.namespace()

          api.nvim_buf_set_lines(bufnr, 0, 1, false, { "", "" })
          api.nvim_buf_set_extmark(bufnr, namespace, 0, 0, {
            virt_text = {
              { title_buffer .. notif.icon .. " " .. title .. title_buffer, highlights.title },
            },
            virt_text_win_col = 0,
            priority = 10,
          })
          api.nvim_buf_set_extmark(bufnr, namespace, 1, 0, {
            virt_text = {
              {
                string.rep("━", math.max(max_message_width, title_accum, config.minimum_width())),
                highlights.border,
              },
            },
            virt_text_win_col = 0,
            priority = 10,
          })
          api.nvim_buf_set_lines(bufnr, 2, -1, false, notif.message)

          api.nvim_buf_set_extmark(bufnr, namespace, 2, 0, {
            hl_group = highlights.body,
            end_line = 1 + #notif.message,
            end_col = #notif.message[#notif.message],
            priority = 50,
          })
        end,
        stages = {
          function(...)
            local opts = stages[1](...)
            if opts then
              opts.row = opts.row + 1
            end
            return opts
          end,
          unpack(stages, 2),
        },
        fps = 60,
      }
    end,
    init = function()
      vim.notify = function(...)
        if not require("lazy.core.config").plugins["nvim-notify"]._.loaded then
          require("lazy").load({ plugins = "nvim-notify" })
        end
        require("notify")(...)
      end
    end,
  },

  -- indent guides for Neovim
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      filetype_exclude = {
        "help",
        "terminal",
        "lazy",
        "lspinfo",
        "TelescopePrompt",
        "TelescopeResults",
        "mason",
        "lazyterm",
        "toggleterm",
        "noice",
        "",
      },
      buftype_exclude = { "terminal" },
    },
    event = "VeryLazy",
  },
  {
    "echasnovski/mini.indentscope",
    opts = {
      symbol = "│",
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "terminal",
          "lazy",
          "lspinfo",
          "TelescopePrompt",
          "TelescopeResults",
          "mason",
          "lazyterm",
          "toggleterm",
          "noice",
          "python",
          "undotree",
          "norg",
          "",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    event = "VeryLazy",
  },


  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        names = false,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
      },
    },
    config = function(_, opts)
      require("colorizer").setup(opts)
      require("colorizer").attach_to_buffer()
    end,
    event = "VeryLazy",
  },

  -- better vim.ui
  {
    "stevearc/dressing.nvim",
    opts = {
      input = {
        border = "solid",
      },
      nui = {
        border = "solid",
      },
      builtin = {
        border = "solid",
      },
    },
    event = "VeryLazy",
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      local icons = dots.UI.icons
      local Util = require("core.utils.lazyvim")

      return {
        options = {
          theme = "auto",
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "alpha" } },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = {
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
            -- stylua: ignore
            {
              function() return require("nvim-navic").get_location() end,
              cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
            },
          },
          lualine_x = {
            -- stylua: ignore
            {
              function() return require("noice").api.status.command.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
              color = Util.fg("Statement"),
            },
            -- stylua: ignore
            {
              function() return require("noice").api.status.mode.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
              color = Util.fg("Constant"),
            },
            -- stylua: ignore
            {
              function() return "  " .. require("dap").status() end,
              cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
              color = Util.fg("Debug"),
            },
            { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = Util.fg("Special") },
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
            },
          },
          lualine_y = {
            { "progress", separator = " ", padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            function()
              return " " .. os.date("%R")
            end,
          },
        },
        extensions = { "neo-tree", "lazy" },
      }
    end,
  },
  -- lsp symbol navigation for lualine. This shows where
  -- in the code structure you are - within functions, classes,
  -- etc - in the statusline.
  {
    "SmiteshP/nvim-navic",
    lazy = true,
    init = function()
      vim.g.navic_silence = true
      require("core.utils.lazyvim").on_attach(function(client, buffer)
        if client.server_capabilities.documentSymbolProvider then
          require("nvim-navic").attach(client, buffer)
        end
      end)
    end,
    opts = function()
      return {
        separator = " ",
        highlight = true,
        depth_limit = 5,
        icons = dots.UI.icons
      }
    end,
  },

  -- icons
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- ui components
  { "MunifTanjim/nui.nvim", lazy = true },

  -- file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    keys = {
      -- {
      --   "<leader>fe",
      --   function()
      --     require("neo-tree.command").execute({ toggle = true, dir = require("util").get_root() })
      --   end,
      --   desc = "Explorer NeoTree (root dir)",
      -- },
      {
        "<leader>fE",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
      { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
      { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
    },
    deactivate = function()
      vim.cmd([[Neotree close]])
    end,
    init = function()
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree")
        end
      end
    end,
    opts = {
      sources = { "filesystem", "buffers", "git_status", "document_symbols" },
      open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "Outline" },
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
      window = {
        mappings = {
          ["<space>"] = "none",
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
      },
    },
    config = function(_, opts)
      require("neo-tree").setup(opts)
      vim.api.nvim_create_autocmd("TermClose", {
        pattern = "*lazygit",
        callback = function()
          if package.loaded["neo-tree.sources.git_status"] then
            require("neo-tree.sources.git_status").refresh()
          end
        end,
      })
    end,
  },

}
