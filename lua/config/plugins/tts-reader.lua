local M = {}

-- State management
M.is_reading = false
M.current_buf = nil
M.current_win = nil
M.timer = nil
M.piper_bin = '/home/yinghan/.local/bin/piper'
M.piper_voice = '/usr/share/piper/voices/en_US/en_US-libritts-high.onnx'
M.gtts_cli_bin = 'gtts-cli'
M.language = 'en'
M.speed = '2.0'

-- TTS method configuration
-- M.tts_method = 'piper' -- 'piper' or 'gtts'

-- To use Google TTS instead of Piper, set:
M.tts_method = 'gtts'

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

  -- Remove symbols from text
  return text:gsub(pattern, ' '):gsub('%s+', ' '):gsub('^%s+', ''):gsub('%s+$', '')
end

-- Unified function to get paragraph starting from cursor position or specified line
function M.get_paragraph(start_line)
  local buf, win

  if start_line then
    -- Use the provided buffer and window from state
    buf = M.current_buf
    win = M.current_win
    if not buf or not win then
      return nil
    end
  else
    -- Use current buffer and window
    buf = vim.api.nvim_get_current_buf()
    win = vim.api.nvim_get_current_win()
  end

  local line_count = vim.api.nvim_buf_line_count(buf)

  -- Save original cursor position
  local original_pos = vim.api.nvim_win_get_cursor(win)

  -- If start_line is provided, move to that line first
  if start_line then
    -- If we're at the end of the file, return nil
    if start_line >= line_count then
      vim.api.nvim_win_set_cursor(win, original_pos)
      return nil
    end
    vim.api.nvim_win_set_cursor(win, {start_line, 0})
  end

  -- Move to beginning of paragraph
  vim.cmd('normal! {')
  local paragraph_start_line = vim.api.nvim_win_get_cursor(win)[1]

  -- Move to end of paragraph
  vim.cmd('normal! }')
  local paragraph_end_line = vim.api.nvim_win_get_cursor(win)[1]

  -- Check if we're at the end of the buffer
  if paragraph_end_line >= line_count then
    vim.api.nvim_win_set_cursor(win, original_pos)
    return nil
  end

  -- Get lines of the paragraph
  local lines = vim.api.nvim_buf_get_lines(buf, paragraph_start_line - 1, paragraph_end_line, false)
  local paragraph_text = table.concat(lines, ' '):gsub('%s+', ' '):gsub('^%s+', ''):gsub('%s+$', '')

  -- Filter out symbols
  paragraph_text = M.filter_symbols(paragraph_text)

  -- Restore original cursor position
  vim.api.nvim_win_set_cursor(win, original_pos)

  if paragraph_text == '' then
    return nil
  end

  return {
    text = paragraph_text,
    start_line = paragraph_start_line,
    end_line = paragraph_end_line,
    buf = buf,
    win = win
  }
end

-- Function to get paragraph starting from cursor position
function M.get_current_paragraph()
  return M.get_paragraph()
end

-- Function to get the next paragraph from the end of the current paragraph
function M.get_next_paragraph(current_end_line)
  return M.get_paragraph(current_end_line + 1)
end

-- Function to speak text using gtts-cli
function M.speak_text_gtts(text)
  if text and text ~= '' then
    -- Use gtts-cli to speak the text
    local command = M.gtts_cli_bin .. ' "' .. vim.fn.shellescape(text) .. '" --lang ' .. M.language .. ' | ffmpeg -i pipe:0 -filter:a "atempo='.. M.speed .. '" -f mp3 - | mpg321 -'
    vim.fn.system(command)
  end
end

-- Function to speak text using vim-piper
function M.speak_text_piper(text)
  if text and text ~= '' then
    -- Use vim-piper to speak the text
    -- vim.cmd('PiperSay "' .. vim.fn.escape(text, '"') .. '"')
    local command = 'echo "' .. vim.fn.shellescape(text) .. '" | ' .. M.piper_bin .. ' --model "' .. M.piper_voice .. '" --output-raw | aplay -r 22050 -f S16_LE -t raw -'
    vim.fn.system(command)
  end
end

-- Unified function to speak text using configured method
function M.speak_text(text)
  if text and text ~= '' then
    if M.tts_method == 'gtts' then
      M.speak_text_gtts(text)
    else
      M.speak_text_piper(text)
    end
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
    start_line - 1,
    0,
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

  -- Get current paragraph to start with
  local current_paragraph = M.get_current_paragraph()

  if not current_paragraph or current_paragraph.text == '' then
    vim.notify("No paragraph found at current position!", vim.log.levels.WARN)
    M.is_reading = false
    return
  end

  vim.notify("Starting continuous reading...", vim.log.levels.INFO)

  -- Start reading with current paragraph
  M.read_paragraph(current_paragraph)
end

-- Function to read a specific paragraph
function M.read_paragraph(paragraph)
  if not M.is_reading then
    return
  end

  -- Highlight current paragraph
  M.highlight_paragraph(paragraph.start_line, paragraph.end_line)

  -- Move cursor to the paragraph
  vim.api.nvim_win_set_cursor(M.current_win, {paragraph.start_line, 0})

  -- Force screen redraw to ensure highlighting is visible
  vim.cmd('redraw')

  M.speak_text(paragraph.text)

  -- Set up timer for next paragraph (adjust delay based on text length)
  -- local delay = math.max(100, #paragraph.text * 5) -- Minimum 2 seconds
  local delay = math.max(20) -- Minimum 2 seconds
  M.timer = vim.defer_fn(function()
    -- Get next paragraph dynamically from the end of current paragraph
    local next_paragraph = M.get_next_paragraph(paragraph.end_line)

    if next_paragraph and next_paragraph.text ~= '' then
      M.read_paragraph(next_paragraph)
    else
      M.stop_reading()
      vim.notify("End of document reached.", vim.log.levels.INFO)
    end
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

-- Plugin configuration
return {
  -- This is a local plugin, not from a repository
  dir = "~/.config/nvim/lua",
  name = "tts-reader",
  config = function()
    -- Set up keymaps or any configuration here
    vim.keymap.set('n', '<leader>rr', M.toggle_reading, { desc = "Toggle TTS reading" })
    vim.keymap.set('n', '<leader>rs', M.stop_reading, { desc = "Stop TTS reading" })
  end,
}

-- dependencies
-- sudo apt-get install ffmpeg mpg321
-- uv tools install gtts-cli


