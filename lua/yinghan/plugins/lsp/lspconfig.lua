return {
  "neovim/nvim-lspconfig",  -- used to configure our language servers
  event = { "BufReadPre", "BufNewFile" },  -- only need lsp when we are in a buffer, setup lsp config after we run mason and mason isn't lazy loaded
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",  -- integrate auto completion with language servers
    { "antosha417/nvim-lsp-file-operations", config = true },  -- modify imports when the file has been renamed
    { "folke/neodev.nvim", opts = {} },  -- add improved lsp lsp functionality for the lua language server
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import mason_lspconfig plugin
    local mason_lspconfig = require("mason-lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    vim.api.nvim_create_autocmd("LspAttach", {  -- autocmd trigger to run logic whenever an lsp client attaches to a buffer
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),  -- group together autocommands under the group name userlspconfig
      callback = function(ev)  -- callback is the function/logic that is executed on the event lspattach
        -- Buffer local mappings.
        -- See :help vim.lsp.* for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }  -- options, buffer is the event(lspattach)'s buffer, silent is true

        -- all the keymaps below will only be available when an lsp client attaches to a buffer and they'll only be available within the buffer
        -- set keybinds
        opts.desc = "Show LSP references"
        vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<cr>", opts)  -- show definition, references
        opts.desc = "Go to declaration"
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)  -- go to declaration
        opts.desc = "Show LSP definitions"
        vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)  -- show lsp definitions
        opts.desc = "Show LSP implementations"
        vim.keymap.set("n", "gI", "<cmd>Telescope lsp_implementations<cr>", opts)  -- show lsp type definitions
        opts.desc = "show lsp type definitions"
        vim.keymap.set("n", "gy", "<cmd>Telescope lsp_type_definitions<cr>", opts)  -- lsp type definitions
        opts.desc = "See available code actions"
        vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts)  --see available code actions
        opts.desc = "Smart rename"
        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)  -- smart rename
        opts.desc = "Show buffer diagnostics"
        vim.keymap.set("n", "<leader>sdd", "<cmd>Telescope diagnostics bufnr=0<cr>", opts)  -- show diagnostics for file
        opts.desc = "Show line diagnostics"
        vim.keymap.set("n", "<leader>sdw", vim.diagnostic.open_float, opts)  -- show diagnostics for line
        opts.desc = "Go to previous diagnostic"
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
        opts.desc = "Go to previous diagnostic"
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)  -- jump to next diagnostic
        opts.desc = "Show documentation for what is under cursor"
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)  -- show documentation for what is under cursor
        opts.desc = "Restart LSP"
        vim.keymap.set("n", "<leader>lR", ":LspRestart<cr>", opts)  -- mapping to restart lsp if necessary
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()  -- enable autocompletion

    -- Change the diagnostic symbol in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    mason_lspconfig.setup_handlers({
      -- default handler for installed servers
      -- automatically configure the language servers in a specific way
      function(server_name)
        lspconfig[server_name].setup({  -- configure the language server for each language
          capabilties = capabilities  -- pass the capabilties to language server to enable completion with nvim cmp
        })
      end,
      -- if you need to setup a different configuration for a specific language server that isn't the default
      ["svelte"] = function()
        -- configure svelte server
        lspconfig["svelte"].setup({
          capabilities = capabilities,
          on_attach = function(client, bufnr)  -- when language server attaches to the buffer
            vim.api.nvim_create_autocmd("BufWritePost", {
              pattern = { "*.js", "*.ts" },
              callback = function(ctx)
                -- Here use ctx.match instead of ctx.file
                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
              end,
            })
          end,
        })
      end,
      ["graphql"] = function()
        -- configure graphql language server
        lspconfig["graphql"].setup({
          capabilities = capabilities,
          filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
        })
      end,
      ["emmet_ls"] = function()
        -- configure emmet language server
        lspconfig["emmet_ls"].setup({
          capabilities = capabilities,
          filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte"},
        })
      end,
      ["lua_ls"] = function()
        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              -- make the language server recognize "vim" global
              diganostics = {
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        })
      end,
    })


  end,
}
