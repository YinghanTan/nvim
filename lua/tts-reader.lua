local M = {}

-- State management
M.is_reading = false
M.current_buf = nil
M.current_win = nil
M.timer = nil
M.paragraphs = {}
M.current_paragraph_index = 0
M.piper_bin = '/home/yinghan/.local/bin/piper'
M.piper_voice = '/usr/share/piper/voices/en_US/en_US-libritts-high.onnx'

-- Configurable symbols to ignore during TTS
M.ignored_symbols = {
  '*', '+', '-', '=', '/', '\\', '|', '<', '>', '[', ']', '{', '}', '(', ')',
  '@', '#', '$', '%', '^', '&', '_', '~', '`', ';', ':'
}

-- Function to filter symbols from text
function M.filter_symbols(text)
  if not text or text == '' then
    return text
  end

  -- Escape special regex characters in symbols
  local escaped_symbols = {}
  for _, symbol in ipairs(M.ignored_symbols) do
    -- Escape special regex characters
    local escaped = symbol:gsub('([%^%$%(%)%%%.%[%]%*%+%-%?])', '%%%1')
    table.insert(escaped_symbols, escaped)
  end

  -- Create pattern to match any of the symbols
  local pattern = '[' .. table.concat(escaped_symbols) .. ']'

  vim.notify(pattern)

  -- Remove symbols from text
  return text:gsub(pattern, ' ')
end

-- Function to get paragraph starting from cursor position
function M.get_current_paragraph()
  local buf = vim.api.nvim_get_current_buf()
  local win = vim.api.nvim_get_current_win()
  local cursor_pos = vim.api.nvim_win_get_cursor(win)
  local line = cursor_pos[1]

  -- Save original cursor position
  local original_pos = vim.api.nvim_win_get_cursor(win)

  -- Move to beginning of paragraph
  vim.cmd('normal! {')
  local start_line = vim.api.nvim_win_get_cursor(win)[1]

  -- Move to end of paragraph
  vim.cmd('normal! }')
  local end_line = vim.api.nvim_win_get_cursor(win)[1]

  -- Restore original cursor position
  vim.api.nvim_win_set_cursor(win, original_pos)

  -- Get lines of the paragraph
  local lines = vim.api.nvim_buf_get_lines(buf, start_line - 1, end_line, false)
  local paragraph_text = table.concat(lines, ' ')

  -- Clean up text
  paragraph_text = paragraph_text:gsub('%s+', ' '):gsub('^%s+', ''):gsub('%s+$', '')
  vim.notify(paragraph_text)

  -- Filter out symbols
  paragraph_text = M.filter_symbols(paragraph_text)

  return {
    text = paragraph_text,
    start_line = start_line,
    end_line = end_line,
    buf = buf,
    win = win
  }
end

-- Function to get all paragraphs from current position
function M.get_all_paragraphs_from_cursor()

  local paragraphs = {}
  local buf = vim.api.nvim_get_current_buf()
  local win = vim.api.nvim_get_current_win()
  local original_pos = vim.api.nvim_win_get_cursor(win)

  -- Get current paragraph
  local current_para = M.get_current_paragraph()
  table.insert(paragraphs, current_para)
  print(paragraphs)

  -- Move to next paragraph and collect all subsequent paragraphs
  vim.api.nvim_win_set_cursor(win, {current_para.end_line + 1, 0})

  while true do
    -- Try to get next paragraph
    vim.cmd('normal! }')
    local next_line = vim.api.nvim_win_get_cursor(win)[1]

    -- Check if we're at the end of the buffer
    local line_count = vim.api.nvim_buf_line_count(buf)
    if next_line >= line_count then
      break
    end

    -- Get the paragraph
    vim.cmd('normal! {')
    local start_line = vim.api.nvim_win_get_cursor(win)[1]
    vim.cmd('normal! }')
    local end_line = vim.api.nvim_win_get_cursor(win)[1]

    local lines = vim.api.nvim_buf_get_lines(buf, start_line - 1, end_line, false)
    local para_text = table.concat(lines, ' '):gsub('%s+', ' '):gsub('^%s+', ''):gsub('%s+$', '')

    -- Filter out symbols
    para_text = M.filter_symbols(para_text)

    if para_text ~= '' then
      table.insert(paragraphs, {
        text = para_text,
        start_line = start_line,
        end_line = end_line,
        buf = buf,
        win = win
      })
    end

    -- Move to next line after this paragraph
    vim.api.nvim_win_set_cursor(win, {end_line + 1, 0})
  end

  -- Restore original position
  vim.api.nvim_win_set_cursor(win, original_pos)
  return paragraphs
end


-- Function to speak text using vim-piper
function M.speak_text(text)
  if text and text ~= '' then
    -- Use vim-piper to speak the text
    -- vim.cmd('PiperSay "' .. vim.fn.escape(text, '"') .. '"')
    print(text)
    local command = 'echo "' .. vim.fn.shellescape(text) .. '" | ' .. M.piper_bin .. ' --model "' .. M.piper_voice .. '" --output-raw | aplay -r 22050 -f S16_LE -t raw -'
    vim.fn.system(command)
  end
end

-- Function to highlight current paragraph
function M.highlight_paragraph(start_line, end_line)
  -- Clear previous highlights
  M.clear_highlights()

  -- Add highlight for current paragraph
  local ns = vim.api.nvim_create_namespace('tts_reader')
  M.highlight_ns = ns

  vim.api.nvim_buf_set_extmark(
    M.current_buf,
    ns,
    start_line - 1,  -- line (0-based)
    0,               -- column (0-based)
    {
      hl_group = 'Visual',
      end_line = end_line,  -- end line (exclusive)
    }
  )
end

-- Function to clear highlights
function M.clear_highlights()
  if M.highlight_ns and M.current_buf then
    vim.api.nvim_buf_clear_namespace(M.current_buf, M.highlight_ns, 0, -1)
  end
end

-- Main function to start continuous reading
function M.start_continuous_reading()
  if M.is_reading then
    vim.notify("Already reading!", vim.log.levels.WARN)
    return
  end


  M.is_reading = true
  M.current_buf = vim.api.nvim_get_current_buf()
  M.current_win = vim.api.nvim_get_current_win()

  -- GTet all paragraphs from current position
  M.paragraphs = M.get_all_paragraphs_from_cursor()
  M.current_paragraph_index = 1

  if #M.paragraphs == 0 then
    vim.notify("No paragraphs found!", vim.log.levels.WARN)
    M.is_reading = false
    return
  end

  vim.notify("Starting continuous reading...", vim.log.levels.INFO)

  -- Start reading
  M.read_next_paragraph()
end

-- Function to read next paragraph
function M.read_next_paragraph()
  if not M.is_reading or M.current_paragraph_index > #M.paragraphs then
    M.stop_reading()
    return
  end

  local paragraph = M.paragraphs[M.current_paragraph_index]

  -- Highlight current paragraph
  M.highlight_paragraph(paragraph.start_line, paragraph.end_line)

  -- Move cursor to the paragraph
  vim.api.nvim_win_set_cursor(M.current_win, {paragraph.start_line, 0})

  -- Force screen redraw to ensure highlighting is visible
  vim.cmd('redraw')

  M.speak_text(paragraph.text)

  -- Set up timer for next paragraph (adjust delay based on text length)
  local delay = math.max(2000, #paragraph.text * 50) -- Minimum 5 seconds
  M.timer = vim.defer_fn(function()
    M.current_paragraph_index = M.current_paragraph_index + 1
    M.read_next_paragraph()
  end, delay)
end

-- Function to stop reading
function M.stop_reading()
  if M.timer then
    M.timer:close()
    M.timer = nil
  end
  M.is_reading = false
  M.clear_highlights()
  vim.notify("Reading stopped.", vim.log.levels.INFO)
end

-- Function to toggle reading
function M.toggle_reading()
  if M.is_reading then
    M.stop_reading()
  else
    M.start_continuous_reading()
  end
end

return M
