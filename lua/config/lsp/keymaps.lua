local M = {}

local whichkey = require("which-key")
local keymap = vim.api.nvim_set_keymap

local function keymappings(client, bufnr)
  local opts = { noremap = true, silent = true }

  -- For normal mode
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
  -- For normal and visual mode
  vim.keymap.set({"n", "v"}, "K", vim.lsp.buf.hover, { buffer = 0 })

  keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  keymap("n", "[e", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", opts)
  keymap("n", "]e", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", opts)
  keymap('n', '<leader>lq', "<cmd>lua vim.diagnostic.setloclist", opts)
  -- Whichkey
  local keymap_l = {
    l = {
      name = "Code",
      r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
      a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
      d = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics" },
      i = { "<cmd>LspInfo<CR>", "Lsp Info" },
      f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format Document" },

--         vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace - folder, opts)
--         vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
--         vim.keymap.set('n', '<leader>wl', function()
--             print(vim.inspect(vim.lsp.buf.list_workspace - folders()))
--         end, opts)
--         vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--         vim.keymap.set('n', '<leader>f', function()
--             vim.lsp.buf.format { async = true }
--         end, opts)

    },
  }
  if client.server_capabilities.document_formatting then
    keymap_l.l.f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format Document" }
  end
  local keymap_g = {
    name = "Goto",
    d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Definition" },
    D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Declaration" },
    s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
    I = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementation" },
    y = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
  }
  whichkey.register(keymap_l, { buffer = bufnr, prefix = "<leader>" })
  whichkey.register(keymap_g, { buffer = bufnr, prefix = "g" })
end

function M.setup(client, bufnr)
  keymappings(client, bufnr)
end

return M
