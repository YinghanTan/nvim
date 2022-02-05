local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list
		},
		-- the presets plugins, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, --bindings for prefixed with g
		},
	},
	-- add operators that will trigger otion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effet WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't spcify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the opoup is visible
	trigger = "auto", -- automatically setup trigers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binidng
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
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
	a = { "<cmd>BookmarkAnnotate<cr>", "Annotate" },
	c = { "<cmd>BookmarkClear<cr>", "Clear" },
	m = { "<cmd>BookmarkToggle<cr>", "Toggle" },
	-- h = { '<cmd>lua require("harpoon.mark").add_file()<cr>', "Harpoon" },
	j = { "<cmd>BookmarkNext<cr>", "Next" },
	k = { "<cmd>BookmarkPrev<cr>", "Prev" },
	s = {
		"<cmd>lua require('telescope').extensions.vim_bookmarks.all({ hide_filename=false, prompt_title=\"bookmarks\", shorten_path=false })<cr>",
		"Show",
	},
	x = { "<cmd>BookmarkClearAll<cr>", "Clear All" },
	-- u = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', "Harpoon UI" },
}

local mappings = {
	["/"] = { "<cmd>nohlsearch<cr>", "Clear highlight" },
	["."] = { "<cmd>e $MYVIMRC<cr>", "open init" },
	[";"] = { "<cmd>Telescope commands<cr>", "Commands" },
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	["c"] = { "<cmd>Bdelete!<cr>", "Close Buffer" },
	["R"] = { '<cmd>lua require("renamer").rename()<cr>', "Rename" },

	["\\"] = {
		name = "Nav",
		f = { "<cmd>HopChar2<cr>", "Find" },
		w = { "<cmd>HopWord<cr>", "Word" },
		l = { "<cmd>HopLineStart<cr>", "Line" },
	},

	a = {
		name = "Action",
		s = { "<cmd>source $MYVIMRC<cr>", "Source" },
		c = { "<cmd>ColorizerToggle<cr>", "Colorizer" },
		C = { "<cmd>cd %:p:h<cr>:pwd<cr>", "Set current dir" },
		g = { "<cmd>IndentGuidesToggle<cr>", "Indent Guide" },
		p = { "<cmd>Codi<cr>", "scratchpad" },
		P = { "<cmd>Codi!<cr>", "scratchpad" },
		m = { "<plug>MarkdownPreview<cr>", "Markdown preview" },
	},

	d = {
		name = "Debug",
		["b"] = { "<plug>VimspectorToggleBreakpoint<cr>", "Breakpoint" },
		["B"] = {
			name = "Breakpoint",
			["c"] = { "<plug>VimspectorToggleConditionalBreakpoint<cr>", "Conditional break" },
			["d"] = { "<cmd>call vimspector#ClearBreakpoints()<cr>", "Remove all break" },
			["f"] = { "<plug>VimspectorAddFunctionBreakpoint<cr>", "Func breakpoint" },
		},
		["c"] = { "<plug>VimspectorContinue | zz<cr>", "Continue" },
		["C"] = { "<plug>VimspectorRunToCursor | zz<cr>", "Cursor" },
		["d"] = { "<cmd>call vimspector#Launch()<cr>", "Debug" },
		["e"] = { "<cmd>VimspectorEval<cr>", "Evaluate" },
		["i"] = { "<plug>VimspectorBalloonEval<cr>", "Inspect" },
		["n"] = { "<plug>VimspectorStepOver | zz<cr>", "Next" },
		["o"] = { "<cmd>VimspectorShowOutput<cr>", "Output" },
		["s"] = { "<plug>VimspectorStepInto | zz<cr>", "Step into" },
		["S"] = { "<plug>VimspectorStepOut | zz<cr>", "Step out" },
		["v"] = {
			name = "View",
			["v"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.variables)<cr>", "Variables" },
			["w"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.watches)<cr>", "Watches" },
			["s"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.stack_trace)<cr>", "Stack" },
			["t"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.output)<cr>", "Terminal" },
			["T"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.tagpage)<cr>", "Tag" },
			["c"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.code)<cr>", "Code" },
		},
		["j"] = { "<plug>VimspectorDownFrame<cr>", "Down frame" },
		["k"] = { "<plug>VimspectorUpFrame<cr>", "Up frame" },
		["p"] = { "<plug>VimspectorPause<cr>", "Pause" },
		["P"] = { "<plug>VimspectorStop<cr>", "Stop" },
		["r"] = { "<plug>VimspectorRestart<cr>", "restart" },
		["D"] = { "<cmd>VimspectorReset<cr>", "Reset" },
		["w"] = { "<cmd>call AddToWatch()<cr>", "add to watch" },
		["z"] = { "<cmd>NeoZoomToggle<CR>", "maximize window" },
	},

	p = {
		name = "Plugin",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},

	r = {
		name = "Replace",
		r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
		w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
		f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
	},

	g = {
		name = "Git",
		d = {
			name = "Diff",
			["d"] = { "<cmd>Gdiff<cr>", "diff" },
			["s"] = { "<cmd>Gdiffsplit<cr>", "diff split" },
		},
		b = { "<cmd>Git blame<cr>", "blame" },
		B = { "<cmd>GBrowse<cr>", "browse" },
		c = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit" },
		C = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		g = {
			name = "Gutter",
			t = { "<cmd>lua require 'gitsigns'.toggle_signs()<cr>", "Toggle git gutter" },
			s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
			u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
			i = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "info Hunk" },
			j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
			k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
			b = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
			r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
			R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
			d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
		},
		G = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Gui" },
		l = { "<cmd>Git log --oneline<cr>", "Log" },
		L = { "<cmd>Git log<cr>", "Log long" },
		p = { "<cmd>GGrep<cr>", "Grep" },
		r = { "<cmd>GDelete<cr>", "remove" },
		v = { "<cmd>GV!<cr>", "file commits" },
		V = { "<cmd>GV<cr>", "all commits" },
		f = { "<cmd>diffget //2<cr>", "diffget left hunk" },
		j = { "<cmd>diffget //3<cr>", "diffget right hunk" },
		s = {
      name = "Search",
			b = { "<cmd>Telescope git_branches<cr>", "Branches" },
      c = { "<cmd>Telescope git_status<cr>", "Changes" },
		},
		y = "GitLink",
	},

	G = {
		name = "Gist",
		a = { "<cmd>Gist -b -a<cr>", "Create Anon" },
		d = { "<cmd>Gist -d<cr>", "Delete" },
		f = { "<cmd>Gist -f<cr>", "Fork" },
		g = { "<cmd>Gist -b<cr>", "Create" },
		l = { "<cmd>Gist -l<cr>", "List" },
		p = { "<cmd>Gist -b -p<cr>", "Create Private" },
	},

	l = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
		F = { "<cmd>LspToggleAutoFormat<cr>", "Toggle Autoformat" },
		g = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic" },
		G = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
		i = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
		I = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
		c = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		o = { "<cmd>SymbolsOutline<cr>", "Outline" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		R = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
		l = {
			name = "LSP/Latex",
			v = { "<cmd>VimtexInfo<cr>", "vimtex info" },
			c = { "<cmd>VimtexCompile<cr>", "latex compile" },
			i = { "<cmd>LspInfo<cr>", "Info" },
			I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		},
		-- q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
	},

	s = {
		name = "Search",
		[";"] = { "<cmd>Telescope commands<cr>", "Commands" },
		["?"] = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		A = { "<cmd>Telescope builtin<cr>", "All" },
		b = {
			"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
			"Buffers",
		},
		B = { "<cmd>Telescope bookmarks<cr>", "Bookmarks" },
		-- c = { "<cmd>Telescope commands<cr>", "Commands" },
		d = { "<cmd>require('telescope').extensions.vimspector.configurations()<cr>", "Debug" },
		e = { "<cmd>Telescope env<cr>", "Env" },
		f = { "<cmd>Telescope find_files<cr>", "Find File" },
		h = { "<cmd>Telescope search_history<cr>", "Search History" },
		H = { "<cmd>Telescope command_history<cr>", "Command History" },
		i = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Doc Diagnostics" },
		I = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
		j = { "<cmd>Telescope jumplist<cr>", "Jumplist" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		m = { "<cmd>Telescope marks<cr>", "Marks" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		o = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
		p = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Preview media" },
		P = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
		q = { "<cmd>lua require('telescope.builtin').quickfix()<cr>", "Quickfix" },
		l = { "<cmd>lua require('telescope.builtin').loclist()<cr>", "Loc list" },
		r = { "<cmd>Telescope registers<cr>", "Registers" },
		R = { "<cmd>Telescope resume<cr>", "Resume" },
		S = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		t = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
		T = { "<cmd>TodoTelescope<cr>", "Todos" },

		v = { "<cmd>Telescope vim_options<cr>", "Vim Options" },
		y = { "<cmd>Telescope neoclip<cr>", "Yank Lists" },
		Y = { "<cmd>Telescope filetypes<cr>", "Filetypes" },
		-- changelist -- \ 'D' : [':CocCommand fzf-preview.Changes'               , 'delta/changes'      ]    ,
		g = {
			name = "Git",
			b = { "<cmd>Telescope git_branches<cr>", "Branch" },
			m = { "<cmd>Telescope git_status<cr>", "Modified Files" },
			s = { "<cmd>Telescope git_stash<cr>", "Stash" },
			c = { "<cmd>Telescope git_bcommits<cr>", "Commits" },
			C = { "<cmd>Telescope git_commits<cr>", "all commits" },
			f = { "<cmd>Telescope git_files<cr>", "Git Files" },
		},

		-- \ 's' : [':CocList snippets'                             , 'snippets'           ]    ,
		-- \ 'w' : [':Windows'                                      , 'search windows'     ]    ,
	},

	q = {
		name = "QuickFix",
		g = { "<cmd>lua vim.lsp.diagnostic.set_qflist()<cr>", "Quickfix" },
		t = { "<cmd>TodoQuickFix<cr>", "Add todo to quickfix" },
		T = { "<cmd>TodoLocList<cr>", "Add todo to loclist" },
		q = { "<cmd>copen<cr>", "QuickFix" },
		Q = { "<cmd>cclose<cr>", "close QuickFix" },
		l = { "<cmd>lopen<cr>", "LocalFix" },
		L = { "<cmd>lclose<cr>", "close LocalFix" },
		-- Use unimpaired shortcuts [q ]q [l ]l to navigate quickfix
	},

	S = {
		name = "Session",
		l = { "<cmd>LoadLastSession!<cr>", "Load Last" },
		d = { "<cmd>LoadCurrentDirSession!<cr>", "Load Last Dir" },
		f = { "<cmd>Telescope sessions save_current=false<cr>", "Find Session" },
		s = { "<cmd>Alpha<cr>", "Alpha" },
		S = { "<cmd>SaveSession<cr>", "Save" },
	},

	t = {
		name = "Terminal",
		n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
		u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
		h = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
		p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
		l = { "<cmd>lua _LUA_TOGGLE()<cr>", "Lua" },
		c = { "<cmd>ToggleTerm direction=float<cr>", "Console" },
		d = { "<cmd>lua _LAZYDOCKER_TOGGLE()<cr>", "Docker" },
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "Git" },
		H = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
		V = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
		r = { "<cmd>RnvimrToggle<cr>", "ranger" },
		t = {
			name = "Tab",
			["<Left>"] = { "<cmd>tabm -1<cr>", "<= Tab" },
			["<Right>"] = { "<cmd>tabm +1<cr>", "=> Tab" },
			["n"] = { "<cmd>tabnew<cr>", "new tab" },
			["c"] = { "<cmd>tabnew | terminal<cr>", "new tab" },
			["%"] = { "<cmd>tabedit %<cr>", "file in new tab" },
			["i"] = { "<cmd>tabnew | terminal ipython<cr>", "ipython" },
		},
	},

	T = {
		name = "Treesitter",
		h = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "Highlight" },
		p = { "<cmd>TSPlaygroundToggle<cr>", "Playground" },
	},

	u = {
		name = "Ultisnips / Undo",
		t = { "<cmd>UndotreeToggle<cr>", "UndoTree" },
		-- e = { "<cmd>CocCommand snippets.editSnippets<cr>", "Ultisnips Edit" },
		-- f = { "<cmd>CocCommand snippets.openSnippetFiles<cr>", "Ultisnips Files" },
		-- s = { "<cmd>CocList snippets<cr>", "Ultisnips Snippets" },
	},

	w = {
		name = "Wiki",
		-- Wiki
		w = "Wiki Index",
		t = "Tab",
		T = { "<cmd>VimwikiTable<cr>", "vimwikiTable" },
		d = "Delete",
		r = "Rename",
		-- Diary
		i = "Diary Index",
		["<leader>"] = {
			w = "Diary Today",
			t = "New Tab Diary Today",
			i = "Update Diary Index",
		},
	},

	y = {
		name = "+toggle",
		o = {
			name = "Options",
			b = { "yob", "background" },
			d = { "yod", "diff" },
			e = { "yoe", "spell" },
			c = { "yoc", "cursorline" },
			g = { ":IndentGuidesToggle", "indent Guide" },
			m = { "<Plug>MarkdownPreview", "markdown preview toggle" },
			M = { "<Plug>MarkdownPreviewStop", "markdown preview stop" },
			C = { ":ColorizerToggle", "colorizer" },
			h = { "yoh", "hlsearch" },
			i = { "yoi", "ignorecase" },
			l = { "yol", "list" },
			n = { "yon", "number" },
			p = { "yop", "scratchPad" },
			r = { "yor", "relativenumber" },
			u = { "you", "cursorcolumn" },
			v = { "yov", "virtualedit" },
			w = { "yow", "wrap" },
			x = { "yox", "crosshairs" },
		},
	},
}

local vopts = {
	mode = "v", -- VISUAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}
local vmappings = {
	["/"] = { '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', "Comment" },
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
which_key.register(m_mappings, m_opts)
