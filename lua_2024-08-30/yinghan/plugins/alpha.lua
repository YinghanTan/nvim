return {
  "goolord/alpha-nvim",
  event = "VimEnter",  -- this plugin loads after neovim is done doing all the startup stuff
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      [[ ★　✯   🛸                    🪐   .°•    |    ]],
      [[    __     ° ★　•       🛰       __      / \   ]],
      [[   / /   ____ ___  ______  _____/ /_    | O |  ]],
      [[  / /   / __ `/ / / / __ \/ ___/ __ \   | O |  ]],
      [[ / /___/ /_/ / /_/ / / / / /__/ / / /  /| | |\ ]],
      [[/_____/\__,_/\__,_/_/ /_/\___/_/ /_/  /_(.|.)_\]],
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("\\ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("\\sf", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("\\st", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("\\wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
      dashboard.button("\\sr",  " " .. " Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("\\\\c",  " " .. " Config", ":e ~/.config/nvim/init.lua <CR>"),
      dashboard.button("\\sp",  " " .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
      dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

  end,
}
