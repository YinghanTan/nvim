local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local setup = {
    plugins = {
        marks = true, -- shows a list of your marks on ' and ``'
        registers = true, -- shows your registers on " in NORMAL or <C-r> in InSERT mode"
        spelling = {
            enabled = true, -- enabling will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list
        },
        -- the presets plugins, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false, -- adds help for operators like d, y, ... and registers them for motion /text object completetion
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, --bindings for prefixed with g
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
		group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup,
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    window = {
        border = "rounded", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min= 20, max = 50 }, -- min and max width of the columns:
        spacing = 2, -- spacing between columns
        align = "left", --- align columns left, center or right
    },
    ignore_missing = true, -- enable this to hide mpaaing for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    trigger = "auto", --automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        --most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
    },
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = false, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap`
    nowait = true, -- use `nowait` when creating keympas
}

local m_opts = {
    mode = "n", -- NORMAL mode
    prefix = "m",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local m_mappings = {
    a = { "<cmd>BookmarkAnnotate<cr>", "annotate" },
    c = { "<cmd>BookmarkClear<cr>", "clear" },
    m = { "<cmd>BookmarkToggle<cr>", "toggle" },
    -- h = { "<cmd>BookmarkNext<cr>", "Next" },
    j = { "<cmd>BookmarkNext<cr>", "next" },
    k = { "<cmd>BookmarkPrev<cr>", "prev" },
    s = {
        "<cmd>lua require('telescope').extensions.vim_bookmarks.all({ hide_filename=false, prompt_title=\"bookmarks\", shorten_path=false })<cr>",
        "show",
    },
    x = { "<cmd>BookmarkClearAll<cr>", "clear all" },
}

local y_opts = {
    mode = "n", -- NORMAL mode
    prefix = "y",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = false, -- use `silent` when creating keymaps
    noremap = false, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
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
        m = { "<plug>MarkdownPreview<cr>", "markdown preview" },
        M = { "<plug>MarkdownPreviewStop<cr>", "markdown preview stop" },
        n = "number",
        -- p = { "yop", "scratchPad" },
        r = "relative number",
        u = "cursor column",
        v = "virtualedit",
        w = "line wrap",
        x = "crosshairs",
    },
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
		c = { "<cmd>ColorizerToggle<cr>", "colorizer" },
		C = { "<cmd>cd %:p:h<cr>:pwd<cr>", "set current dir" },
		s = { "<cmd>source $MYVIMRC<cr>", "source" },
		g = { "<cmd>IndentGuidesToggle<cr>", "indent guide" },
		p = { "<cmd>Codi<cr>", "scratchpad" },
		P = { "<cmd>Codi!<cr>", "scratchpad" },
		m = { "<plug>MarkdownPreview<cr>", "markdown preview" },
		M = { "<plug>MarkdownPreviewStop<cr>", "markdown preview stop" },
		w = { "<cmd>call TrimWhitespace()<cr>", "trim whitespace" },
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
			["v"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.variables)<cr>", "variables" },
			["w"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.watches)<cr>", "watches" },
			["s"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.stack_trace)<cr>", "stack" },
			["t"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.output)<cr>", "terminal" },
			["T"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.tagpage)<cr>", "tag" },
			["c"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.code)<cr>", "code" },
			["b"] = { "<Plug>VimspectorBreakpoints<cr>", "code" },
		},
		["j"] = { "<plug>VimspectorDownFrame<cr>", "down frame" },
		["k"] = { "<plug>VimspectorUpFrame<cr>", "up frame" },
		["p"] = { "<plug>VimspectorPause<cr>", "pause" },
		["P"] = { "<plug>VimspectorStop<cr>", "stop" },
		["r"] = { "<plug>VimspectorRestart<cr>", "restart" },
		["w"] = { "<cmd>call AddToWatch()<cr>", "add to watch" },
		["z"] = { "<cmd>NeoZoomToggle<CR>", "maximize window" },
	},
    f = {
        name = "file",
        t = {"<cmd>NERDTreeToggle<cr>", "filetree" },
        b = {"<cmd>NERDTreeFromBookmark<cr>", "bookmark" },
        f = {"<cmd>NERDTreeFind<cr>", "find" },
        r = {
            name = "replace",
            f = {"<cmd>Farr --source=vimgrep<cr>", "in file" },
            p = {"<cmd>Farr --source=rgnvim<cr>", "in project" },
        },
    },
	g = {
		name = "git",
		b = { "<cmd>Git blame<cr>", "blame" },
		B = { "<cmd>GBrowse<cr>", "browse" },
		-- c = { "<cmd>Telescope git_bcommits<cr>", "buffer commits" }, -- edit commit message to show branch author and date
		-- C = { "<cmd>Telescope git_commits<cr>", "all commits" }, -- edit commit message to show branch author and date
        c = { "<cmd>BCommits<cr>", "commits" },
        C = { "<cmd>Commits<cr>", "all commits" },
		d = {
			name = "diff",
			["d"] = { "<cmd>Gdiff<cr>", "diff" },
			["s"] = { "<cmd>Gdiffsplit<cr>", "split" },
			["i"] = { "<cmd>CocCommand git.diffCached<cr>", "info" }, -- todo: ???
			["u"] = { "<cmd>diffupdate<cr>", "update" },
		},
		e = { ":Gedit ", "gedit" }, -- todo: show in cmd input without running :
		g = {
			name = "gutter",
			u = { "<cmd>CocCommand git.chunkUndo<cr>", "undo hunk" },
			i = { "<cmd>CocCommand git.chunkInfo<cr>", "hunk info" },
			t = { "<cmd>CocCommand git.toggleGutters<cr>", "toggle gutter" },
			s = { "<cmd>CocCommand git.chunkStage<cr>", "stage hunk" },
			z = { "<cmd>CocCommand git.foldUnchanged<cr>", "fold unchanged" },
		},
		G = { "<cmd>FloatermNew lazygit<CR>", "gui" },
		h = { "<cmd>0Gclog<cr>", "file history" },
		l = { "<cmd>Git log --oneline<cr>", "Log" },
		L = { "<cmd>Git log<cr>", "Log long" },
		m = { "<plug>(git-messenger)<cr>", "messenger" },
		p = { "<cmd>GGrep<cr>", "Grep" },
		r = { "<cmd>GDelete<cr>", "remove" },
		v = { "<cmd>GV!<cr>", "file commits" },
		V = { "<cmd>GV<cr>", "all commits" },
		f = { "<cmd>diffget //2<cr>", "diffget left hunk" },
		j = { "<cmd>diffget //3<cr>", "diffget right hunk" },
		s = {
            name = "Search",
			b = { "<cmd>Telescope git_branches<cr>", "Branches" },
            s = { "<cmd>Telescope git_status<cr>", "Status" },
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
        name = "lsp / latex",
        ["."] = { "<cmd>CocConfig<cr>", "config" },
        a = { "<plug>(coc-codeaction)<cr>", "line action" },
        A = { "<plug>(coc-codeaction-selected)<cr>", "selected action" },
        c = { "<cmd>CocCommand rest-client.request<cr>", "api client" },
        f = { "<plug>(coc-format)<cr>", "format" },
        F = { "<plug>(coc-format-selected)<cr>", "format selected" },
        i = { "<cmd>CocCommand fzf-preview.CocCurrentDiagnostics<cr>", "diagnostics" },
        I = { "<cmd>CocCommand fzf-preview.CocDiagnostics<cr>", "all diagnostics" },
        o = { "<cmd>call CocAction('runCommand', 'editor.action.organizeImport')<cr>", "organise imports" },
        r = { "<plug>(coc-rename)<cr>", "rename" },
        R = { "<plug>(coc-refactor)<cr>", "refactor" },
        q = { "<plug>(coc-fix-current)<cr>", "coc quick fix" },
		l = {
            name = "lsp options",
			a = { "<cmd>CocFzfList -I symbols<cr>", "all coc" },
            [";"] = { "<cmd>CocFzfList commands<cr>", "commands" },
			r = { "<cmd>CocRestart<cr>", "restart" },
			u = { "<cmd>CocUpdate<cr>", "update" },
			o = { "<cmd>CocEnable<cr>", "open" },
			O = { "<cmd>CocDisable<cr>", "close" },
			e = { "<cmd>CocFzfList extensions<cr>", "extensions" },
		},
		t = {
            name = "latex",
			c = { "<cmd>CocFzfList -I symbols<cr>", "latex info" },
			e = { "<cmd>CocFzfList -I symbols<cr>", "latex compile" },
		},
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
		["/"] = { "<cmd>Telescope search_history<cr>", "search history" },
		[";"] = { "<cmd>Telescope commands<cr>", "commands" },
		["?"] = { "<cmd>Telescope help_tags<cr>", "help" },
		["."] = { "<cmd>Telescope filetypes<cr>", "filetypes" },
		A = { "<cmd>Telescope builtin<cr>", "all" },
		b = {
			"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
			"buffers",
		},
		B = { "<cmd>Telescope bookmarks<cr>", "Bookmarks" },
		d = { "<cmd>lua require('telescope').extensions.vimspector.configurations()<cr>", "debug" },
		e = { "<cmd>Telescope env<cr>", "env" },
		E = { "<cmd>Telescope spell_suggest<cr>", "spell" },
		f = { "<cmd>Files<cr>", "find file" },
		h = { "<cmd>Telescope oldfiles<cr>", "files history" },
		H = { "<cmd>Telescope command_history<cr>", "command history" },
		-- i = { "<cmd>Telescope diagnostics bufnr=0<cr>", "diagnostics" },
		-- I = { "<cmd>Telescope diagnostics<cr>", "all diagnostics" },
		i = { "<cmd>CocCommand fzf-preview.CocCurrentDiagnostics<cr>", "diagnostics" },
		I = { "<cmd>CocCommand fzf-preview.CocDiagnostics<cr>", "all diagnostics" },
		j = { "<cmd>Telescope jumplist<cr>", "jumplist" },
		k = { "<cmd>Telescope keymaps<cr>", "keymaps" },
		m = { "<cmd>Telescope marks<cr>", "marks" },
		M = { "<cmd>Telescope man_pages<cr>", "man pages" },
		q = { "<cmd>lua require('telescope.builtin').quickfix()<cr>", "quickfix" },
		l = { "<cmd>lua require('telescope.builtin').loclist()<cr>", "loc list" },
		r = { "<cmd>Telescope registers<cr>", "Registers" },
		R = { "<cmd>Telescope resume<cr>", "Resume" },
		s = { "<cmd>CocList snippets<cr>", "snippets" },
		S = { "<cmd>lua require'telescope'.extensions.ultisnips.ultisnips{}<cr>", "snippets" },
        -- \ 's' : [':CocList snippets'                             , 'snippets'           ]    ,
		-- t = { "<cmd>Telescope live_grep theme=ivy<cr>", "find text" },
		t = { "<cmd>RG<cr>", "text" },
		T = { "<cmd>TodoTelescope<cr>", "Todos" },
		u = { "<cmd>Telescope colorscheme<cr>", "colorscheme" },
		w = { "<cmd>Telescope tele_tabby list<cr>", "windows" },
        -- \ 'w' : [':Windows'                                      , 'search windows'     ]    ,
		v = { "<cmd>Telescope vim_options<cr>", "vim Options" },
		y = { "<cmd>CocFzfList yank<cr>", "yank Lists" },
		-- y = { "<cmd>Telescope neoclip<cr>", "Yank Lists" },
		g = {
			name = "Git",
			b = { "<cmd>Telescope git_branches<cr>", "branch" },
			-- c = { "<cmd>Telescope git_bcommits<cr>", "commits" },
			-- C = { "<cmd>Telescope git_commits<cr>", "all commits" },
			c = { "<cmd>BCommits<cr>", "commits" },
			C = { "<cmd>Commits<cr>", "all commits" },
			f = { "<cmd>Telescope git_files<cr>", "git files" },
			m = { "<cmd>Telescope git_status<cr>", "modified files" },
			s = { "<cmd>Telescope git_stash<cr>", "stash" },
		},
		z = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "fzf file" },
	},
	-- s = {
	-- 	name = "search",
	-- 	["/"] = { "<cmd>Telescope search_history<cr>", "search history" },
	-- 	[";"] = { "<cmd>Telescope commands<cr>", "commands" },
	-- 	["?"] = { "<cmd>Telescope help_tags<cr>", "help" },
	-- 	["."] = { "<cmd>Telescope filetypes<cr>", "filetypes" },
	-- 	A = { "<cmd>Telescope builtin<cr>", "all" },
	-- 	b = {
	-- 		"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
	-- 		"buffers",
	-- 	},
	-- 	B = { "<cmd>Telescope bookmarks<cr>", "Bookmarks" },
	-- 	d = { "<cmd>lua require('telescope').extensions.vimspector.configurations()<cr>", "debug" },
	-- 	e = { "<cmd>Telescope env<cr>", "env" },
	-- 	E = { "<cmd>Telescope spell_suggest<cr>", "spell" },
	-- 	f = { "<cmd>Telescope find_files<cr>", "find file" },
	-- 	h = { "<cmd>Telescope oldfiles<cr>", "files history" },
	-- 	H = { "<cmd>Telescope command_history<cr>", "command history" },
	-- 	i = { "<cmd>Telescope diagnostics bufnr=0<cr>", "diagnostics" },
	-- 	I = { "<cmd>Telescope diagnostics<cr>", "all diagnostics" },
	-- 	-- i = { "<cmd>CocCommand fzf-preview.CocCurrentDiagnostics<cr>", "diagnostics" },
	-- 	-- I = { "<cmd>CocCommand fzf-preview.CocDiagnostics<cr>", "all diagnostics" },
	-- 	j = { "<cmd>Telescope jumplist<cr>", "jumplist" },
	-- 	k = { "<cmd>Telescope keymaps<cr>", "keymaps" },
	-- 	m = { "<cmd>Telescope marks<cr>", "marks" },
	-- 	M = { "<cmd>Telescope man_pages<cr>", "man pages" },
	-- 	q = { "<cmd>lua require('telescope.builtin').quickfix()<cr>", "quickfix" },
	-- 	l = { "<cmd>lua require('telescope.builtin').loclist()<cr>", "loc list" },
	-- 	r = { "<cmd>Telescope registers<cr>", "Registers" },
	-- 	R = { "<cmd>Telescope resume<cr>", "Resume" },
	-- 	s = { "<cmd>CocList snippets<cr>", "snippets" },
	-- 	S = { "<cmd>lua require'telescope'.extensions.ultisnips.ultisnips{}<cr>", "snippets" },
    --     -- \ 's' : [':CocList snippets'                             , 'snippets'           ]    ,
	-- 	t = { "<cmd>Telescope live_grep theme=ivy<cr>", "find text" },
	-- 	T = { "<cmd>TodoTelescope<cr>", "Todos" },
	-- 	u = { "<cmd>Telescope colorscheme<cr>", "colorscheme" },
	-- 	w = { "<cmd>Telescope tele_tabby list<cr>", "windows" },
    --     -- \ 'w' : [':Windows'                                      , 'search windows'     ]    ,
	-- 	v = { "<cmd>Telescope vim_options<cr>", "vim Options" },
	-- 	y = { "<cmd>CocFzfList yank<cr>", "yank Lists" },
	-- 	-- y = { "<cmd>Telescope neoclip<cr>", "Yank Lists" },
	-- 	g = {
	-- 		name = "Git",
	-- 		b = { "<cmd>Telescope git_branches<cr>", "branch" },
	-- 		c = { "<cmd>Telescope git_bcommits<cr>", "commits" },
	-- 		C = { "<cmd>Telescope git_commits<cr>", "all commits" },
	-- 		f = { "<cmd>Telescope git_files<cr>", "git files" },
	-- 		m = { "<cmd>Telescope git_status<cr>", "modified files" },
	-- 		s = { "<cmd>Telescope git_stash<cr>", "stash" },
	-- 	},
	-- 	z = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "fzf file" },
	-- },
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
			name = "tab",
			["<Left>"] = { "<cmd>tabm -1<cr>", "<= Tab" },
			["<Right>"] = { "<cmd>tabm +1<cr>", "=> Tab" },
			["n"] = { "<cmd>tabnew<cr>", "new tab" },
			["c"] = { "<cmd>tabnew | terminal<cr>", "new tab" },
			["%"] = { "<cmd>tabedit %<cr>", "file in new tab" },
			["i"] = { "<cmd>tabnew | terminal ipython<cr>", "ipython" },
		},
	},
	T = {
		name = "treesitter",
		h = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "Highlight" },
		p = { "<cmd>TSPlaygroundToggle<cr>", "Playground" },
	},
	u = {
		name = "ultisnips / undo",
		e = { "<cmd>CocCommand snippets.editSnippets<cr>", "Ultisnips Edit" },
		f = { "<cmd>CocCommand snippets.openSnippetFiles<cr>", "Ultisnips Files" },
		s = { "<cmd>CocList snippets<cr>", "Ultisnips Snippets" },
		t = { "<cmd>UndotreeToggle<cr>", "UndoTree" },
	},
	w = {
        -- Wiki
		name = "Wiki",
		w = "Wiki Index",
		t = "Tab",
		T = { "<cmd>VimwikiTable<cr>", "vimwikiTable" },
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

-- local vopts = {
--     mode = "v", -- VISUAL mode
--     prefix = "<leader>",
--     buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--     silent = true, -- use `silent` when creating keymaps
--     noremap = true, -- use `noremap` when creating keymaps
--     nowait = true, -- use `nowait` when creating keymaps
-- }

-- local vmappings = {
--     ["/"] = { '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', "Comment"},
-- }

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(y_mappings, y_opts)
-- which_key.register(vmappings, vopts)
-- which_key.register(m_mappings, m_opts)
