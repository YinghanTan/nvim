return {
  "kevinhwang91/nvim-bqf",
  event = "VeryLazy",
  config = function()
    require("bqf").setup({
      auto_enable = true,
      magic_window = true,
      auto_resize_height = false,
      preview = {
        auto_preview = false,
        show_title = true,
        delay_syntax = 50,
        wrap = false,
      },
      func_map = {
        open = "<CR>",
        openc = "o",
        tab = "t",
        split = "<C-s>",
        vsplit = "<C-v>",
        stoggleup = "<S-Tab>",
        stoggledown = "<Tab>",
        stogglevm = "<Tab>",
        prevhist = "<",
        nexthist = ">",
        sclear = "z<Tab>",
        ptogglemode = "zp",
        ptoggleitem = "p",
        ptoggleauto = "P",
        pscrollup = "<C-b>",
        pscrolldown = "<C-f>",
        filter = "zn",
        filterr = "zN",
        fzffilter = "zf",
      },
    })
  end,
}
