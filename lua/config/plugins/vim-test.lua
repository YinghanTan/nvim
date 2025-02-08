return {
  "vim-test/vim-test",
  dependencies = {
    "preservim/vimux"
  },
  config = function()
    vim.keymap.set("n", "<leader>t.", ":TestNearest<CR>", {desc = "[t]est [.]line"})
    vim.keymap.set("n", "<leader>t%", ":TestFile<CR>", {desc = "[t]est [%]file"})
    vim.keymap.set("n", "<leader>ta", ":TestSuite<CR>", {desc = "[t]est [a]ll"})
    vim.keymap.set("n", "<leader>tc", ":TestClass<CR>", {desc = "[t]est [c]lass"})
    vim.keymap.set("n", "<leader>tl", ":TestLast<CR>", {desc = "[t]est [l]ast"})
    vim.keymap.set("n", "<leader>tv", ":TestVisit<CR>", {desc = "[t]est [v]isit"})
    vim.cmd("let test#strategy = 'vimux'")
  end,
}
