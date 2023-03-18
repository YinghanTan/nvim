local status_ok, nvim_web_devicons = pcall(require, "nvim-web-devicons")

nvim_web_devicons.setup({
    -- your personal icons can go here (to override)
    -- you can specify color or cterm_color instead of specifying both of them
    -- DevIcon will be appended to `name`
    color_icons = true,
})
