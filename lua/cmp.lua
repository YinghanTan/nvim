local cmp_status_ok, cmp  = pcall(require, "cmp")
if not cmp_status_ok then
    return
end

-- local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
local snip_status_ok, cmp_ultisnips_mappings = pcall(require, "cmp_nvim_ultisnips.mappings")
if not snip_status_ok then
    return
end


-- local check_backspace = function()
--     local col = vim.fn.col(".") - 1
--     return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
-- end


local icons = require("icons")
local kind_icons = icons.kind

cmp.setup({
        snippet = {
            expand = function(args)
                vim.fn["UltiSnips#Anon"](args.body)
            end
        },
        mapping = {
            ["<C-p>"] = cmp.mapping.select_prev_item(), -- previous completion
            ["<C-n>"] = cmp.mapping.select_next_item(), -- next completion
            ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), {"i", "c"}), -- popup window scroll back
            ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }), -- popup window scroll forward
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }), -- trigger completion
            -- ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
            ["<C-e>"] = cmp.mapping({ -- exit completion
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close(),
                }),
            ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

            -- ["<Tab>"] = cmp.mapping(
            --     function(fallback)
            --         cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
            --     end,
            --     { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
            --     ),
            -- ["<S-Tab>"] = cmp.mapping(
            --     function(fallback)
            --         cmp_ultisnips_mappings.jump_backwards(fallback)
            --     end,
            --     { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
            --     ),

            ["<C-j>"] = cmp.mapping( -- next input position
                function(fallback)
                    cmp_ultisnips_mappings.compose { "jump_forwards", "select_next_item" }(fallback)
                end,
                { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
                ),
            ["<C-k>"] = cmp.mapping(
                function(fallback)
                    cmp_ultisnips_mappings.jump_backwards(fallback)
                end,
                { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
                ),
            ["<Leader><Tab>"] = cmp.mapping(
                function(fallback)
                    cmp_ultisnips_mappings.compose { "expand" }(fallback)
                end,
                { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
                ),
        },
        formatting = {
            fields = { "kind", "abbr", "menu" },
            format = function(entry, vim_item)
                -- Kind icons
                vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
                vim_item.menu = ({
                        nvim_lsp = "[LSP]",
                        nvim_lua = "[NVIM_LUA]",
                        ultisnips = "[Snippet]",
                        buffer = "[Buffer]",
                        path = "[Path]",
                        emoji = "[Emoji]",
                    })[entry.source.name]
                return vim_item
            end,
        },
        
        sources = {
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
            { name = "ultisnips" },
            { name = "buffer" },
            { name = "path" },
            { name = "npm" },
            { name = "emoji" },
        },
        confirm_opts = {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        },
        window = {
            documentation = {
                border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            },
        },
        experimental = {
            ghost_text = false,
            native_menu = false,
        }

    })
