local status_ok, signature = pcall(require, "lsp_signature")
if not status_ok then
  return
end

local cfg = {
  debug = false, -- set to true to enable dbug logging
  log_path = "debug_log_file_path", -- debug log path
  verbose = false, -- show debug line number
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  -- if you want to hook lspsaga or other signature handler, pls set to false
  doc_lines = 0, -- will show two lines of comment/doc(if there are more than two lines in doc, will be trncated);
  -- set to 0 if you DO NOT want any API comments be shown
  -- This setting only take effect in insert mode, it does not affect signature help in normal mode, 10 by default
  
  floating_window = false, -- show hint in a floating window, set to false for virtual only mode

  floating_window_above_cur_line, -- try to place the floating above the current line when possible Note:
  -- will set to true when fully tested, set to false will use wichever side has more space
  -- this setting will be helpful if you do not want the PUM and floating win overlap
  fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
  hint_enable = true, -- virtual hint enable
  hint_prefix = "  ", -- Panda for parameter
  hint_schema = "Comment",
  use_lspsage = false, -- set to true if you want to use lspsaga popup
}
