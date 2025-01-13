return {
  "jessekelighine/vindent.nvim",
  config = function()
    local map = {
      motion = function(lhs, rhs)
        vim.keymap.set("", lhs, rhs)
      end,
      object = function(lhs, rhs)
        vim.keymap.set({ "x", "o" }, lhs, rhs)
      end,
    }
    map.motion("[=", "<Plug>(VindentBlockMotion_OO_prev)")
    map.motion("]=", "<Plug>(VindentBlockMotion_OO_next)")
    map.motion("[+", "<Plug>(VindentMotion_more_prev)")
    map.motion("]+", "<Plug>(VindentMotion_more_next)")
    map.motion("[-", "<Plug>(VindentMotion_less_prev)")
    map.motion("]-", "<Plug>(VindentMotion_less_next)")
    map.motion("[;", "<Plug>(VindentMotion_diff_prev)")
    map.motion("];", "<Plug>(VindentMotion_diff_next)")
    map.motion("[p", "<Plug>(VindentBlockEdgeMotion_XX_prev)")
    map.motion("]p", "<Plug>(VindentBlockEdgeMotion_XX_next)")
    map.object("ii", "<Plug>(VindentObject_XX_ii)")
    map.object("ai", "<Plug>(VindentObject_XX_ai)")
    map.object("aI", "<Plug>(VindentObject_XX_aI)")
  end,
}
