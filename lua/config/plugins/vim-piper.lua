return {
  "wolandark/vim-piper",
  keys = {
    { "<leader>tw", SpeakWord, mode = { "n" }, desc = " [t]ts [w]ord" },
    { "<leader>tc", SpeakCurrentLine, mode = { "n" }, desc = " [t]ts [c]urrent line" },
    { "<leader>tp", SpeakCurrentParagraph, mode = { "n" }, desc = " [t]ts [p]aragraph" },
    { "<leader>tf", SpeakCurrentFile, mode = { "n" }, desc = " [t]ts [f]ile" },
    { "<leader>tv", SpeakVisualSelection, mode = { "n" }, desc = " [t]ts [v]isual" },
    -- Add continuous reading keybinds
    -- { "<leader>ts", function() require("tts-reader").start_continuous_reading() end, mode = { "n" }, desc = " [t]ts [s]peech" },
    -- { "<leader>ts", function() require("tts-reader").stop_reading() end, mode = { "n" }, desc = " [t]ts [s]peech" },
    { "<leader>ts", function() require("tts-reader").toggle_reading() end, mode = { "n" }, desc = " [t]ts [s]peech" },
  },
  config = function()
    vim.g.piper_bin = '/home/yinghan/.local/bin/piper'
    vim.g.piper_voice = '/usr/share/piper/voices/en_US/en_US-libritts-high.onnx'
    -- vim.g.piper_voice = '/usr/share/piper/voices/zh_CN/zh_CN-huayan-medium.onnx'
    -- vim.g.piper_voice = '/usr/share/piper-voices/en/en_US/joe/medium/en_US-joe-medium.onnx'
  end,
}


-- nnoremap tw :call SpeakWord()
-- nnoremap tc :call SpeakCurrentLine()
-- nnoremap tp :call SpeakCurrentParagraph()
-- nnoremap tf :call SpeakCurrentFile()
-- vnoremap tv :call SpeakVisualSelection()

-- installation

-- sudo apt-get install pipx
-- pipx install piper-tts
--
-- sudo mkdir -p /usr/share/piper/voices/en_US
-- cd /usr/share/piper/voices/en_US
-- # sudo wget https://huggingface.co/rhasspy/piper/resolve/main/en_US-jenny-low.onnx # Example for Jenny voice
-- sudo wget https://huggingface.co/rhasspy/piper/resolve/main/en_US-libritts-high.onnx
-- # sudo wget https://huggingface.co/rhasspy/piper/resolve/main/en_US-jenny-low.onnx.json # Corresponding config file
-- sudo wget https://huggingface.co/rhasspy/piper/resolve/main/en_US-libritts-high.onnx.json
-- sudo mkdir -p /usr/share/piper/voices/zh_CN
-- cd /usr/share/piper/voices/zh_CN
--
-- sudo wget "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/zh/zh_CN/huayan/medium/zh_CN-huayan-medium.onnx?download=true" -O zh_CN-huayan-medium.onnx
-- sudo wget "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/zh/zh_CN/huayan/medium/zh_CN-huayan-medium.onnx.json?download=true" -O zh_CN-huayan-medium.onnx.json
--
--
-- sudo wget "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/libritts/high/en_US-libritts-high.onnx?download=true" -O en_US-libritts-high.onnx
-- sudo wget "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/libritts/high/en_US-libritts-high.onnx.json?download=true" -O en_US-libritts-high.onnx.json
--
-- sudo wget "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/amy/medium/en_US-amy-medium.onnx?download=true" -O en_US-amy-medium.onnx
-- sudo wget "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/amy/medium/en_US-amy-medium.onnx.json?download=true" -O en_US-amy-medium.onnx.json
--
-- echo "Hello, this is a test of Piper TTS." | piper --model /usr/share/piper/voices/en_US/en_US-jenny-low.onnx --output_file output.wav
-- aplay output.wav
