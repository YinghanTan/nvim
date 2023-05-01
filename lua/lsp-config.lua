local whichkey = require("which-key")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Setup language servers
local lspconfig = require('lspconfig')
lspconfig.pyright.setup({
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150,
    },
})
lspconfig.tsserver.setup({
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150,
    },
})
lspconfig.lua_ls.setup({
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150,
    },
    settings = {
        Lua = {
            telemetry = { enable = false },
            runtime = {
                version = "LuaJIT",
                special = {
                    reload = "require",
                }
            },
            diagnostics = {
                globals = { 'vim', "lvim", "reload" }
            },
            workspace = default_workspace,
        }
    }
})
lspconfig.vimls.setup({
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150,
    },
})
lspconfig.html.setup({
    capabilities = capabilities,

    flags = {
        debounce_text_changes = 150,
    },
})
lspconfig.jsonls.setup({
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150,
    },
})
lspconfig.gopls.setup({
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150,
    },
})
lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150,
    },
    -- Server-specific settings
    settings = {
        ['rust-analyzer'] = {},
    }
})
lspconfig.ansiblels.setup({
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150,
    },
})


-- Global mappings
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('n', '[g', "<cmd>lua vim.diagnostic.goto_prev()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ']g', "<cmd>lua vim.diagnostic.goto_next()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "[i", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<cr>",
    { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "]i", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<cr>",
    { noremap = true, silent = true })
vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist, { noremap = true, silent = true })

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable comletion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf })
        vim.keymap.set('n', '<leader>lf', function()
            vim.lsp.buf.format({ async = true })
        end, { buffer = ev.buf })

        -- Whichkey
        local keymap_l = {
            l = {
                name = "lsp",
                r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "rename" },
                a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "code action" },
                d = { "<cmd>lua vim.diagnostic.open_float()<cr>", "line diagnostics" },
                f = { "format" },
            }
        }
        -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = ev.buf })
        -- vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { buffer = ev.buf })
        -- vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, { buffer = ev.buf })
        -- vim.keymap.set('n', '<leader>li', "<cmd>LspInfo<cr>", { buffer = ev.buf })
        vim.keymap.set('n', '<leader>lf', function()
            vim.lsp.buf.format({ async = true })
        end, { buffer = ev.buf })
        whichkey.register(keymap_l, { buffer = ev.buf, prefix = "<leader>" })

        local keymap_g = {
            name = "goto",
            d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "definition" },
            D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "declaration" },
            s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "signature help" },
            r = { "<cmd>lua vim.lsp.buf.references()<cr>", "references" },
            I = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "implementation" },
            y = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "type definition" },

        }
        whichkey.register(keymap_g, { buffer = ev.buf, prefix = "g" })
        -- Buffer local mappings
        -- Key mappings
        -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf })
        -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf })
        -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = ev.buf })
        -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = ev.buf })
        -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = ev.buf })
        -- vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, { buffer = ev.buf })


        vim.keymap.set('n', '<leader>lwa', vim.lsp.buf.add_workspace_folder, { buffer = ev.buf })
        vim.keymap.set('n', '<leader>lwr', vim.lsp.buf.remove_workspace_folder, { buffer = ev.buf })
        vim.keymap.set('n', '<leader>lwf', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, { buffer = ev.buf })
    end
})
