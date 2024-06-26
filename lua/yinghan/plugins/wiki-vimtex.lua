return {
  "lervag/vimtex",
  event = {"Bufenter *.md", "Bufenter *.tex"},
  config = function()
    vim.g.tex_flavor='latex'
    vim.g.livepreview_previewer = 'zathura'
    vim.g.vimtex_view_method = 'zathura'
    vim.g.auto_save_in_insert_move = 0
    vim.g.vimtex_quickfix_mode = 0
    vim.g.tex_conceal = 'abdmg'

    vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
    vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"

    -- " Inkscape Figures shortcuts (optimized for Markdown)
    -- nnoremap <C-f> :exec '.!~/scripts/vim/ink.py %:r "'.getline(".").'"' <Esc>

    -- "Optimized note-taking with LaTeX
    -- nnoremap <Leader>t <Esc>:silent exec '!xelatex -interaction=nonstopmode master.tex > /dev/null 2>&2 &' <Esc>:redraw!<CR>
    -- autocmd FileType tex nmap <buffer> <C-T> :!xelatex %<CR>

    -- Math Zone 
    -- vim.cmd("autocmd BufNewFile,BufRead *.md call vimtex#init()")
    vim.cmd("autocmd BufNewFile,BufRead *.md so $VIMRUNTIME/syntax/tex.vim")

    -- add which-key mapping descriptions for VimTex
    vim.api.nvim_create_autocmd("FileType", {
      desc = "Set up VimTex Which-Key descriptions",
      group = vim.api.nvim_create_augroup("vimtex_mapping_descriptions", { clear = true }),
      pattern = {"tex", "bib"},
      callback = function(event)
        local wk = require("which-key")
        local opts = {
          mode = "n", -- NORMAL mode
          buffer = event.buf, -- Specify a buffer number for buffer local mappings to show only in tex buffers
        }
        local mappings = {
          ["<localleader>l"] = {
            name = "+vimtex",
            a = "Show Context Menu",
            C = "Full Clean",
            c = "Clean",
            e = "Show Errors",
            G = "Show Status for All",
            g = "Show Status",
            i = "Show Info",
            I = "Show Full Info",
            k = "Stop VimTeX",
            K = "Stop All VimTeX",
            L = "Compile Selection",
            l = "Compile",
            m = "Show Imaps",
            o = "Show Compiler Output",
            q = "Show VimTeX Log",
            s = "Toggle Main",
            t = "Open Table of Contents",
            T = "Toggle Table of Contents",
            v = "View Compiled Document",
            X = "Reload VimTeX State",
            x = "Reload VimTeX",
          },
          ["ts"] = {
            name = "VimTeX Toggles & Cycles", -- optional group name
            ["$"] = "Cycle inline, display & numbered equation",
            c = "Toggle star of command",
            d = "Cycle (), \\left(\\right) [,...]",
            D = "Reverse Cycle (), \\left(\\right) [, ...]",
            e = "Toggle star of environment",
            f = "Toggle a/b vs \\frac{a}{b}",
          },
          ["[/"] = "Previous start of a LaTeX comment",
          ["[*"] = "Previous end of a LaTeX comment",
          ["[["] = "Previous beginning of a section",
          ["[]"] = "Previous end of a section",
          ["[m"] = "Previous \\begin",
          ["[M"] = "Previous \\end",
          ["[n"] = "Previous start of a math zone",
          ["[N"] = "Previous end of a math zone",
          ["[r"] = "Previous \\begin{frame}",
          ["[R"] = "Previous \\end{frame}",
          ["]/"] = "Next start of a LaTeX comment %",
          ["]*"] = "Next end of a LaTeX comment %",
          ["]["] = "Next beginning of a section",
          ["]]"] = "Next end of a section",
          ["]m"] = "Next \\begin",
          ["]M"] = "Next \\end",
          ["]n"] = "Next start of a math zone",
          ["]N"] = "Next end of a math zone",
          ["]r"] = "Next \\begin{frame}",
          ["]R"] = "Next \\end{frame}",
          ["cs"] = {
            c = "Change surrounding command",
            e = "Change surrounding environment",
            ["$"] = "Change surrounding math zone",
            d = "Change surrounding delimiter",
          },
          ["ds"] = {
            c = "Delete surrounding command",
            e = "Delete surrounding environment",
            ["$"] = "Delete surrounding math zone",
            d = "Delete surrounding delimiter",
          },
        }
        wk.register(mappings, opts)
        -- VimTeX Text Objects without variants with targets.vim
        opts = {
          mode = "o", -- Operator pending mode
          buffer = event.buf,
        }
        local objects = {
          ["ic"] = [[LaTeX Command]],
          ["ac"] = [[LaTeX Command]],
          ["id"] = [[LaTeX Math Delimiter]],
          ["ad"] = [[LaTeX Math Delimiter]],
          ["ie"] = [[LaTeX Environment]],
          ["ae"] = [[LaTeX Environment]],
          ["i$"] = [[LaTeX Math Zone]],
          ["a$"] = [[LaTeX Math Zone]],
          ["iP"] = [[LaTeX Section, Paragraph, ...]],
          ["aP"] = [[LaTeX Section, Paragraph, ...]],
          ["im"] = [[LaTeX Item]],
          ["am"] = [[LaTeX Item]],
        }
        wk.register(objects, opts)
      end,
    })
  end
}
