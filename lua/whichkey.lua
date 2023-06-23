local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local setup = {
    plugins = {
        marks = true,         -- shows a list of your marks on ' and ``'
        registers = true,     -- shows your registers on " in NORMAL or <C-r> in InSERT mode"
        spelling = {
            enabled = true,   -- enabling will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list
        },
        -- the presets plugins, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false,   -- adds help for operators like d, y, ... and registers them for motion /text object completetion
            motions = true,      -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true,      -- misc bindings to work with windows
            z = true,            -- bindings for folds, spelling and others prefixed with z
            g = true,            --bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    -- operators = { gc = "Comments" }
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC"
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+",      -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup,
        scroll_up = "<c-u>",   -- binding to scroll up inside the popup
    },
    window = {
        border = "rounded",       -- none, single, double, shadow
        position = "bottom",      -- bottom, top
        margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
        padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },
    layout = {
        height = { min = 4, max = 25 },                                           -- min and max height of the columns
        width = { min = 20, max = 50 },                                           -- min and max width of the columns:
        spacing = 2,                                                              -- spacing between columns
        align = "left",                                                           --- align columns left, center or right
    },
    ignore_missing = true,                                                        -- enable this to hide mpaaing for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true,                                                             -- show help message on the command line when the popup is visible
    trigger = "auto",                                                             --automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
    },
}


local y_opts = {
    mode = "n",      -- NORMAL mode
    prefix = "y",
    buffer = nil,    -- Global mappings. Specify a buffer number for buffer local mappings
    silent = false,  -- use `silent` when creating keymaps
    noremap = false, -- use `noremap` when creating keymaps
    nowait = true,   -- use `nowait` when creating keymaps
}

local y_mappings = {
    o = {
        name = "toggle",
        b = "background",
        d = "diff",
        e = "spell",
        c = "cursorline",
        C = { "<cmd>ColorizerToggle<cr>", "colorizer" },
        g = { "<cmd>IndentGuidesToggle<cr>", "indent guide" },
        h = "hlsearch",
        i = "ignorecase",
        l = "list char",
        m = { "<plug>MarkdownPreviewToggle<cr>", "toggle markdown " },
        n = "number",
        p = { "<cmd>call TogglePaste()<cr>", "toggle paste" },
        r = "relative number",
        u = "cursor column",
        v = "virtualedit",
        w = "line wrap",
        x = "crosshairs",
    },
}


local opts = {
    mode = "n",     -- NORMAL mode
    prefix = "<leader>",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = false, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap`
    nowait = true,  -- use `nowait` when creating keympas
}

local mappings = {
    ["/"] = { "<cmd>nohlsearch<cr>", "clear highlight" },
    ["."] = { "<cmd>e $MYVIMRC<cr>", "open init" },
    [";"] = { "<cmd>Telescope commands<CR>", "commands" },
    ["\\"] = {
        name = "nav",
        f = { "<cmd>HopChar2<cr>", "Find" },
        w = { "<cmd>HopWord<cr>", "Word" },
        l = { "<cmd>HopLineStart<cr>", "Line" },
    },
    a = {
        name = "action",
        d = { "<cmd>cd %:p:h<cr>:pwd<cr>", "set current dir" },
        s = { "<cmd>source $MYVIMRC<cr>", "source" },
        w = { "<cmd>call TrimWhitespace()<cr>", "trim whitespace" },

    },
    c = {
        name = "context",
        f = { "<cmd>lua ContextSetup(true)<CR>", "ContextSetup" },
        p = { "<cmd>lua ContextSetup(false)<cr>", "ContextSetup" },
    },
    d = {
        name = "debug",
        ["b"] = { "<plug>VimspectorToggleBreakpoint<cr>", "breakpoint" },
        ["B"] = {
            name = "breakpoint",
            ["c"] = { "<plug>VimspectorToggleConditionalBreakpoint<cr>", "conditional break" },
            ["d"] = { "<cmd>call vimspector#ClearBreakpoints()<cr>", "remove all break" },
            ["f"] = { "<plug>VimspectorAddFunctionBreakpoint<cr>", "func breakpoint" },
        },
        ["c"] = { "<plug>VimspectorContinue | zz<cr>", "continue" },
        ["C"] = { "<plug>VimspectorRunToCursor | zz<cr>", "cursor" },
        ["d"] = { "<cmd>call vimspector#Launch()<cr>", "debug" },
        ["D"] = { "<cmd>VimspectorReset<cr>", "reset" },
        ["e"] = { "<cmd>VimspectorEval<cr>", "Evaluate" },
        ["i"] = { "<plug>VimspectorBalloonEval<cr>", "inspect" },
        ["n"] = { "<plug>VimspectorStepOver | zz<cr>", "next" },
        ["o"] = { "<cmd>VimspectorShowOutput<cr>", "output" },
        ["s"] = { "<plug>VimspectorStepInto | zz<cr>", "step into" },
        ["S"] = { "<plug>VimspectorStepOut | zz<cr>", "step out" },
        ["v"] = {
            name = "view",
            ["c"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.code)<cr>", "code" },
            ["o"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.terminal)<cr>", "output" },
            ["v"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.variables)<cr>", "variables" },
            ["w"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.watches)<cr>", "watches" },
            ["s"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.stack_trace)<cr>", "stack" },
            ["t"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.output)<cr>", "terminal" },
            ["T"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.tagpage)<cr>", "tag" },
        },
        ["j"] = { "<plug>VimspectorDownFrame<cr>", "down frame" },
        ["k"] = { "<plug>VimspectorUpFrame<cr>", "up frame" },
        ["p"] = { "<plug>VimspectorPause<cr>", "pause" },
        ["P"] = { "<plug>VimspectorStop<cr>", "stop" },
        ["r"] = { "<plug>VimspectorRestart<cr>", "restart" },
        ["w"] = { "<cmd>call AddToWatch()<cr>", "add to watch" },
        ["z"] = { "<Plug>(zoom-toggle)", "zoom window" },
    },
    f = {
        name = "file",
        t = { ":NvimTreeToggle<cr>", "filetree" },
        f = { ":NvimTreeFindFileToggle<cr>", "find" },
        r = {
            name = "replace",
            f = { "<cmd>Farr --source=vimgrep<cr>", "in file" },
            p = { "<cmd>Farr --source=rgnvim<cr>", "in project" },
        },
    },
    g = {
        name = "git",
        b = { "<cmd>Git blame<cr>", "blame" },
        B = { "<cmd>GBrowse<cr>", "browse" },
        [".B"] = { "<cmd>.GBrowse<cr>", "line browse" },
        c = { "<cmd>lua require('fzf-lua').git_bcommits()<cr>", "commits" },
        C = { "<cmd>lua require('fzf-lua').git_commits()<cr>", "all commits" },
        k = { "<cmd>BCommits<cr>", "commits" },
        K = { "<cmd>Commits<cr>", "all commits" },
        d = {
            name = "diff",
            ["d"] = { "<cmd>Gdiff<cr>", "diff" },
            ["s"] = { "<cmd>Gdiffsplit<cr>", "split" },
            ["i"] = { "<cmd>CocCommand git.diffCached<cr>", "info" }, -- todo: ???
            ["u"] = { "<cmd>diffupdate<cr>", "update" },
            ["O"] = { "<cmd>diffoff!<cr>", "diffoff all" },
        },
        e = { ":Gedit ", "gedit" }, -- todo: show in cmd input without running :
        g = {
            name = "gutter",
            u = { "<cmd>Gitsigns reset_hunk<cr>", "undo hunk" },
            d = { "<cmd>Gitsigns diffthis<CR>", "diff" },
            i = { "<cmd>Gitsigns preview_hunk<CR>", "hunk info" },
            t = { "<cmd>Gitsigns toggle_signs<cr>", "toggle gutter" },
            s = { "<cmd>Gitsigns stage_hunk<cr>", "stage hunk" },
            b = { "<cmd>Gitsigns toggle_current_line_blame<CR>", "blame line" },
            z = { "<cmd>CocCommand git.foldUnchanged<cr>", "fold unchanged" },
            f = { "<cmd>diffget //2<cr>", "diffget left hunk" },
            j = { "<cmd>diffget //3<cr>", "diffget right hunk" },
        },
        G = { "<cmd>FloatermNew lazygit<CR>", "gui" },
        h = { "<cmd>0Gclog<cr>", "file history" },
        l = { "<cmd>Git log --oneline<cr>", "Log" },
        L = { "<cmd>Git log<cr>", "Log long" },
        p = { "<cmd>GGrep<cr>", "Grep" },
        r = { "<cmd>GDelete<cr>", "remove" },
        v = { "<cmd>GV!<cr>", "file commits" },
        V = { "<cmd>GV<cr>", "all commits" },
        s = {
            name = "Search",
            a = { "<cmd>FzfPreviewGitActions<cr>", "actions" },
            b = { "<cmd>lua require('fzf-lua').git_branches()<cr>", "branches" },
            c = { "<cmd>lua require('fzf-lua').git_bcommits()<cr>", "commits" },
            C = { "<cmd>lua require('fzf-lua').git_commits()<cr>", "all commits" },
            f = { "<cmd>lua require('fzf-lua').git_files()<cr>", "gfiles" },
            s = { "<cmd>FzfPreviewGitStatus<cr>", "gstatus" },
            S = { "<cmd>lua require('fzf-lua').git_stash()<cr>", "gstash" },
        },
    },
    G = {
        name = "gist",
        a = { "<cmd>Gist -b -a<cr>", "create anon" },
        d = { "<cmd>Gist -d<cr>", "delete" },
        f = { "<cmd>Gist -f<cr>", "fork" },
        g = { "<cmd>Gist -b<cr>", "create" },
        l = { "<cmd>Gist -l<cr>", "list" },
        p = { "<cmd>Gist -b -p<cr>", "create private" },
    },
    l = {
    -- COC as LSP
    name = "lsp / latex",
    ["."] = { "<cmd>CocConfig<cr>", "config" },
    a = { "<plug>(coc-codeaction)<cr>", "line action" },
    c = { "<cmd>CocCommand rest-client.request<cr>", "api client" },
    f = { "<plug>(coc-format)<cr>", "format" },
    F = { "<plug>(coc-format-selected)<cr>", "format selected" },
    i = { "<cmd>Telescope coc diagnostics<cr>", "diagnostics" },
    I = { "<cmd>Telescope coc workspace_diagnostics<cr>", "all diagnostics" },
    o = { "<cmd>call CocAction('runCommand', 'editor.action.organizeImport')<cr>", "organise imports" },
    r = { "<plug>(coc-rename)<cr>", "rename" },
    R = { "<plug>(coc-refactor)<cr>", "refactor" },
    q = { "<plug>(coc-fix-current)<cr>", "coc quick fix" },
    l = {
        name = "lsp options",
        a = { "<cmd>Telescope coc<cr>", "all coc" },
        [";"] = { "<cmd>Telescope coc commands<cr>", "commands" },
        r = { "<cmd>CocRestart<cr>", "restart" },
        u = { "<cmd>CocUpdate<cr>", "update" },
        o = { "<cmd>CocEnable<cr>", "open" },
        O = { "<cmd>CocDisable<cr>", "close" },
        e = { "<cmd>CocFzfList extensions<cr>", "extensions" },
    },
    L = { "<cmd><cr>", "lint" },
    },
    q = {
        name = "quickfix",
        g = { "<cmd>CocDiagnostics<cr>", "diagnostics to quickfix" },
        t = { "<cmd>Todo<cr>", "todo to quickfix" },
        q = { "<cmd>copen<cr>", "quickfixlist" },
        Q = { "<cmd>cclose<cr>", "close quickfixlist" },
        l = { "<cmd>lopen<cr>", "loclist" },
        L = { "<cmd>lclose<cr>", "close loclist" },
    },
    -- Use unimpaired shortcuts instead [q ]q [l ]l
    s = {
        name = "search",
        ['h'] = {
            name = "history",
            ["/"] = { "<cmd>History/<cr>", "search history" },
            [":"] = { "<cmd>History:<cr>", "command history" },
            [";"] = { "<cmd>FzfPreviewChanges<cr>", "change history" },
            ["f"] = { "<cmd>History<cr>", "file history" },
        },
        ["?"] = { "<cmd>Helptags<cr>", "help" },
        ['b'] = {
            name = "buffer",
            ["b"] = { "<cmd>Buffers<cr>", "buffers" },
            ["l"] = { "<cmd>BLines<cr>", "current file lines" },
            ["L"] = { "<cmd>Lines<cr>", "all lines" },
        },
        -- ["a"] = { "<cmd>Args<cr>", "argslist" },
        ["c"] = { "<cmd>Commands<cr>", "commands" },
        ["D"] = { "<cmd>FzfPreviewTodoComments<cr>", "todos" },
        ["f"] = { "<cmd>Files<cr>", "find file" },
        ["g"] = {
            name = "Git",
            ["a"] = { "<cmd>FzfPreviewGitActions<cr>", "actions" },
            ["b"] = { "<cmd>lua require('fzf-lua').git_branches()<cr>", "branches" },
            ["c"] = { "<cmd>BCommits<cr>", "commits" },
            ["C"] = { "<cmd>Commits<cr>", "all commits" },
            ["f"] = { "<cmd>GFiles<cr>", "gfiles" },
            ["s"] = { "<cmd>GFiles?<cr>", "gstatus" },
        },
        ["j"] = { "<cmd>FzfPreviewJumps<cr>", "jumplist" },
        ["k"] = { "<cmd>lua require('fzf-lua').keymaps()<cr>", "keymaps" },
        ["l"] = {
            name = "lsp/list",
            ["l"] = { "<cmd>FzfPreviewLocationList<cr>", "location list" },
            ["q"] = { "<cmd>FzfPreviewQuickFix<cr>", "quickfix" },
            ["r"] = { "<cmd>CocCommand fzf-preview.CocReferences<cr>", "reference" },
            ["i"] = { "<cmd>CocCommand fzf-preview.CocCurrentDiagnostics --add-fzf-arg=--preview-window='right:70%,nowrap,nocycle:nohidden'<cr>", "diagnostics" },
            ["I"] = { "<cmd>CocCommand fzf-preview.CocDiagnostics --add-fzf-arg=--preview-window='right:70%,nowrap,nocycle:nohidden'<cr>", "all diagnostics" },
            ["d"] = { "<cmd>CocCommand fzf-preview.CocDefinition<cr>", "definition" },
            ["y"] = { "<cmd>CocCommand fzf-preview.CocTypeDefinition<cr>", "type" },
            ["Y"] = { "<cmd>CocCommand fzf-preview.CocImplementations<cr>", "implementation" },
            ["o"] = { "<cmd>CocCommand fzf-preview.CocOutline<cr>", "outline" },
        },
        ["M"] = { "<cmd>lua require('fzf-lua').man_pages()<cr>", "manual" },
        ["m"] = { "<cmd>Marks<cr>", "marks" },
        ["n"] = { "<cmd>Files ~/vimwiki<cr>", "find notes" },
        ["N"] = { "<cmd>GrepNotes<cr>", "note text" },
        ["r"] = { "<cmd>lua require('fzf-lua').registers()<cr>", "registers" },
        ["s"] = { "<cmd>CocList snippets<cr>", "snippets" },
        ["S"] = { "<cmd>Snippets<cr>", "snippets" },
        ["T"] = { "<cmd>Colors<cr>", "theme" },
        ["t"] = { "<cmd>RG<cr>", "search text" },
        ["v"] = { "<cmd>Telescope vim_options<cr>", "vim Options" },
        ["w"] = { "<cmd>Windows<cr>", "windows" },
        ["y"] = { "<cmd>lua require('telescope').extensions.neoclip.default()<cr>", "Yank Lists" },
        ["Y"] = { "<cmd>Filetypes<cr>", "filetypes" },
    },
    t = {
        name = "terminal",
        f = { "<cmd>FloatermNew fzf<cr>", "fzf" },
        g = { "<cmd>FloatermNew lazygit<cr>", "git" },
        i = { "<cmd>vsplit | terminal ipython<cr>", "ipython vsplit" },
        d = { "<cmd>FloatermNew lazydocker<cr>", "docker" },
        l = { "<cmd>FloatermNew lua<cr>", "lua" },
        n = { "<cmd>FloatermNew node<cr>", "node" },
        N = { "<cmd>FloatermNew nnn<cr>", "nnn" },
        m = {
            name = "mux",
            ["P"] = { "<cmd>FloatermNew tmuxinator-fzf-start.sh<cr>", "projects" },
        },
        C = { "<cmd>FloatermNew tmux-cht.sh<cr>", "cheatsheet" },
        p = { "<cmd>FloatermNew python3<cr>", "python" },
        r = { "<cmd>RnvimrToggle<cr>", "ranger" },
        R = { "<cmd>FloatermNew ranger<cr>", "ranger" },
        c = { "<cmd>FloatermToggle<cr>", "console" },
        h = { "<cmd>FloatermNew htop<cr>", "htop" },
        u = { "<cmd>FloatermNew ncdu<cr>", "ncdu" },
        t = {
            name = "tab/treesitter",
            ["<Left>"] = { "<cmd>tabm -1<cr>", "<= Tab" },
            ["<Right>"] = { "<cmd>tabm +1<cr>", "=> Tab" },
            ["n"] = { "<cmd>tabnew<cr>", "new tab" },
            ["c"] = { "<cmd>tabnew | terminal<cr>", "new tab" },
            ["%"] = { "<cmd>tabedit %<cr>", "file in new tab" },
            ["i"] = { "<cmd>tabnew | terminal ipython<cr>", "ipython" },
            h = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "Highlight" },
            p = { "<cmd>TSPlaygroundToggle<cr>", "Playground" },
        },
    },
    u = {
        name = "ultisnips / undo",
        e = { "<cmd>CocCommand snippets.editSnippets<cr>", "Ultisnips Edit" },
        -- e = { "<cmd>:UltiSnipsEdit<cr>", "Ultisnips Edit" },
        f = { "<cmd>CocCommand snippets.openSnippetFiles<cr>", "Ultisnips Files" },
        s = { "<cmd>CocList snippets<cr>", "Ultisnips Snippets" },
        t = { "<cmd>UndotreeToggle<cr>", "UndoTree" },
        r = { "<cmd>call UltiSnips#RefreshSnippets()<cr>", "refresh" },
    },
    v = {
        name = "vim",
        e = { ":w<CR>:! ./%<CR>", "execute" },
    },
    w = {
        -- Wiki
        name = "Wiki",
        w = "Wiki Index",
        t = "Tab",
        T = { ":VimwikiTable", "vimwikiTable" },
        d = "Delete",
        r = "Rename",
        -- Diary
        i = "Diary Index",
        ["<leader>"] = {
            w = "Diary Today",
            t = "Tab Diary Today",
            i = "Update Diary Index",
        },
    },
}

local vopts = {
    mode = "v",     -- VISUAL mode
    prefix = "<leader>",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = false, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true,  -- use `nowait` when creating keymaps
}

local vmappings = {
    ["/"] = { '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', "Comment" },
    ["\\"] = {
        name = "nav",
        f = { "<cmd>HopChar2<cr>", "Find" },
        w = { "<cmd>HopWord<cr>", "Word" },
        l = { "<cmd>HopLineStart<cr>", "Line" },
    },
    l = {
        name = "lsp / latex",
        a = { "<plug>(coc-codeaction-selected)<cr>", "selected action" },
        f = { "<plug>(coc-format-selected)<cr>", "format selected" },
    },
    g = {
        name = "git",
        B = { ":GBrowse<cr>", "browse" },
    },
    c = {
        name = "coerce",
        r = { "<plug>(abolish-coerce)", "coerce" },
    },
    p = { '\"_dP', "paste keep buffer" },
    u = {
        name = "ultisnips / undo",
        e = { "<cmd>CocCommand snippets.editSnippets<cr>", "Ultisnips Edit" },
        -- e = { "<cmd>:UltiSnipsEdit<cr>", "Ultisnips Edit" },
        f = { "<cmd>CocCommand snippets.openSnippetFiles<cr>", "Ultisnips Files" },
        s = { "<cmd>CocList snippets<cr>", "Ultisnips Snippets" },
        t = { "<cmd>UndotreeToggle<cr>", "UndoTree" },
        a = { "<plug>(coc-codeaction-selected)<cr>", "selected action" },
        r = { "<cmd>call UltiSnips#RefreshSnippets()<cr>", "refresh" },
    },
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(y_mappings, y_opts)
which_key.register(vmappings, vopts)
