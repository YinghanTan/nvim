local status_ok, nvim_notify = pcall(require, "notify")
if not status_ok then
    return
end
nvim_notify.setup {
    stages = "fade",
    background_colour = 'FloatShadow',
    timeout = 3000,
}
vim.notify = nvim_notify

