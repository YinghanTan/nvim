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
        --most people should not need to change this
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
        -- p = { "yop", "scratchPad" },
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
        -- f = { "<cmd>diffget //2<cr>", "diffget left hunk" },
        -- j = { "<cmd>diffget //3<cr>", "diffget right hunk" },
        s = {
            name = "Search",
            b = { "<cmd>lua require('fzf-lua').git_branches()<cr>", "branches" },
            c = { "<cmd>lua require('fzf-lua').git_bcommits()<cr>", "commits" },
            C = { "<cmd>lua require('fzf-lua').git_commits()<cr>", "all commits" },
            f = { "<cmd>lua require('fzf-lua').git_files()<cr>", "gfiles" },
            s = { "<cmd>lua require('fzf-lua').git_status()<cr>", "gstatus" },
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
    A = { "<plug>(coc-codeaction-selected)<cr>", "selected action" },
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
    -- l = { -- Neovim builtin LSP
    --     name = "lsp / latex",
    --     ["."] = { "<cmd>CocConfig<cr>", "config" },
    --     a = { "<plug>(coc-codeaction)<cr>", "line action" },
    --     A = { "<plug>(coc-codeaction-selected)<cr>", "selected action" },
    --     c = { "<cmd>CocCommand rest-client.request<cr>", "api client" },
    --     f = { "<plug>(coc-format)<cr>", "format" },
    --     F = { "<plug>(coc-format-selected)<cr>", "format selected" },
    --     i = { "<cmd>CocCommand fzf-preview.CocCurrentDiagnostics<cr>", "diagnostics" },
    --     I = { "<cmd>CocCommand fzf-preview.CocDiagnostics<cr>", "all diagnostics" },
    --     o = { "<cmd>call CocAction('runCommand', 'editor.action.organizeImport')<cr>", "organise imports" },
    --     -- r = { "<plug>(coc-rename)<cr>", "rename" },
    --     r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "rename" },
    --     R = { "<plug>(coc-refactor)<cr>", "refactor" },
    --     q = { "<plug>(coc-fix-current)<cr>", "coc quick fix" },
    -- 	l = {
    --         name = "lsp options",
    -- 		a = { "<cmd>CocFzfList -I symbols<cr>", "all coc" },
    --         [";"] = { "<cmd>CocFzfList commands<cr>", "commands" },
    -- 		i = { "<cmd>LspInfo<cr>", "all coc" },
    -- 		r = { "<cmd>LspRestart<cr>", "restart" },
    -- 		u = { "<cmd>CocUpdate<cr>", "update" },
    -- 		o = { "<cmd>CocEnable<cr>", "open" },
    -- 		O = { "<cmd>CocDisable<cr>", "close" },
    -- 		e = { "<cmd>CocFzfList extensions<cr>", "extensions" },
    -- 	},
    -- 	t = {
    --         name = "latex",
    -- 		c = { "<cmd>CocFzfList -I symbols<cr>", "latex info" },
    -- 		e = { "<cmd>CocFzfList -I symbols<cr>", "latex compile" },
    -- 	},
    -- },
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

        -- f = { "<cmd>lua require('utils.finder').find_files()<cr>", "Files" },
        -- :lua require('fzf-lua').files({ fzf_opts = {['--layout'] = 'reverse-list'} })
        -- :lua require'fzf-lua'.files({ prompt="LS> ", cmd = "ls", cwd="~/<folder>" })
        -- :lua require'fzf-lua'.live_grep({ cmd = "git grep --line-number --column --color=always" })
        -- :lua require'fzf-lua'.files({ prompt="LS> ", cmd = "ls", cwd="~/<folder>" })
        -- FZFLUA
        ["/"] = { "<cmd>lua require('fzf-lua').search_history()<cr>", "search history" },
        [";"] = { "<cmd>lua require('fzf-lua').command_history()<cr>", "command history" },
        ["?"] = { "<cmd>lua require('fzf-lua').help_tags()<cr>", "help" },
        ["."] = { "<cmd>lua require('fzf-lua').filetypes()<cr>", "filetypes" },
        ['b'] = {
            name = "buffer",
            ["b"] = { "<cmd>lua require('fzf-lua').buffers()<cr>", "buffers" },
            ["l"] = { "<cmd>lua require('fzf-lua').blines()<cr>", "file lines" },
            ["L"] = { "<cmd>lua require('fzf-lua').lines()<cr>", "all lines" },
        },
        ["a"] = { "<cmd>lua require('fzf-lua').args()<cr>", "argslist" },
        ["A"] = { "<cmd>lua require('fzf-lua').builtin()<cr>", "all" },
        ["B"] = { "<cmd>lua require('telescope').extensions.bookmarks.bookmarks()<cr>", "Bookmarks" },
        ["c"] = { "<cmd>Telescope command_palette<cr>", "command" },
        ["C"] = { "<cmd>lua require('fzf-lua').commands()<cr>", "commands" },
        ["d"] = { "<cmd>lua require('telescope').extensions.vimspector.configurations()<cr>", "debug" },
        ["D"] = { "<cmd>TodoTelescope<cr>", "toDos" },
        ["e"] = { "<cmd>Telescope env<cr>", "env" },
        ["E"] = { "<cmd>lua require('fzf-lua').spell_suggest()<cr>", "spell" },
        ["f"] = { "<cmd>lua require('fzf-lua-commands').fzf_find_files()<cr>", "find file" },
        ["F"] = { "<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>", "file browser" },
        ["l"] = { "<cmd>lua require('fzf-lua').loclist()<cr>", "location list" },
        ["L"] = { "<cmd>lua require('fzf-lua').loclist_stack()<cr>", "loclist stack" },
        ["o"] = { "<cmd>lua require('fzf-lua').oldfiles()<cr>", "old files" },
        i = { "<cmd>Telescope coc diagnostics<cr>", "diagnostics" },
        I = { "<cmd>Telescope coc workspace_diagnostics<cr>", "all diagnostics" },
        ["j"] = { "<cmd>lua require('fzf-lua').jumps()<cr>", "jumplist" },
        ["k"] = { "<cmd>lua require('fzf-lua').keymaps()<cr>", "keymaps" },
        ["m"] = { "<cmd>lua require('fzf-lua').marks()<cr>", "marks" },
        ["M"] = { "<cmd>lua require('fzf-lua').man_pages()<cr>", "manual" },

        ["n"] = { "<cmd>lua require('fzf-lua').files({ prompt='notes> ', cwd='~/vimwiki', show_cwd_header = true })<cr>", "find notes" },
        ["N"] = { "<cmd>lua require('fzf-lua').live_grep({ prompt='note text> ', cwd='~/vimwiki', show_cwd_header = true })<cr>", "note text" },

        p = { "<cmd>lua require('telescope').extensions.repo.list{}<cr>", "repo" },
        ["q"] = { "<cmd>lua require('fzf-lua').quickfix()<cr>", "quickfix" },
        ["Q"] = { "<cmd>lua require('fzf-lua').quickfix_stack()<cr>", "quickfix_stack" },
        ["r"] = { "<cmd>lua require('fzf-lua').registers()<cr>", "registers" },
        ["R"] = { "<cmd>lua require('fzf-lua').resume()<cr>", "resume" },
        s = { "<cmd>CocList snippets<cr>", "snippets" },
        S = { "<cmd>lua require('telescope').extensions.ultisnips.ultisnips{}<cr>", "snippets" },
        ["t"] = { "<cmd>lua require('fzf-lua').live_grep()<cr>", "search text" },
        ["T"] = { "<cmd>lua require('fzf-lua').colorschemes()<cr>", "theme" },
        ["w"] = { "<cmd>lua require('fzf-lua').tabs()<cr>", "windows" },
        v = { "<cmd>Telescope vim_options<cr>", "vim Options" },
        y = { "<cmd>lua require('telescope').extensions.neoclip.default()<cr>", "Yank Lists" },
        g = {
            name = "Git",
            b = { "<cmd>lua require('fzf-lua').git_branches()<cr>", "branches" },
            c = { "<cmd>lua require('fzf-lua').git_bcommits()<cr>", "commits" },
            C = { "<cmd>lua require('fzf-lua').git_commits()<cr>", "all commits" },
            k = { "<cmd>BCommits<cr>", "commits" },
            K = { "<cmd>Commits<cr>", "all commits" },
            f = { "<cmd>lua require('fzf-lua').git_files()<cr>", "gfiles" },
            s = { "<cmd>lua require('fzf-lua').git_status()<cr>", "gstatus" },
            S = { "<cmd>lua require('fzf-lua').git_stash()<cr>", "gstash" },
        },

        -- Telescope
        -- ["/"] = { "<cmd>Telescope search_history<cr>", "search history" },
        -- [";"] = { "<cmd>Telescope commands<cr>", "commands" },
        -- ["?"] = { "<cmd>Telescope help_tags<cr>", "help" },
        -- ["."] = { "<cmd>Telescope filetypes<cr>", "filetypes" },
        -- A = { "<cmd>Telescope builtin<cr>", "all" },
        -- b = { "<cmd>Telescope buffers<cr>", "buffers" },
        -- B = { "<cmd>lua require('telescope').extensions.bookmarks.bookmarks()<cr>", "Bookmarks" },
        -- c = { "<cmd>lua require('telescope.builtin').loclist()<cr>", "location list" },
        -- C = { "<cmd>Telescope command_palette<cr>", "command" },
        -- d = { "<cmd>lua require('telescope').extensions.vimspector.configurations()<cr>", "debug" },
        -- D = { "<cmd>TodoTelescope<cr>", "toDos" },
        -- e = { "<cmd>Telescope env<cr>", "env" },
        -- E = { "<cmd>Telescope spell_suggest<cr>", "spell" },
        -- f = { "<cmd>lua require('fzf-lua-commands').fzf_find_files()<cr>", "find file" },
        -- f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "find file" },
        -- f = { "<cmd>lua require('fzf-lua').files()<cr>", "find file" },
        -- F = { "<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>", "file browser" },
        -- h = { "<cmd>Telescope oldfiles<cr>", "files history" },
        -- H = { "<cmd>Telescope command_history<cr>", "command history" },
        -- i = { "<cmd>Telescope coc diagnostics<cr>", "diagnostics" },
        -- I = { "<cmd>Telescope coc workspace_diagnostics<cr>", "all diagnostics" },
        -- i = { "<cmd>Telescope diagnostics bufnr=0<cr>", "diagnostics" },
        -- I = { "<cmd>Telescope diagnostics<cr>", "all diagnostics" },
        -- j = { "<cmd>Telescope jumplist<cr>", "jumplist" },
        -- k = { "<cmd>Telescope keymaps<cr>", "keymaps" },
        -- L = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "BLines" },
        -- m = { "<cmd>Telescope marks<cr>", "marks" },
        -- M = { "<cmd>Telescope man_pages<cr>", "man pages" },
        -- p = { "<cmd>lua require('telescope').extensions.repo.list{}<cr>", "repo" },
        -- q = { "<cmd>lua require('telescope.builtin').quickfix()<cr>", "quickfix" },
        -- r = { "<cmd>Telescope registers<cr>", "Registers" },
        -- R = { "<cmd>Telescope resume<cr>", "Resume" },
        -- s = { "<cmd>CocList snippets<cr>", "snippets" },
        -- S = { "<cmd>lua require('telescope').extensions.ultisnips.ultisnips{}<cr>", "snippets" },
        -- t = { "<cmd>lua require('telescope.builtin').live_grep({debounce = 100, search_dirs={'.'}})<cr>", "find text" },
        -- u = { "<cmd>Telescope undo<cr>", "undo" },
        -- U = { "<cmd>Telescope colorscheme<cr>", "colorscheme" },
        -- w = { "<cmd>Telescope tele_tabby list<cr>", "windows" },
        -- v = { "<cmd>Telescope vim_options<cr>", "vim Options" },
        -- y = { "<cmd>lua require('telescope').extensions.neoclip.default()<cr>", "Yank Lists" },
        -- g = {
        --     name = "Git",
        --     k = { "<cmd>lua require('telescope.builtin').git_bcommits()<cr>", "commits" },
        --     K = { "<cmd>lua require('telescope.builtin').git_commits()<cr>", "all commits" },
        --     b = { "<cmd>Telescope git_branches<cr>", "branch" },
        --     c = { "<cmd>BCommits<cr>", "commits" },
        --     C = { "<cmd>Commits<cr>", "all commits" },
        --     f = { "<cmd>Telescope git_files<cr>", "git files" },
        --     m = { "<cmd>Telescope git_status<cr>", "modified files" },
        --     s = { "<cmd>Telescope git_stash<cr>", "stash" },
        -- },
        -- z = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "fzf file" },
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
-- which_key.register(m_mappings, m_opts)


-- something new
-- testing1234
