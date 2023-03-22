local M = {}

function M.setup()
    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
    end

    local luasnip = require "luasnip"
    local cmp = require "cmp"

    local snip_status_ok, cmp_ultisnips_mappings = pcall(require, "cmp_nvim_ultisnips.mappings")
    if not snip_status_ok then
        return
    end

    cmp.setup({
        completion = { completeopt = "menu,menuone,noinsert", keyword_length = 1 },
        experimental = { native_menu = false, ghost_text = false },
        snippet = {
            expand = function(args)
                -- require("luasnip").lsp_expand(args.body)
                vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            end,
        },
        formatting = {
            format = function(entry, vim_item)
                vim_item.menu = ({
                    nvim_lsp = "[LSP]",
                    buffer = "[Buffer]",
                    ultisnips = "[Snippet]",
                    luasnip = "[Snip]",
                    nvim_lua = "[Lua]",
                    treesitter = "[Treesitter]",
                    path = "[Path]",
                })[entry.source.name]
                return vim_item
            end,
        },
        confirm_opts = {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        },
        mapping = {
            ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }), -- previous completion
            ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }), -- next completion
            ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }), -- popup window scroll back
            ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }), -- popup window scroll forward
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }), -- trigger completion
            -- ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
            ["<C-e>"] = cmp.mapping { i = cmp.mapping.close(), c = cmp.mapping.close() }, -- exit completion
            -- ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            ["<CR>"] = cmp.mapping {
                i = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false },
                c = function(fallback)
                    if cmp.visible() then
                        cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                    else
                        fallback()
                    end
                end,
            },
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
        window = {
            completion = cmp.config.window.bordered(),
            documentation = "native",
        },
        sources = {
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
            { name = "ultisnips" },
            { name = "buffer" },
            { name = "path" },
            { name = "treesitter" },
            -- { name = "luasnip" },
            -- { name = "spell" },
            -- { name = "emoji" },
            -- { name = "calc" },
        },
        documentation = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:TelescopeBorder",
        },
    })

    -- Use buffer source for `/`
    cmp.setup.cmdline("/", {
        sources = {
            { name = "buffer" },
        },
    })

    -- Use cmdline & path source for ':'
    cmp.setup.cmdline(":", {
        sources = cmp.config.sources({
            { name = "path" },
        }, {
                { name = "cmdline" },
            }),
    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
        { name = 'buffer' },
        })
    })

    -- Auto pairs
    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
end

return M
