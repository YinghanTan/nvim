" --- Indentation ---
filetype plugin indent on
set tabstop=2 softtabstop=2     " tab stop 2 spaces, distance of each space 1
set shiftwidth=2                " displacement of each shift is 2 spaces
set nosmarttab                    " Be smart when using tabs
set expandtab                   " tabs are spaces
set nosmartindent                 " intelligently adjust the indentation level based on the code's syntax. 
set autoindent                  " apply indentation of current line to next line
set nowrap                      " text do not get wrappped around at the end of the line

" html
autocmd Filetype html set tabstop=2     " a hard TAB displays as 2 columns
autocmd Filetype html set softtabstop=2 " insert/delete 2 spaces when hitting a TAB/BACKSPACE
autocmd Filetype html set shiftwidth=2  " operation >> indents 2 columns; << unindents 4 columns
autocmd Filetype html set shiftround    " round indent to multiple of 'shiftwidth'

" css
autocmd Filetype css set tabstop=2     " a hard TAB displays as 2 columns
autocmd Filetype css set softtabstop=2 " insert/delete 2 spaces when hitting a TAB/BACKSPACE
autocmd Filetype css set shiftwidth=2  " operation >> indents 2 columns; << unindents 4 columns
autocmd Filetype css set shiftround    " round indent to multiple of 'shiftwidth'

" lua
autocmd Filetype lua set tabstop=2     " a hard TAB displays as 2 columns
autocmd Filetype lua set softtabstop=2 " insert/delete 2 spaces when hitting a TAB/BACKSPACE
autocmd Filetype lua set shiftwidth=2  " operation >> indents 2 columns; << unindents 4 columns
autocmd Filetype lua set shiftround    " round indent to multiple of 'shiftwidth'

" jst
au BufNewFile,BufRead *.handlebars setlocal filetype=jst
au BufNewFile,BufRead *.ejs set filetype=jst
autocmd Filetype jst setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype jst set shiftround        " round indent to multiple of 'shiftwidth'

" Makefiles formatting
autocmd FileType make setlocal noexpandtab

" Yaml Formatting
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab

" Javascript Settings
au BufNewFile,BufRead *.jsx setlocal filetype=javascriptreact
autocmd Filetype javascriptreact setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype javascriptreact set shiftround                " round indent to multiple of 'shiftwidth'
autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype javascript set tabstop=2                      " a hard TAB displays as 2 columns
autocmd Filetype javascript set softtabstop=2                  " insert/delete 2 spaces when hitting a TAB/BACKSPACE
autocmd Filetype javascript set shiftwidth=2                   " operation >> indents 2 columns; << unindents 4 columns
autocmd Filetype javascript set expandtab                      " insert spaces when hitting TABs
autocmd Filetype javascript set shiftround                     " round indent to multiple of 'shiftwidth'

" Javascript Settings
au BufNewFile,BufRead *.jsx setlocal filetype=javascriptreact
autocmd Filetype js setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype js set tabstop=2                             " a hard TAB displays as 2 columns
autocmd Filetype js set softtabstop=2                         " insert/delete 2 spaces when hitting a TAB/BACKSPACE
autocmd Filetype js set shiftwidth=2                          " operation >> indents 2 columns; << unindents 4 columns
autocmd Filetype js set expandtab                             " insert spaces when hitting TABs
autocmd Filetype js set shiftround                            " round indent to multiple of 'shiftwidth'

" vimwiki Settings
" au BufNewFile,BufRead *.jsx setlocal filetype=vimwiki
autocmd Filetype vimwiki setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype vimwiki set tabstop=2                             " a hard TAB displays as 4 columns
autocmd Filetype vimwiki set softtabstop=2                         " insert/delete 4 spaces when hitting a TAB/BACKSPACE
autocmd Filetype vimwiki set shiftwidth=2                          " operation >> indents 4 columns; << unindents 4 columns
autocmd Filetype vimwiki set expandtab                             " insert spaces when hitting TABs
autocmd Filetype vimwiki set shiftround                            " round indent to multiple of 'shiftwidth'
" autocmd Filetype vimwiki set nosma                            " round indent to multiple of 'shiftwidth'

" --- OS Configuration ---
if has('unix')
    let s:uname = system("uname")
    call system("command -v termux-setup-storage")
    if s:uname == "Darwin\n"
        " Do Mac stuff here
        let g:system = 'mac'
        let g:python3_host_prog='$HOME/.pyenv/versions/3.9.9/bin/python3' " ubuntu
        let g:node_host_prog = '$HOME/.nvm/versions/node/v16.9.0/lib/node_modules/neovim/bin/cli.js' " Mac
    elseif exists("$WSL_DISTRO_NAME")
        " Do wsl stuff here
        let g:system = 'wsl'
        let g:python3_host_prog='$HOME/.pyenv/versions/3.9.9/bin/python3' " ubuntu
        let g:node_host_prog = '$HOME/.nvm/versions/node/v16.13.1/lib/node_modules/neovim/bin/cli.js' " Ubuntu
    elseif v:shell_error == 0
        " Do termux stuff here
        let g:system = 'termux'
        let s:termux_prefix = '/data/data/com.termux/files/usr'
        let g:python3_host_prog='/data/data/com.termux/files/usr/bin/python3' " ubuntu
        let g:node_host_prog = '/data/data/com.termux/files/usr/lib/node_modules/neovim/bin/cli.js' " Ubuntu
    else
        " Do Linux stuff here
        let g:system = 'linux'
        let g:python3_host_prog='$HOME/.pyenv/versions/3.9.9/bin/python3' " ubuntu
        let g:node_host_prog = '$HOME/.nvm/versions/node/v16.13.1/lib/node_modules/neovim/bin/cli.js' " Ubuntu
    endif
elseif has('win32')
    " Do Windows stuff here
    let g:system = 'windows'
endif
" --- --- ---

" Python
autocmd Filetype python set tabstop=4         " a hard TAB displays as 4 columns
autocmd Filetype python set softtabstop=4     " insert/delete 4 spaces when hitting a TAB/BACKSPACE
autocmd Filetype python set shiftwidth=4      " operation >> indents 4 columns; << unindents 4 columns
autocmd Filetype python set expandtab         " insert spaces when hitting TABs
autocmd Filetype python set autoindent        " align the new line indent with the previous line
autocmd Filetype python set shiftround        " round indent to multiple of 'shiftwidth'
autocmd Filetype python set fileformat=unix   " round indent to multiple of 'shiftwidth'
" Flagging Unnecessary Whitespace
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Html Django Settings
autocmd Filetype htmldjango setlocal ts=2 sts=2 sw=2 expandtab

" Typescript settings
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
autocmd Filetype typescript set tabstop=2             " a hard TAB displays as 2 columns
autocmd Filetype typescript set softtabstop=2         " insert/delete 2 spaces when hitting a TAB/BACKSPACE
autocmd Filetype typescript set shiftwidth=2          " operation >> indents 2 columns; << unindents 2 columns
autocmd Filetype typescript set expandtab             " insert spaces when hitting TABs
autocmd Filetype typescript set autoindent            " align the new line indent with the previous line
autocmd Filetype typescript set shiftround            " round indent to multiple of 'shiftwidth'

autocmd Filetype typescript.tsx set tabstop=2         " a hard TAB displays as 2 columns
autocmd Filetype typescript.tsx set softtabstop=2     " insert/delete 2 spaces when hitting a TAB/BACKSPACE
autocmd Filetype typescript.tsx set shiftwidth=2      " operation >> indents 2 columns; << unindents 2 columns
autocmd Filetype typescript.tsx set expandtab         " insert spaces when hitting TABs
autocmd Filetype typescript.tsx set autoindent        " align the new line indent with the previous line
autocmd Filetype typescript.tsx set shiftround        " round indent to multiple of 'shiftwidth'

" Git Settings
autocmd FileType gitcommit set textwidth=80 " lines longer than 72 columns will be broken
" In Git commit messages, also colour the 51st column (for titles)
autocmd FileType gitcommit set colorcolumn+=51

" Ruby Settings
" let g:ruby_host_prog='/opt/homebrew/opt/ruby/bin/ruby'
let g:loaded_ruby_provider = 0

" Perl Settings
let g:loaded_perl_provider = 0

" json
autocmd Filetype json set tabstop=2         " a hard TAB displays as 2 columns
autocmd Filetype json set softtabstop=2     " insert/delete 2 spaces when hitting a TAB/BACKSPACE
autocmd Filetype json set shiftwidth=2      " operation >> indents 2 columns; << unindents 2 columns
autocmd Filetype json set expandtab         " insert spaces when hitting TABs
autocmd Filetype json set autoindent        " align the new line indent with the previous line
autocmd Filetype json set shiftround        " round indent to multiple of 'shiftwidth'

" Bash Settings
au BufNewFile,BufRead *.sh setlocal filetype=sh
autocmd Filetype sh setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype sh set tabstop=2                      " a hard TAB displays as 2 columns
autocmd Filetype sh set softtabstop=2                  " insert/delete 2 spaces when hitting a TAB/BACKSPACE
autocmd Filetype sh set shiftwidth=2                   " operation >> indents 2 columns; << unindents 4 columns
autocmd Filetype sh set expandtab                      " insert spaces when hitting TABs
autocmd Filetype sh set shiftround                     " round indent to multiple of 'shiftwidth'

" zsh Settings
au BufNewFile,BufRead *.zsh setlocal filetype=zsh
autocmd Filetype zsh setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype zsh set tabstop=2                      " a hard TAB displays as 2 columns
autocmd Filetype zsh set softtabstop=2                  " insert/delete 2 spaces when hitting a TAB/BACKSPACE
autocmd Filetype zsh set shiftwidth=2                   " operation >> indents 2 columns; << unindents 4 columns
autocmd Filetype zsh set expandtab                      " insert spaces when hitting TABs
autocmd Filetype zsh set shiftround                     " round indent to multiple of 'shiftwidth'

" LaTeX
au BufNewFile,BufRead *.tex,*.sty,*.cls setlocal filetype=tex
autocmd Filetype tex setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype tex set tabstop=2                      " a hard TAB displays as 2 columns
autocmd Filetype tex set softtabstop=2                  " insert/delete 2 spaces when hitting a TAB/BACKSPACE
autocmd Filetype tex set shiftwidth=2                   " operation >> indents 2 columns; << unindents 4 columns
autocmd Filetype tex set expandtab                      " insert spaces when hitting TABs
autocmd Filetype tex set shiftround                     " round indent to multiple of 'shiftwidth'
setlocal autoindent
let g:tex_indent_items=0
let g:tex_indent_and=0
let g:tex_indent_brace=0

" dart Settings
" au BufNewFile,BufRead *.dart setlocal filetype=dart
autocmd Filetype dart set tabstop=2                      " a hard TAB displays as 2 columns
autocmd Filetype dart set softtabstop=2                  " insert/delete 2 spaces when hitting a TAB/BACKSPACE
autocmd Filetype dart set shiftwidth=2                   " operation >> indents 2 columns; << unindents 4 columns
autocmd Filetype dart set expandtab                      " insert spaces when hitting TABs
autocmd Filetype dart set shiftround                     " round indent to multiple of 'shiftwidth'
autocmd Filetype dart set autoindent

" Disable F1 for Help Menu
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>

" Add all TODO items to the quickfix list relative to where you opened Vim.
function! s:todo() abort
  let entries = []
  for cmd in ['git grep -niIw -e TODO -e FIXME 2> /dev/null',
            \ 'grep -rniIw -e TODO -e FIXME . 2> /dev/null']
    let lines = split(system(cmd), '\n')
    if v:shell_error != 0 | continue | endif
    for line in lines
      let [fname, lno, text] = matchlist(line, '^\([^:]*\):\([^:]*\):\(.*\)')[1:3]
      call add(entries, { 'filename': fname, 'lnum': lno, 'text': text })
    endfor
    break
  endfor
  if !empty(entries)
    call setqflist(entries)
    copen
  endif
endfunction
command! Todo call s:todo()

" Profile Vim by running this command once to start it and again to stop it.
function! s:profile(bang)
  if a:bang
    profile pause
    noautocmd qall
  else
    profile start /tmp/profile.log
    profile func *
    profile file *
  endif
endfunction
command! -bang Profile call s:profile(<bang>0)
