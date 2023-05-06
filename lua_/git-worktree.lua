require("git-worktree").setup({
    change_directory_command = "cd", -- default: "cd",
    update_on_change = true, -- default: true,
    update_on_change_command = "e .", -- default: "e .",
    clearjumps_on_change = true, -- default: true,
    autopush = false -- default: false,
})

-- Creates a worktree.  Requires the path, branch name, and the upstream
-- Example:
-- " :lua require("git-worktree").create_worktree("feat-69", "master", "origin")

-- switches to an existing worktree.  Requires the path name
-- Example:
-- " :lua require("git-worktree").switch_worktree("feat-69")

-- deletes to an existing worktree.  Requires the path name
-- Example: blocking the accessment
-- :lua require("git-worktree").delete_worktree("feat-69")
