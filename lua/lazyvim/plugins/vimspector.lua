return {
  {
    "puremourning/vimspector",
    lazy = false,
    init = function()
      vim.g.vimspector_enable_mappings = "HUMAN"
      vim.g.vimspector_base_dir = "/home/yinghan/.local/share/nvim/lazy/vimspector"
    end,
    config = function()
      vim.cmd([[
      func! AddToWatch()
          let word = expand("<cexpr>")
          call vimspector#AddWatch(word)
      endfunction
      ]])

      -- let g:vimspector_base_dir = expand('$HOME/.config/nvim/vimspector-config')

      -- stylua: ignore start
      -- mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)
      -- for normal mode - the word under the cursor

      vim.keymap.set({ "n", "x" }, "<leader>di", "<Plug>VimspectorBalloonEval")
      -- nmap <leader>dv :call vimspector#Launch()<CR>
      -- nnoremap <leader>dd :call vimspector#Launch()<CR>
      -- nmap <leader>dD :VimspectorReset<CR>
      -- nmap <leader>de :VimspectorEval
      -- nmap <leader>dw :VimspectorWatch
      -- nmap <leader>do :VimspectorShowOutput

      vim.g.vimspector_install_gadgets = { "debugpy@1.6.3", "debugger-for-chrome", "CodeLLDB", "vscode-node-debug2" }
    end,
  },
}
