local status_ok, nvim_notify = pcall(require, "notify")
if not status_ok then
    return
end
nvim_notify.setup {
    stages = "fade",
    background_colour = 'FloatShadow',
    timeout = 3000,
}

local lsp_installer_servers = require "nvim-lsp-installer.servers"
local utils = require ("utils")


local M = {}

function M.setup(servers, options)
  for server_name, _ in pairs(servers) do
    local server_available, server = lsp_installer_servers.get_server(server_name)

    if server_available then
      server:on_ready(function()
        local opts = vim.tbl_deep_extend("force", options, servers[server.name] or {})

        -- Check if server object exists
        if server~=nil and type(server.setup) == "function" then
          server:setup(opts)
        else
          print("Error: server object does not have a setup method")
        end

      end)

      if not server:is_installed() then
        nvim_notify("Installing " .. server.name)
        -- require('notify')("Installing " .. server.name)
        -- vim.notify("Installing " .. server.name)
        -- utils("Installing " .. server.name)
        server:install()
      end
    else
      nvim_notify(server)
      -- require('notify')(server)
      -- vim.notify(server)
      -- utils(server)
    end
  end
end

return M
