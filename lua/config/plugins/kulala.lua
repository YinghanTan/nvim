return {
  "mistweaverco/kulala.nvim",
  keys = {
    { "<leader>R", desc = "󰍩 [R]equests" },
    { "<leader>Rs", function() require("kulala").run() end, mode = { "n", "v" }, desc = "Send request" },
    { "<leader>Ra", function() require("kulala").run_all() end, mode = { "n", "v" }, desc = "Send all requests" },
    { "<leader>Rb", function() require("kulala").scratchpad() end, desc = "Open scratchpad" },
  },
  ft = { "http", "rest" },
  opts = {
    global_keymaps = false,
    global_keymaps_prefix = "<leader>R",
    kulala_keymaps_prefix = "",
  },
}
