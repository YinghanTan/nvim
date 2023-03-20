local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

-- require("lsp-signature")
-- require("handlers").setup()
-- require("null-ls")

local servers = {
    gopls = {},
    html = {},
    jsonls = {},
    pyright = {},
    rust_analyzer = {},
    sumneko_lua = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'},
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = { enable = false },
      },
    },
    tsserver = {},
    vimls = {},
}

local lsp_signature = require "lsp_signature"
lsp_signature.setup {
  bind = true,
  handler_opts = {
    border = "rounded",
  },
}


local function on_attach(client, bufnr)
    -- Enable completion triggered by <C-X><C-O>
    -- See `:help omnifunc` and `:help ins-completion` for more information.
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Use LSP as the handler for formatexpr.
    -- See `:help formatexpr` for more information.
    vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

    -- configure key mappings
    require("config.lsp.keymaps").setup(client, bufnr)
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()) -- for nvim-cmp

local opts = {
    on_attach = on_attach,
    capabilities = capabilities, -- for nvim-cmp
    flags = {
        debounce_text_changes = 150,
    },
}

function setup()
    require("config.lsp.installer").setup(servers, opts)
end

setup()

