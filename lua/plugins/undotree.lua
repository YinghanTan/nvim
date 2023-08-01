return {
  {
    "mbbill/undotree",
    lazy = false,
    init = function()
      if vim.fn.has("persistent_undo") then
        local target_path = vim.fn.expand("~/.undodir")

        -- create the directory and any parent directories
        -- if the location does not exist.
        if not vim.fn.isdirectory(target_path) then
          vim.fn.mkdir(target_path, "p", 0700)
        end

        vim.o.undodir = target_path
        vim.o.undofile = true
      end

      vim.g.undotree_RelativeTimestamp = 1
      vim.g.undotree_ShortIndicators = 1
      vim.g.undotree_HelpLine = 0
      vim.g.undotree_WindowLayout = 2
    end,
  },
}
