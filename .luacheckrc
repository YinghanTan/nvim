-- vim: ft=lua tw=80


exclude_files = {
  '.luacheckrc',
}

stds.nvim = {
  read_globals = { "jit" }
}

-- Ignore W211 (unused variable) with preload files.
files["**/preload.lua"] = {ignore = { "211" }}
-- Allow vim module to modify itself, but only here.
files["src/nvim/lua/vim.lua"] = {ignore = { "122/vim" }}

-- Don't report unused self arguments of methods.
self = false

-- Rerun tests only if their modification time changed.
cache = true

ignore = {
  "121", -- setting read-only global variable 'vim'
  "122", -- setting read-only field of global variable 'vim'
  "122", -- Setting a read-only field of a global variable.
  "212", -- Unused argument, In the case of callback function, _arg_name is easier to understand than _, so this option is set to off.
  "212/_.*",  -- unused argument, for vars with "_" prefix
  "214", -- used variable with unused hint ("_" prefix)
  "581", -- negation of a relational operator- operator can be flipped (not for tables)
  "631", -- max_line_length, vscode pkg URL is too long
}

-- Global objects defined by the C code
read_globals = {
  "vim",
}

globals = {
  "vim.g",
  "vim.b",
  "vim.w",
  "vim.o",
  "vim.bo",
  "vim.wo",
  "vim.go",
  "vim.env"
}

