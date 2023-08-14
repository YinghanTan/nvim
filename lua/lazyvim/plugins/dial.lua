return {
  {
    "monaqa/dial.nvim",
    lazy = false,
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
        },
        typescript = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.constant.new({ elements = { "let", "const" } }),
        },
        visual = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.alpha,
          augend.constant.alias.Alpha,
        },
      })

      -- change augends in VISUAL mode
      vim.keymap.set("v", "<C-a>", require("dial.map").inc_visual("visual"), { noremap = true })
      vim.keymap.set("v", "<C-x>", require("dial.map").dec_visual("visual"), { noremap = true })

      -- enable only for specific FileType
      vim.cmd([[
        autocmd FileType typescript lua vim.api.nvim_buf_set_keymap(0, "n", "<C-a>", require("dial.map").inc_normal("typescript"), {noremap = true}))
        autocmd FileType typescript lua vim.api.nvim_buf_set_keymap(0, "n", "<C-x>", require("dial.map").dec_normal("typescript"), {noremap = true})
      ]])

      vim.keymap.set("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
      vim.keymap.set("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
      vim.keymap.set("n", "g<C-a>", require("dial.map").inc_gnormal(), { noremap = true })
      vim.keymap.set("n", "g<C-x>", require("dial.map").dec_gnormal(), { noremap = true })
      vim.keymap.set("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
      vim.keymap.set("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })
      vim.keymap.set("v", "g<C-a>", require("dial.map").inc_gvisual(), { noremap = true })
      vim.keymap.set("v", "g<C-x>", require("dial.map").dec_gvisual(), { noremap = true })
    end,
  },
}
