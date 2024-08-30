return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop" },
    })

    vim.keymap.set("n", "<leader>wr", "<cmd>SessionRestore<cr>", { desc = "Restore session for cwd" })  -- restore workspace
    vim.keymap.set("n", "<leader>ws", "<cmd>SessionSave<cr>", { desc = "Save session for auto session root dir" })

  end
}
