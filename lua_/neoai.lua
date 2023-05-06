local whichkey = require("which-key")
local status_ok, neoai = pcall(require, "neoai")
if not status_ok then
    return
end
neoai.setup({
    -- Below are the default options, feel free to override what you would like changed
    ui = {
        output_popup_text = "NeoAI",
        input_popup_text = "Prompt",
        width = 30,               -- As percentage eg. 30%
        output_popup_height = 80, -- As percentage eg. 80%
        submit = "<Enter>",       -- Key binding to submit the prompt
    },
    models = {
        {
            name = "openai",
            model = "gpt-3.5-turbo",
            params = nil,
        },
    },
    register_output = {
        ["g"] = function(output)
            return output
        end,
        ["c"] = require("neoai.utils").extract_code_snippets,
    },
    inject = {
        cutoff_width = 75,
    },
    prompts = {
        context_prompt = function(context)
            return "Hey, I'd like to provide some context for future "
                .. "messages. Here is the code/text that I want to refer "
                .. "to in our upcoming conversations:\n\n"
                .. context
        end,
    },
    mappings = {
        ["select_up"] = "<C-k>",
        ["select_down"] = "<C-j>",
    },
    open_api_key_env = "OPENAI_API_KEY",
    shortcuts = {
        {
            name = "textify",
            key = "<leader>aas",
            desc = "fix text with AI",
            use_context = true,
            prompt = [[
                Please rewrite the text to make it more readable, clear,
                concise, and fix any grammatical, punctuation, or spelling
                errors
            ]],
            modes = { "v" },
            strip_function = nil,
        },
        {
            name = "gitcommit",
            key = "<leader>aag",
            desc = "generate git commit message",
            use_context = false,
            prompt = function()
                return [[
                    Using the following git diff generate a consise and
                    clear git commit message, with a short title summary
                    that is 75 characters or less:
                ]] .. vim.fn.system("git diff --cached")
            end,
            modes = { "n" },
            strip_function = nil,
        },
    },
})

local keymap_na = {
    a = {
        name = "ai",
        q = { "<cmd>NeoAIToggle<CR>", "Query" },
        c = { "<cmd>NeoAIContext<cr>", "Context" },
        s = { "Fix text with ai" },
        g = {"generate git commit message" },
    },
}

local keymap_va = {
    a = {
        name = "ai",
        q = { ":'<,'>NeoAIToggle<cr>", "Query" },
        c = { ":'<,'>NeoAIContext<cr>", "Context" },
        s = { "Fix text with ai" },
    },
}

local opts = {
    mode = "n",     -- NORMAL mode
    prefix = "<leader>a",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = false, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap`
    nowait = true,  -- use `nowait` when creating keympas
}
local vopts = {
    mode = "v",     -- VISUAL mode
    prefix = "<leader>a",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = false, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true,  -- use `nowait` when creating keymaps
}
whichkey.register(keymap_na, opts)
whichkey.register(keymap_va, vopts)
