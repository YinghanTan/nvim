return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      provider = "deepseek",
      providers = {
        deepseek = {
          __inherited_from = "openai",
          api_key_name = "DEEPSEEK_API_KEY",
          endpoint = "https://api.deepseek.com",
          model = "deepseek-coder",
        },
        -- qianwen = {
        --   __inherited_from = "openai",
        --   api_key_name = "DASHSCOPE_API_KEY",
        --   endpoint = "https://dashscope.aliyuncs.com/compatible-mode/v1",
        --   model = "qwen-coder-plus-latest",
        -- },
        -- perplexity = {
        --   __inherited_from = "openai",
        --   api_key_name = "cmd:bw get notes perplexity-api-key",
        --   endpoint = "https://api.perplexity.ai",
        --   model = "llama-3.1-sonar-large-128k-online",
        -- },
        -- ollama = {
        --   endpoint = "http://127.0.0.1:11434", -- Note that there is no /v1 at the end.
        --   model = "qwq:32b",
        -- },
        -- openai = {
        --   endpoint = "https://api.openai.com/v1",
        --   model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
        --   timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
        --   temperature = 0,
        --   max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
        --   reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
        -- },

      },

      windows = {
        ask = {
          start_insert = false, -- Start insert mode when opening the ask window
        },
      },

      mappings = {
        --- @class AvanteConflictMappings
        diff = {
          ours = "<leader>co",
          theirs = "<leader>ct",
          all_theirs = "<leader>ca",
          both = "<leader>cb",
          cursor = "<leader>cc",
          next = "]c",
          prev = "[c",
        },
      },


      -- mcphub.nvim
      system_prompt = function()
        local hub = require("mcphub").get_hub_instance()
        return hub and hub:get_active_servers_prompt() or ""
      end,
      custom_tools = function()
        return {
          require("mcphub.extensions.avante").mcp_tool(),
        }
      end,
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      -- "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
          hints = {
            enabled = false
          }
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          -- file_types = { "markdown", "Avante" },
          file_types = { "Avante" },
        },
        ft = { "Avante" },
      },
    },
  },
}

