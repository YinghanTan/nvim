local status_ok, lualine = pcall(require, "lualine")

lualine.setup({
    options = {
        icons_enabled = true,
        theme = 'auto', -- auto is a special theme. It will automatically load theme for your colorscheme. If there's no theme available for your colorscheme then it'll try it's best to generate one.
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            -- Filetypes to disable lualine for. --
            statusline = {}, -- only ignores the ft for statusline.
            winbar = {},     -- only ignores the ft for winbar.
        },
        ignore_focus = {},
        -- If current filetype is in this list it'll
        -- always be drawn as inactive statusline
        -- and the last window will be drawn as active statusline.
        -- for example if you don't want statusline of
        -- your file tree / sidebar window to have active
        -- statusline you can add their filetypes here.
        always_divide_middle = true,
        -- When set to true, left sections i.e. 'a','b' and 'c'
        -- can't take over the entire statusline even
        -- if neither of 'x', 'y' or 'z' are present.
        globalstatus = false,
        -- enable global statusline (have a single statusline
        -- at bottom of neovim instead of one for  every window).
        -- This feature is only available in neovim 0.7 and higher.
        refresh = {
            -- sets how often lualine should refresh it's contents (in ms) --
            statusline = 1000,
            tabline = 1000,
            winbar = 1000
            -- The refresh option sets minimum time that lualine tries
            -- to maintain between refresh. It's not guarantied if situation
            -- arises that lualine needs to refresh itself before this time
            -- it'll do it.
            -- Also you can force lualine's refresh by calling refresh function
            -- like require('lualine').refresh()
        }
    },
    sections = {
        lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 1) end }, },
        lualine_b = { 'branch', 'diff', 'diagnostics', },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {
        'quickfix', 'fugitive', 'fzf', 'neo-tree', 'nerdtree', 'toggleterm', 'nvim-dap-ui', 'man'
    }
})
