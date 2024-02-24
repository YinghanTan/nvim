local M = {
  "wsdjeg/vim-fetch",
  lazy = false,
}

return M

-- https://github.com/wsdjeg/vim-fetch
-- vim path/to/file.ext:12:3 in the shell to open file.ext on line 12 at column 3
-- :e[dit] path/to/file.ext:100:12 in Vim to edit file.ext on line 100 at column 12
-- gF with the cursor at ^ on path/to^/file.ext:98,8 to edit file.ext on line 98, column 8
-- gF with the selection |...| on |path to/file.ext|:5:2 to edit file.ext on line 5, column 2
