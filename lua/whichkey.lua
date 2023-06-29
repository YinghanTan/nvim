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
        m = { "<plug>MarkdownPreviewToggle", "toggle markdown " },
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
        ["b"] = { "<plug>VimspectorToggleBreakpoint", "breakpoint" },
        ["B"] = {
            name = "breakpoint",
            ["c"] = { "<plug>VimspectorToggleConditionalBreakpoint", "conditional break" },
            ["d"] = { "<cmd>call vimspector#ClearBreakpoints()", "remove all break" },
            ["f"] = { "<plug>VimspectorAddFunctionBreakpoint", "func breakpoint" },
        },
        ["c"] = { "<plug>VimspectorContinue | zz", "continue" },
        ["C"] = { "<plug>VimspectorRunToCursor | zz", "cursor" },
        ["d"] = { "<cmd>call vimspector#Launch()<cr>", "debug" },
        ["D"] = { "<cmd>VimspectorReset<cr>", "reset" },
        ["e"] = { "<cmd>VimspectorEval<cr>", "Evaluate" },
        ["i"] = { "<plug>VimspectorBalloonEval", "inspect" },
        ["n"] = { "<plug>VimspectorStepOver | zz", "next" },
        ["o"] = { "<cmd>VimspectorShowOutput<cr>", "output" },
        ["s"] = { "<plug>VimspectorStepInto | zz", "step into" },
        ["S"] = { "<plug>VimspectorStepOut | zz", "step out" },
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
        ["j"] = { "<plug>VimspectorDownFrame", "down frame" },
        ["k"] = { "<plug>VimspectorUpFrame", "up frame" },
        ["p"] = { "<plug>VimspectorPause", "pause" },
        ["P"] = { "<plug>VimspectorStop", "stop" },
        ["r"] = { "<plug>VimspectorRestart", "restart" },
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
        c = { "<cmd>BCommits<cr>", "commits" },
        C = { "<cmd>Commits<cr>", "all commits" },
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
            -- a = { "<cmd>FzfPreviewGitActions<cr>", "actions" },
            ["b"] = { "<cmd>Telescope git_branches<cr>", "branch" },
            ["c"] = { "<cmd>BCommits<cr>", "commits" },
            ["C"] = { "<cmd>Commits<cr>", "all commits" },
            ["f"] = { "<cmd>GFiles<cr>", "gfiles" },
            -- ["s"] = { "<cmd>GFiles?<cr>", "gstatus" },
            s = { "<cmd>Telescope git_status<cr>", "status" },
            S = { "<cmd>Telescope git_stash<cr>", "stash" },
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
        ["a"] = { "<plug>(coc-codeaction-cursor)", "line action" },
        ["A"] = { "<plug>(coc-codeaction-source)", "file action" },
        ["c"] = { "<cmd>CocCommand rest-client.request<cr>", "api client" },
        ["f"] = { "<plug>(coc-format)", "format file" },
        ["F"] = { "<plug>(coc-fix-current)", "fix diagnostics" },
        ["i"] = { "<C-u><cmd>CocList diagnostics<cr>", "diagnostics" },
        ["o"] = { "<C-u><cmd>CocList outline<cr>", "outline" },
        ["O"] = { "<cmd>call CocAction('runCommand', 'editor.action.organizeImport')<cr>", "organise imports" },
        ["r"] = { "<plug>(coc-rename)", "rename" },
        ["R"] = { "<plug>(coc-refactor)", "refactor" },
        ["s"] = { "<cmd>Telescope coc document_symbols<cr>", "document symbols" },
        ["S"] = { "<cmd>Telescope coc workspace_symbols<cr>", "workspace symbols" },
        l = {
            name = "lsp options",

            [":"] = { "<cmd>Telescope coc commands<cr>", "commands" },
            ["/"] = { "<cmd>Telescope coc<cr>", "all coc" },

            ["a"] = { "<cmd>Telescope coc line_code_actions<cr>", "line actions" },
            ["A"] = { "<cmd>Telescope coc code_actions<cr>", "actions" },
            ["f"] = { "<cmd>Telescope coc file_code_actions<cr>", "file actions" },
            ["d"] = { "<cmd>Telescope coc definitions<cr>", "definitions" },
            ["D"] = { "<cmd>Telescope coc declarations<cr>", "declarations" },
            ["i"] = { "<cmd>Telescope coc diagnostics<cr>", "diagnostics" },
            ["I"] = { "<cmd>Telescope coc workspace_diagnostics<cr>", "all diagnostics" },
            ["l"] = { "<cmd>Telescope coc locations<cr>", "locations" },
            ["L"] = { "<cmd>Telescope coc links<cr>", "links" },
            ["s"] = { "<cmd>Telescope coc document_symbols<cr>", "document symbols" },
            ["S"] = { "<cmd>Telescope coc workspace_symbols<cr>", "workspace symbols" },
            ["r"] = { "<cmd>Telescope coc references<cr>", "references" },
            ["Y"] = { "<cmd>Telescope coc implementations<cr>", "implementations" },
            ["y"] = { "<cmd>Telescope coc type_definitions<cr>", "type" },

            ["R"] = { "<cmd>CocRestart<cr>", "restart" },
            ["u"] = { "<cmd>CocUpdate<cr>", "update" },
            ["o"] = { "<cmd>CocEnable<cr>", "open" },
            ["O"] = { "<cmd>CocDisable<cr>", "close" },
            ["e"] = { "<C-u><cmd>CocList extensions<cr>", "extensions" },
        },
        L = { "<cmd><cr>", "lint" },
    },
    q = {
        name = "quickfix",
        i = { "<cmd>CocDiagnostics<cr>", "diagnostics to quickfix" },
        D = { "<cmd>Todo<cr>", "todo to quickfix" },
        q = { "<cmd>call ToggleQuickfixList()<cr>", "toggle quickfix" },
        l = { "<cmd>call ToggleLocationList()<cr>", "toggle location list" },
    },
    -- Use unimpaired shortcuts instead [q ]q [l ]l
    s = {
        name = "search",
        ['h'] = {
            name = "history",
            ["/"] = { "<cmd>History/<cr>", "search history" },
            [":"] = { "<cmd>History:<cr>", "command history" },
            [";"] = { "<cmd>Telescope changes<cr>", "change history" },
            ["f"] = { "<cmd>History<cr>", "file history" },
            ["q"] = { "<cmd>lua require('telescope.builtin').quickfixhistory()<cr>", "quickfix" },
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
        M = { "<cmd>Telescope man_pages<cr>", "man pages" },
        p = { "<cmd>lua require('telescope').extensions.repo.list{}<cr>", "repo" },
        ["C"] = { "<cmd>Telescope command_palette<cr>", "command" },
        ["B"] = { "<cmd>lua require('telescope').extensions.bookmarks.bookmarks()<cr>", "Bookmarks" },

        ["d"] = { "<cmd>lua require('telescope').extensions.vimspector.configurations()<cr>", "debug" },
        ["D"] = { "<cmd>TodoTelescope<cr>", "toDos" },

        ["e"] = { "<cmd>Telescope env<cr>", "env" },
        E = { "<cmd>Telescope spell_suggest<cr>", "spell" },
        ["F"] = { "<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>", "file browser" },
        ["f"] = { "<cmd>Files<cr>", "find file" },
        ["g"] = {
            name = "Git",
            -- ["a"] = { "<cmd>FzfPreviewGitActions<cr>", "actions" },
            ["b"] = { "<cmd>Telescope git_branches<cr>", "branch" },
            ["c"] = { "<cmd>BCommits<cr>", "commits" },
            ["C"] = { "<cmd>Commits<cr>", "all commits" },
            ["f"] = { "<cmd>GFiles<cr>", "gfiles" },
            -- ["s"] = { "<cmd>GFiles?<cr>", "gstatus" },
            s = { "<cmd>Telescope git_status<cr>", "status" },
            S = { "<cmd>Telescope git_stash<cr>", "stash" },
            -- c = { "<cmd>Telescope conventional_commits<cr>", "conventional commit" },
        },
        j = { "<cmd>Telescope jumplist<cr>", "jumplist" },
        k = { "<cmd>Telescope keymaps<cr>", "keymaps" },
        ["l"] = {
            name = "lsp",
            [":"] = { "<cmd>Telescope coc commands<cr>", "commands" },
            ["/"] = { "<cmd>Telescope coc<cr>", "all coc" },
            ["a"] = { "<cmd>Telescope coc line_code_actions<cr>", "line actions" },
            ["A"] = { "<cmd>Telescope coc code_actions<cr>", "actions" },
            ["f"] = { "<cmd>Telescope coc file_code_actions<cr>", "file actions" },
            ["d"] = { "<cmd>Telescope coc definitions<cr>", "definitions" },
            ["D"] = { "<cmd>Telescope coc declarations<cr>", "declarations" },
            ["i"] = { "<cmd>Telescope coc diagnostics<cr>", "diagnostics" },
            ["I"] = { "<cmd>Telescope coc workspace_diagnostics<cr>", "all diagnostics" },
            ["l"] = { "<cmd>Telescope coc locations<cr>", "locations" },
            ["L"] = { "<cmd>Telescope coc links<cr>", "links" },
            ["s"] = { "<cmd>Telescope coc document_symbols<cr>", "document symbols" },
            ["S"] = { "<cmd>Telescope coc workspace_symbols<cr>", "workspace symbols" },
            ["r"] = { "<cmd>Telescope coc references<cr>", "references" },
            ["Y"] = { "<cmd>Telescope coc implementations<cr>", "implementations" },
            ["y"] = { "<cmd>Telescope coc type_definitions<cr>", "type" },
        },
        ["m"] = { "<cmd>Marks<cr>", "marks" },
        ["n"] = { "<cmd>Files ~/vimwiki/notes<cr>", "find notes" },
        ["N"] = { "<cmd>GrepNotes<cr>", "note text" },
        ["q"] = {
            name = "quickfix",
            ["l"] = { "<cmd>lua require('telescope.builtin').loclist()<cr>", "location list" },
            ["q"] = { "<cmd>lua require('telescope.builtin').quickfix()<cr>", "quickfix list" }
        },
        ["r"] = { "<cmd>Telescope registers<cr>", "Registers" },
        ["s"] = { "<cmd>CocList snippets<cr>", "snippets" },
        ["S"] = { "<cmd>Snippets<cr>", "snippets" },
        ["T"] = { "<cmd>Colors<cr>", "theme" },
        ["t"] = { "<cmd>RG<cr>", "search text" },
        ["u"] = { "<cmd>Telescope undo<cr>", "undo" },
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
        a = { "<plug>(coc-codeaction-selected)", "codeaction selected" },
        f = { "<plug>(coc-format-selected)", "format selected" },
        r = { "<plug>(coc-codeaction-refactor-selected)", "refactor selected" },
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
        a = { "<plug>(coc-codeaction-selected)", "selected action" },
        r = { "<cmd>call UltiSnips#RefreshSnippets()<cr>", "refresh" },
    },
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(y_mappings, y_opts)
which_key.register(vmappings, vopts)
