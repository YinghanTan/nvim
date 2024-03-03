local M = {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
}

function M.config()
  require("nvim-surround").setup()
end

return M

-- Usage examples
-- ysw"
-- ysa"(
-- v<select>S{
-- dst
-- ds{
-- ds(
-- cs"'
-- cst<p>
-- dst
-- yswfprint
-- csfcall
-- dsf

