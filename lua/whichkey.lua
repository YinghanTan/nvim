local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local setup = {
    plugins = {
        marks = true, -- shows a list of your marks on ' and ``'
        registers - true, -- shows your registers on " in NORMAL or <C-r> in InSERT mode"
        spelling = {
            enabled = true, --
        },
    },
}
