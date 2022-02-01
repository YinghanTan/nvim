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

-- local m_opts = {
--   mode = "n", -- NORMAL mode
--   prefix = "m",
--   buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--   silent = true, -- use `silent` when creating keymaps
--   noremap = true, -- use `noremap` when creating keymaps
--   nowait = true, -- use `nowait` when creating keymaps
-- }
-- local m_mappings = {
--   a = { "<cmd>BookmarkAnnotate<cr>", "Annotate" },
--   c = { "<cmd>BookmarkClear<cr>", "Clear" },
--   m = { "<cmd>BookmarkToggle<cr>", "Toggle" },
--   h = { '<cmd>lua require("harpoon.mark").add_file()<cr>', "Harpoon" },
--   j = { "<cmd>BookmarkNext<cr>", "Next" },
--   k = { "<cmd>BookmarkPrev<cr>", "Prev" },
--   s = {
--     "<cmd>lua require('telescope').extensions.vim_bookmarks.all({ hide_filename=false, prompt_title=\"bookmarks\", shorten_path=false })<cr>",
--     "Show",
--   },
--   x = { "<cmd>BookmarkClearAll<cr>", "Clear All" },
--   u = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', "Harpoon UI" },
-- }

local mappings = {
	["/"] = { '<cmd>let @/ = ""<cr>', "Clear highlight" },
	["."] = { "<cmd>e $MYVIMRC<cr>", "open init" },
	[";"] = { "<cmd>Telescope commands<cr>", "Commands" },

	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
	["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },

	["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
	["R"] = { '<cmd>lua require("renamer").rename()<cr>', "Rename" },

	a = {
		name = "action",
		s = { "<cmd>source $MYVIMRC<cr>", "source" },
    c = { "<cmd>ColorizerToggle<cr>", 'colorizer' },
		C = { "<cmd>cd %:p:h<cr>:pwd<cr>", "set current dir" },
		g = { "<cmd>PackerSync<cr>", "Sync" },
		m = { "<cmd>PackerStatus<cr>", "Status" },
		p = { "<cmd>Codi<cr>", "scratchpad" },
		-- \ 's' : [':source $MYVIMRC'           , 'source init'             ] ,
		-- \ 'C' : [':cd %:p:h<cr>:pwd<cr>'      , 'set current directory'   ] ,
		-- \ 'g' : [':IndentGuidesToggle<CR>'    , 'indent Guide'            ] ,
		-- \ 'm' : ['<Plug>MarkdownPreview'      , 'markdown preview toggle' ] ,
		-- \ 'p' : [':Codi'                      , 'scratchpad' ] ,
	},

	d = {
		name = "Debug",
		["b"] = { "<Plug>VimspectorToggleBreakpoint", "breakpoint" },
		["B"] = {
			name = "+breakpoint",
			["d"] = { ":call vimspector#ClearBreakpoints()", "remove all breakpoints" },
			["f"] = { "<Plug>VimspectorAddFunctionBreakpoint", "func breakpoint" },
			["c"] = { "<Plug>VimspectorToggleConditionalBreakpoint", "conditional breakpoint" },
		},
		["c"] = { "<Plug>VimspectorContinue | zz", "continue" },
		["C"] = { "<Plug>VimspectorRunToCursor | zz", "run to cursor" },
		["d"] = { ":call vimspector#Launch()<CR>", "debug" },
		["e"] = { ":VimspectorEval", "evaluate" },
		["i"] = { "<Plug>VimspectorBalloonEval", "inspect" },
		["n"] = { "<Plug>VimspectorStepOver | zz", "next" },
		["s"] = { "<Plug>VimspectorStepInto | zz", "step into" },
		["S"] = { "<Plug>VimspectorStepOut | zz", "step out" },
		["v"] = {
			name = "+view",
			["v"] = { ":call GoToWindow(g:vimspector_session_windows.variables)<CR>", "variables" },
			["w"] = { ":call GoToWindow(g:vimspector_session_windows.watches)<CR>", "watches" },
			["s"] = { ":call GoToWindow(g:vimspector_session_windows.stack_trace)<CR>", "stack" },
			["t"] = { ":call GoToWindow(g:vimspector_session_windows.output)<CR>", "terminal" },
			["T"] = { ":call GoToWindow(g:vimspector_session_windows.tagpage)<CR>", "tag" },
			["c"] = { ":call GoToWindow(g:vimspector_session_windows.code)<CR>", "code" },
		},
		["k"] = { "<Plug>VimspectorUpFrame", "Up frame" },
		["j"] = { "<Plug>VimspectorDownFrame", "Down frame" },
		["p"] = { "<Plug>VimspectorPause", "pause" },
		["P"] = { "<Plug>VimspectorStop", "stoP" },
		["r"] = { "<Plug>VimspectorRestart", "restart" },
		["D"] = { "VimspectorReset", "Reset" },
		["w"] = { ":call AddToWatch()<CR>", "add to watch" },
		["z"] = { ":MaximizerToggle", "maximize window" },
	},

	p = {
		name = "Packer",
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
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Diff",
		},
		-- ["gy"] = "Link",
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
		d = { "<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics" },
		w = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
		f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
		F = { "<cmd>LspToggleAutoFormat<cr>", "Toggle Autoformat" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic" },
		k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		o = { "<cmd>SymbolsOutline<cr>", "Outline" },
		q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		R = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
	},

	s = {
		name = "Search",
		[";"] = { "<cmd>Telescope commands<cr>", "Commands" },
		["?"] = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		b = { "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", "Buffers", },
		B = { "<cmd>Telescope bookmarks<cr>", "Bookmarks", },
		c = { "<cmd>Telescope command_history<cr>", "Commands History" },
		C = { "<cmd>Telescope commands<cr>", "Commands" },
		f = { "<cmd>Telescope find_files<cr>", "Find File" },
		m = { "<cmd>Telescope marks<cr>", "Marks" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		h = { "<cmd>Telescope search_history<cr>", "Search History" },
		j = { "<cmd>Telescope jumplist<cr>", "Jumplist" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
		t = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
		y = { "<cmd>Telescope neoclip<cr>", "Yank Lists" },
		Y = { "<cmd>Telescope filetypes<cr>", "Filetypes" },
		-- changelist -- \ 'D' : [':CocCommand fzf-preview.Changes'               , 'delta/changes'      ]    ,
		gb = { "<cmd>Telescope git_branches<cr>", "Branch" },
		gs = { "<cmd>Telescope git_status<cr>", "Status" },
		gS = { "<cmd>Telescope git_stash<cr>", "Stach" },
		gc = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		gC = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit" },
		i = { "<cmd>Telescope diagnostics<cr>", "Document Diagnostics" },
		-- i = { "<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics" },
		-- I = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },

		-- \ 'g' : [':GFiles'                                       , 'git files'          ]    ,
		-- \ 'h' : [':History'                                      , 'file history'       ]    ,
		-- \ 'H' : [':History:'                                     , 'command history'    ]    ,
		-- \ 'i' : [':CocCommand fzf-preview.CocCurrentDiagnostics' , 'diagnostics'        ]    ,
		-- \ 'I' : [':CocCommand fzf-preview.CocDiagnostics'        , 'all diagnostics'    ]    ,
		-- \ 'j' : [':CocCommand fzf-preview.Jumps'                 , 'jumps'              ]    ,
		-- \ 'M' : [':Maps'                                         , 'normal maps'        ]    ,
		-- \ 'q' : [':CocCommand fzf-preview.QuickFix'              , 'quickfix list'      ]    ,
		-- \ 'Q' : [':CocCommand fzf-preview.LocationList'          , 'location list'      ]    ,
		-- \ 's' : [':CocList snippets'                             , 'snippets'           ]    ,
		-- \ 'w' : [':Windows'                                      , 'search windows'     ]    ,
		-- \ 'y' : [':CocFzfList yank'                              , 'list yank'          ]    ,

		S = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		R = { "<cmd>Telescope resume<cr>", "Resume" },
		a = { "<cmd>Telescope registers<cr>", "Registers" },

		-- i = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
	},

	q = {
		name = "QuickFix",
		["g"] = { "<cmd>CocDiagnostics", "Diagnostics" },
		["t"] = { "<cmd>Todo", "Add todo to quickfix" },
		["q"] = { "<cmd>copen", "QuickFix" },
		["Q"] = { "<cmd>cclose", "close QuickFix" },
		["l"] = { "<cmd>lopen", "LocalFix" },
		["L"] = { "<cmd>lclose", "close LocalFix" },
		["r"] = { "<cmd>Rg :", "close LocalFix" },
	},

	S = {
		name = "Session",
		s = { "<cmd>SaveSession<cr>", "Save" },
		l = { "<cmd>LoadLastSession!<cr>", "Load Last" },
		d = { "<cmd>LoadCurrentDirSession!<cr>", "Load Last Dir" },
		f = { "<cmd>Telescope sessions save_current=false<cr>", "Find Session" },
		a = { "<cmd>Alpha<cr>", "Alpha" },
	},

	t = {
		name = "Terminal",
		n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
		u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
		h = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
		p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		-- h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
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
-- which_key.register(m_mappings, m_opts)
