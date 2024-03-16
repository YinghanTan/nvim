local M = {
  "David-Kunz/gen.nvim",
}


function M.config()
  require('gen').setup({
    model = "mistral", -- The default model to use.
    host = "localhost", -- The host running the Ollama service.
    port = "11434", -- The port on which the Ollama service is listening.
    display_mode = "float", -- The display mode. Can be "float" or "split".
    show_prompt = false, -- Shows the Prompt submitted to Ollama.
    show_model = true, -- Displays which model you are using at the beginning of your chat session.
    quit_map = "q", -- set keymap for quit
    no_auto_close = false, -- Never closes the window automatically.
    init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
    -- Function to initialize Ollama
    command = function(options)
      return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
    end,
    -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
    -- This can also be a command string.
    -- The executed command must return a JSON object with { response, context }
    -- (context property is optional).
    -- list_models = '<omitted lua function>', -- Retrieves a list of model names
    debug = false -- Prints errors and the command which is run.
  })
  require('gen').prompts['Make_Style'] = {
    prompt = 'Transform the following text into the style of $input1: $text',
    replace = true,
  }
  require('gen').prompts['Elaborate_Text'] = {
    prompt = "Elaborate the following text:\n$text",
    replace = true
  }
  require('gen').prompts['Fix_Code'] = {
    prompt = "Fix the following code. Only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
    replace = true,
    extract = "```$filetype\n(.-)```"
  }

  local wk = require("which-key")
  wk.register {
    mode = { "n", "v" },
    ["<leader><leader>m"] = { ":Gen<CR>", "ml" },
  }
end

return M
