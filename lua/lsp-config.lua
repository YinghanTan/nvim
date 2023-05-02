local whichkey = require("which-key")
local capabilities = require('cmp_nvim_lsp').default_capabilities()


-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({
    -- add any options here, or leave empty to use the default settings
    {
        library = {
            enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
            -- these settings will be used for your Neovim config directory
            runtime = true, -- runtime path
            types = true,   -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
            plugins = true, -- installed opt or start plugins in packpath
            -- you can also specify the list of plugins to make available as a workspace library
            -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
        },
        setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
        -- for your Neovim config directory, the config.library settings will be used as is
        -- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
        -- for any other directory, config.library.enabled will be set to false
        override = function(root_dir, options)
        end,
        -- With lspconfig, Neodev will automatically setup your lua-language-server
        -- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
        -- in your lsp start options
        lspconfig = true,
        -- much faster, but needs a recent built of lua-language-server
        -- needs lua-language-server >= 3.6.0
        pathStrict = true,
    }
})

-- Run language servers --
local lspconfig = require('lspconfig')
lspconfig.pyright.setup({
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150,
    },
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
            },
            single_file_support = true,
        },
    },
})
lspconfig.tsserver.setup({
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150,
    },
    disable_formatting = true,
    settings = {
        javascript = {
            inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
            },
        },
        typescript = {
            inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
            },
        },
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
            completion = {
                callSnippet = "Replace"
            },
            runtime = {
                version = "LuaJIT",
                special = {
                    reload = "require",
                },
                -- setup your lua path
                path = vim.split(package.path, ";"),
            },
            diagnostics = {
                globals = { 'vim', "lvim", "reload" }
            },
            workspace = {
                -- Make the server aware of neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            }
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
    settings = {
        gopls = {
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
            semanticTokens = true,
        },
    },
})
lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150,
    },
    -- Server-specific settings
    settings = {
        ['rust-analyzer'] = {
            cargo = { allFeatures = true },
            checkOnSave = {
                command = "cargo clippy",
                extraArgs = { "--no-deps" },
            },
        },
    }
})
lspconfig.ansiblels.setup({
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150,
    },
})

-- Handlers config --
local function handlers_setup()
    -- lsp handlers config
    local lsp = {
        float = {
            focusable = true,
            style = "minimal",
            border = "rounded",
        },
        diagnostic = {
            virtual_text = { spacing = 4, prefix = "●" },
            underline = true,
            update_in_insert = false,
            severity_sort = true,
            float = {
                focusable = true,
                style = "minimal",
                border = "rounded",
            }
        }
    }
    -- diagnostic signs
    local diagnostic_signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn",  text = "" },
        { name = "DiagnosticSignHint",  text = "" },
        { name = "DiagnosticSignInfo",  text = "" },
    }
    for _, sign in ipairs(diagnostic_signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
    end

    -- Diagnostic configuration
    vim.diagnostic.config(lsp.diagnostic)

    -- Hover configuration
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, lsp.float)

    -- Signature help configuration
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, lsp.float)
end


-- Key Maps --
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
        -- setup lsp handlers
        handlers_setup()

        -- Enable comletion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf })
        vim.keymap.set('n', '<leader>lf', function()
            vim.lsp.buf.format({
                async = true,
                filter = function(client)
                    return client.name == "null-ls"
                end,
            })
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
