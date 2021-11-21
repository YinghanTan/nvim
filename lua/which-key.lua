require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
}

local wk = require("which-key")
-- wk.register(mappings, opts)
wk.register({
    ["<leader>/"] = {':let @/ = ""', 'Clear highlight'},
    ["<leader>."] = {':e $MYVIMRC', 'init.vim'},
    ["<leader>;"] = {':Commands', 'commands'},
    ["<leader>T"] = {':TSHighlightCapturesUnderCursor', 'treesitter highlight'}
})

wk.register({
    d = {
        name = "+debug", -- optional group name
        b = {'<Plug>VimspectorToggleBreakpoint', 'breakpoint'},
        c = {'<Plug>VimspectorContinue | zz', 'continue'},
        C = {'<Plug>VimspectorRunToCursor | zz', 'run to cursor'},
        D = {':call vimspector#Launch()<CR>', 'debug'},
        e = {':VimspectorEval', 'evaluate'},
        i = {'<Plug>VimspectorBalloonEval', 'inspect'},
        n = {'<Plug>VimspectorStepOver | zz', 'next'},
        s = {'<Plug>VimspectorStepInto | zz', 'step into'},
        S = {'<Plug>VimspectorStepOut | zz', 'step out'},
        u = {'<Plug>VimspectorUpFrame', 'Up frame'},
        d = {'<Plug>VimspectorDownFrame', 'Down frame'},
        p = {'<Plug>VimspectorPause', 'pause'},
        P = {'<Plug>VimspectorStop', 'stoP'},
        r = {'<Plug>VimspectorRestart', 'restart'},
        R = {'VimspectorReset', 'Reset'},
        w = {':call AddToWatch()<CR>', 'add to watch'},
        z = {':MaximizerToggle', 'maximize window'}
    }

}, {prefix = "<leader>"})
