return {

  { "junegunn/fzf", dir = "~/.fzf", build = "./install --all" },
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
    config = function()

        -- [[B]Commits] Customize the options used by 'git log':
        vim.g.fzf_commits_log_options = '--graph --color=always --pretty=oneline --format="%C(auto)%h%d %C(auto)%s%Creset %C(white)%C(bold)%cr %C(auto)%C(blue)%an"'

        -- [Tags] Command to generate tags file
        vim.g.fzf_tags_command = 'ctags -R'

        -- [Commands] --expect expression for directly executing the command
        vim.g.fzf_commands_expect = 'alt-enter,ctrl-x'


        -- Enable per-command history.
        vim.g.fzf_history_dir = '~/.local/share/fzf-history'


      vim.cmd([[
        " Ctrl-A Ctrl-Q to select all and build quickfix list
        function! s:build_quickfix_list(lines)
          call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
          copen
          cc
        endfunction


        " Border color
        let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'rounded' } }
        let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline --border --bind="ctrl-a:toggle-all,ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,ctrl-/:toggle-preview,ctrl-w:toggle-preview-wrap,ctrl-n:half-page-down,ctrl-p:half-page-up"'
        let $FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git" '

        let g:fzf_preview_window = ['right,70%,nowrap,nocycle,nohidden', 'ctrl-/']

        " This is the default extra key bindings
        let g:fzf_action = {
          \ 'ctrl-q': function('s:build_quickfix_list'),
          \ 'ctrl-t': 'tab split', 
          \ 'ctrl-x': 'vsplit',     
          \ 'ctrl-s': 'split',     
          \ 'ctrl-v': 'vsplit',
          \ 'ctrl-y': {lines -> setreg('+', join(lines, "\n"))}}
        " add to quickfix_list after selecting file
        " open in new tab after selecting file
        " open in new split after selecting file
        " Open in vertical split after selecting file


        " Customize fzf colors to match your color scheme
        let g:fzf_colors =
        \ { 'fg':      ['fg', 'Normal'],
        \ 'bg':      ['bg', 'Normal'],
        \ 'hl':      ['fg', 'Comment'],
        \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
        \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
        \ 'hl+':     ['fg', 'Statement'],
        \ 'info':    ['fg', 'PreProc'],
        \ 'border':  ['fg', 'Ignore'],
        \ 'prompt':  ['fg', 'Conditional'],
        \ 'pointer': ['fg', 'Exception'],
        \ 'marker':  ['fg', 'Keyword'],
        \ 'spinner': ['fg', 'Label'],
        \ 'header':  ['fg', 'Comment'] }

        "Get Files
        command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

        " Get text in files with Rg
        command! -bang -nargs=* Rg
          \ call fzf#vim#grep(
          \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
          \   fzf#vim#with_preview(), <bang>0)

        " Ripgrep advanced
        function! RipgrepFzf(query, fullscreen)
          let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
          let initial_command = printf(command_fmt, shellescape(a:query))
          let reload_command = printf(command_fmt, '{q}')
          let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
          call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
        endfunction

        command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

        " Git grep
        command! -bang -nargs=* GGrep
          \ call fzf#vim#grep(
          \   'git grep --line-number '.shellescape(<q-args>), 0,
          \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

        " command! -bang -nargs=? -complete=dir FindNotes
        "     \ call fzf#vim#files('~/vimwiki', fzf#vim#with_preview(), <bang>0)

        " Ripgrep Notes
        function! RipgrepNotes(query, fullscreen)
          let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
          let initial_command = printf(command_fmt, shellescape(a:query))
          let reload_command = printf(command_fmt, '{q}')
          let spec = {'dir': '~/vimwiki/notes', 'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
          call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
        endfunction

        command! -nargs=* -bang GrepNotes call RipgrepNotes(<q-args>, <bang>0)

        " command! -bang Args call fzf#run(fzf#wrap('args',
        "     \ {'source': map([argidx()]+(argidx()==0?[]:range(argc())[0:argidx()-1])+range(argc())[argidx()+1:], 'argv(v:val)')}, <bang>0))

        command! -bang Args call fzf#run(fzf#wrap('args',
            \ {'source': argv()}, <bang>0))

        function! Changes()
          let changefile=tempname()
          let changenumfile=tempname()

          let changes  = reverse(copy(getchangelist()[0]))

          " Write changes to temp file with: changenumber, line number, line number - 15, file name
          let offset = &lines / 2
          let changetext = map(copy(changes), { index, val -> 
            \ (val.lnum)."\t".(val.lnum < offset ? 1 : val.lnum - offset)."\t".(val.col+1)."\t".trim(getline(val.lnum)) })
          call writefile(changetext, changefile)

          execute 'silent !fzf --preview "bat % -H {+1} -r {+2}: --color=always" < '.changefile.' > '.changenumfile
          call delete(changefile)

          " Read fzf output and goto change
          let changenumber=readfile(changenumfile)
          call delete(changenumfile)
          if(len(changenumber) > 0)
            let values = split(changenumber[0], "\t")
            call cursor(str2nr(values[0]), str2nr(values[2]))
          endif
          redraw!

        endfunction

        command! Changes call Changes()

      ]])
    end,
  },

}

