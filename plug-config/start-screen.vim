" Fancy custom header
let g:startify_custom_header = [
  \ '   ╻ ╻   ╻   ┏┳┓',
  \ '   ┃┏┛   ┃   ┃┃┃',
  \ '   ┗┛    ╹   ╹ ╹',
  \ '   ',
  \ ]

let g:startify_session_persistence = 0 " Update Session automatically as you exit vim
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_session_autoload = 0
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_files_number = 8       " 'Most Recent Files' number
let g:webdevicons_enable_startify = 1
let g:startify_enable_special = 0

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']                        },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']                     },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
          \ ]

" function! StartifyEntryFormat()
"     return 'WebDevIconsGetFileTypeSymbol(absolute_path)." ".entry_path'
" endfunction

let g:startify_bookmarks = [
    \ { 'v': '~/.config/nvim/init.vim' },
    \ { 'b': '~/.bashrc' }
    \ ]


