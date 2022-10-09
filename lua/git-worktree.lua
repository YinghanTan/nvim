require("git-worktree").setup({
    change_directory_command = <str> -- default: "cd",
    update_on_change = <boolean> -- default: true,
    update_on_change_command = <str> -- default: "e .",
    clearjumps_on_change = <boolean> -- default: true,
    autopush = <boolean> -- default: false,
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
