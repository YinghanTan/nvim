
fun! GoToWindow(id)
    call win_gotoid(a:id)
    " MaximizerToggle
endfun


" Leader Key Maps

" Timeout
let g:which_key_timeout = 100
let g:which_key_display_names = {'<CR>': '↵', '<TAB>': '⇆'}


" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

let g:which_key_map =  {}    " Create map to add keys to
let g:which_key_sep = '→'    " Define a separator

" Coc Search & refactor
nnoremap <leader>? :CocSearch <C-R>=expand("<cword>")<CR><CR>
let g:which_key_map['?'] = 'search word'

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0
let g:which_key_max_size = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler


" Single mappings
let g:which_key_map['/'   ] = [ ':let @/ = ""'                        , 'Clear highlight'    ]
let g:which_key_map['.'   ] = [ ':tabnew | e $MYVIMRC'                , 'open init'          ]
let g:which_key_map[';'   ] = [ ':Commands'                           , 'commands'           ]
" let g:which_key_map['q' ] = [ '<Plug>(coc-fix-current)'           , 'quickfix'             ]
" let g:which_key_map['u' ] = [ ':UndotreeToggle'                   , 'undo tree'            ]
" let g:which_key_map['T' ] = [ ':TSHighlightCapturesUnderCursor'   , 'treesitter highlight' ]
" let g:which_key_map['W' ] = [ ':call WindowSwap#EasyWindowSwap()' , 'move window'          ]
" let g:which_key_map['n' ] = [ ':let @/ = ""'                      , 'no highlight'         ]


" Group mappings


" a is for actions
let g:which_key_map.a = {
      \ 'name' : '+actions'                 ,
      \ 'c' : [':ColorizerToggle'           , 'colorizer'               ] ,
      \ 'C' : [':cd %:p:h<cr>:pwd<cr>'      , 'set current directory'   ] ,
      \ 's' : [':source $MYVIMRC'           , 'source init'             ] ,
      \ 'S' : [':CocCommand swagger.render' , 'swagger'                 ] ,
      \ 'g' : [':IndentGuidesToggle<CR>'    , 'indent Guide'            ] ,
      \ 'm' : ['<Plug>MarkdownPreview'      , 'markdown preview toggle' ] ,
      \ 'M' : ['<Plug>MarkdownPreviewStop'  , 'markdown preview stop'   ] ,
      \ 'v' : [':Codi'                      , 'virtual repl on'         ] ,
      \ 'V' : [':Codi!'                     , 'virtual repl off'        ] ,
      \ }
      " \ 'l' : [':Bracey'                    , 'start live server'       ] ,
      " \ 'L' : [':BraceyStop'                , 'stop live server'        ] ,
      " \ 't' : [':FloatermToggle'         , 'terminal'],
      " \ 'w' : [':StripWhitespace'        , 'strip whitespace'],

" c is for code
let g:which_key_map.c = {
      \ 'name' : '+code'         ,
      \ 'l' : [':LeetCodeList'   , 'list'    ] ,
      \ 't' : [':LeetCodeTest'   , 'test'    ] ,
      \ 's' : [':LeetCodeSubmit' , 'submit'  ] ,
      \ 'i' : [':LeetCodeSignIn' , 'sign in' ] ,
      \ }
      " \ 't' : [':FloatermToggle'         , 'terminal'],
      " \ 'w' : [':StripWhitespace'        , 'strip whitespace'],



" d is for debug
let g:which_key_map.d = {
      \ 'name' : '+debug'                                    ,
      \ 'b' : ['<Plug>VimspectorToggleBreakpoint'            , 'breakpoint'             ] ,
      \ 'B' : {
        \ 'name': '+breakpoint options',
        \ 'd' : [':call vimspector#ClearBreakpoints()'     , 'remove all breakpoints'    ]  ,
        \ 'f' : ['<Plug>VimspectorAddFunctionBreakpoint' , 'func breakpoint'             ]  ,
        \ 'c' : ['<Plug>VimspectorToggleConditionalBreakpoint' , 'conditional breakpoint']  ,
        \ },
      \ 'c' : ['<Plug>VimspectorContinue | zz'                    , 'continue'               ] ,
      \ 'C' : ['<Plug>VimspectorRunToCursor | zz'                 , 'run to cursor'          ] ,
      \ 'D' : [':call vimspector#Launch()<CR>'               , 'debug'                  ] ,
      \ 'e' : [':VimspectorEval'                             , 'evaluate'               ] ,
      \ 'i' : ['<Plug>VimspectorBalloonEval'                 , 'inspect'                ] ,
      \ 'n' : ['<Plug>VimspectorStepOver | zz'                    , 'next'                   ] ,
      \ 's' : ['<Plug>VimspectorStepInto | zz'                    , 'step into'              ] ,
      \ 'S' : ['<Plug>VimspectorStepOut | zz'                     , 'step out'               ] ,
      \ 'v' : {
        \ 'name': '+view',
        \ 'v' : [':call GoToWindow(g:vimspector_session_windows.variables)<CR>'     , 'variables'],
        \ 'w' : [':call GoToWindow(g:vimspector_session_windows.watches)<CR>' , 'watches'],
        \ 's' : [':call GoToWindow(g:vimspector_session_windows.stack_trace)<CR>' , 'stack'],
        \ 't' : [':call GoToWindow(g:vimspector_session_windows.terminal)<CR>' , 'terminal'],
        \ 'T' : [':call GoToWindow(g:vimspector_session_windows.tagpage)<CR>' , 'tag'],
        \ 'o' : [':call GoToWindow(g:vimspector_session_windows.output)<CR>' , 'output'],
        \ 'c' : [':call GoToWindow(g:vimspector_session_windows.code)<CR>' , 'code'],
        \ },
      \ 'u' : ['<Plug>VimspectorUpFrame'                     , 'Up frame'               ] ,
      \ 'd' : ['<Plug>VimspectorDownFrame'                   , 'Down frame'             ] ,
      \ 'p' : ['<Plug>VimspectorPause'                       , 'pause'                  ] ,
      \ 'P' : ['<Plug>VimspectorStop'                        , 'stoP'                   ] ,
      \ 'r' : ['<Plug>VimspectorRestart'                     , 'restart'                ] ,
      \ 'R' : ['VimspectorReset'                             , 'Reset'                  ] ,
      \ 'w' : [':call AddToWatch()<CR>'                      , 'add to watch'           ] ,
      \ 'z' : [':MaximizerToggle'                            , 'maximize window'        ] ,
      \ }

" nmap <leader>dw :VimspectorWatch 
nmap <leader>do :VimspectorShowOutput 
nnoremap <leader>dD :call vimspector#Launch()<CR>
 " debug inspect
" for normal mode - the word under the cursor
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval
nmap <leader>di <Plug>VimspectorBalloonEval


" f is for find and replace
let g:which_key_map.f = {
      \ 'name' : '+find & replace'      ,
      \ 'f' : [':Farr --source=vimgrep' , 'file'    ] ,
      \ 'p' : [':Farr --source=rgnvim'  , 'project' ] ,
      \ }


" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git'                             ,
      \ 'a' : [':Git add .'                         , 'add all'             ] ,
      \ 'A' : [':CocCommand fzf-preview.GitActions' , 'actions'             ] ,
      \ 'b' : [':Git blame'                         , 'blame'               ] ,
      \ 'B' : [':GBrowse'                           , 'browse'              ] ,
      \ 'c' : [':BCommits'                          , 'buffer commits'      ] ,
      \ 'C' : [':Commits'                           , 'commits'             ] ,
      \ 'd' : [':Git diff'                          , 'diff'                ] ,
      \ 'D' : [':Gdiffsplit'                        , 'diff split'          ] ,
      \ 'F' : [':CocCommand git.foldUnchanged'      , 'fold unchanged'      ] ,
      \ 'g' : [':GGrep'                             , 'git grep'            ] ,
      \ 'i' : [':CocCommand git.chunkInfo'          , 'chunk info'          ] ,
      \ 'I' : [':CocCommand git.diffCached'         , 'diff info'           ] ,
      \ 'l' : [':Git log --oneline'                 , 'log'                 ] ,
      \ 'L' : [':Git log'                           , 'log'                 ] ,
      \ 'm' : ['<Plug>(git-messenger)'              , 'message'             ] ,
      \ 'R' : [':GRemove'                           , 'remove'              ] ,
      \ 's' : [':CocCommand git.chunkStage'         , 'stage hunk'          ] ,
      \ 't' : [':CocCommand git.toggleGutters'      , 'toggle signs'        ] ,
      \ 'u' : [':CocCommand git.chunkUndo'          , 'undo hunk'           ] ,
      \ 'v' : [':GV!'                               , 'view buffer commits' ] ,
      \ 'V' : [':GV'                                , 'view commits'        ] ,
      \ 'f' : [':diffget //2'                       , 'diffget left hunk'   ] ,
      \ 'j' : [':diffget //3'                       , 'diffget right hunk'  ] ,
      \ }
        " Vim-Signify
      " \ 'u' : [':SignifyHunkUndo'          , 'undo hunk'           ] ,
      " \ 'h' : [':SignifyToggleHighlight'            , 'highlight hunks'     ] ,
      " \ 't' : [':SignifyToggle'                     , 'toggle signs'        ] ,

      " \ 'd' : [':Git diff'                          , 'diff'                ] ,
      " \ 'D' : [':Gdiffsplit'                        , 'diff split'          ] ,


" :CocCommand fzf-pmeview.BlamePR
      " \ 'S' : [':CocCommand fzf-preview.GitStatus'  , 'status'              ] ,
      " \ 'k' : ['<Plug>(GitGutterPrevHunk)'         , 'prev hunk'],
      " \ 'j' : ['<Plug>(GitGutterNextHunk)'         , 'next hunk'],
      " \ 'A' : [':Git add %'                        , 'add current'],
      " \ 's' : [':G'                                , 'status'],
      " \ 's' : ['<Plug>(GitGutterStageHunk)'         , 'stage hunk'],
      " \ 'H' : ['<Plug>(GitGutterPreviewHunk)'       , 'preview hunk'],

" G is for Gist
let g:which_key_map.G = {
      \ 'name' : '+gist'   ,
      \ 'a' : [':Gist -a'  , 'post gist anon'        ] ,
      \ 'b' : [':Gist -b'  , 'post gist browser'     ] ,
      \ 'd' : [':Gist -d'  , 'delete gist'           ] ,
      \ 'e' : [':Gist -e'  , 'edit gist'             ] ,
      \ 'i' : [':Gist -b'  , 'post gist'             ] ,
      \ 'l' : [':Gist -l'  , 'list public gists'     ] ,
      \ 's' : [':Gist -ls' , 'list starred gists'    ] ,
      \ 'm' : [':Gist -m'  , 'post gist all buffers' ] ,
      \ 'P' : [':Gist -P'  , 'post public gist '     ] ,
      \ 'p' : [':Gist -p'  , 'post private gist '    ] ,
      \ }

" k is for cheat.sh
" TODO




" l is for language server protocol
let g:which_key_map.l = {
      \ 'name' : '+lsp'                                        ,
      \ '.' : [':tabnew | CocConfig'                           , 'config'                                          ] ,
      \ ';' : ['<Plug>(coc-refactor)'                          , 'refactor'                                        ] ,
      \ 'a' : ['<Plug>(coc-codeaction)'                        , 'line action'                                     ] ,
      \ 'A' : ['<Plug>(coc-codeaction-selected)'               , 'selected action'                                 ] ,
      \ 'c' : [':CocFzfList commands'                          , 'commands'                                        ] ,
      \ 'd' : [':CocCommand fzf-preview.CocCurrentDiagnostics' , 'diagnostics current'                             ] ,
      \ 'D' : [':CocCommand fzf-preview.CocDiagnostics'        , 'diagnostics'                                     ] ,
      \ 'e' : [':CocFzfList extensions'                        , 'extensions'                                      ] ,
      \ 'f' : ['<Plug>(coc-format)'                            , 'format'                                          ] ,
      \ 'F' : ['<Plug>(coc-format-selected)'                   , 'format selected'                                 ] ,
      \ 'g' : [':CocCommand rest-client.request'               , 'get/request'                                     ] ,
      \ 'i' : [":call CocAction('runCommand', 'editor.action.organizeImport')" , 'organise imports'                ] ,
      \ 'q' : ['<Plug>(coc-fix-current)'                       , 'quickfix'                                        ] ,
      \ 'r' : ['<Plug>(coc-rename)'                            , 'rename'                                          ] ,
      \ 'R' : [':CocRestart'                                   , 'restart CoC'                                     ] ,
      \ 's' : [':CocFzfList -I symbols'                        , 'references'                                      ] ,
      \ 'u' : [':CocFzfListResume'                             , 'resume list'                                     ] ,
      \ 'U' : [':CocUpdate'                                    , 'update CoC'                                      ] ,
      \ 'z' : [':CocDisable'                                   , 'disable CoC'                                     ] ,
      \ 'Z' : [':CocEnable'                                    , 'enable CoC'                                      ] ,
      \ }
      " \ 'o' : ['<Plug>(coc-openlink)'                , 'open link'],
      " <C-w>p jump in and out of floating notifications
      " \ 'b' : [':CocNext'                            , 'next action'],
      " \ 'B' : [':CocPrev'                            , 'prev action'],

" n is for NerdTree
let g:which_key_map.n = {
      \ 'name' : '+nerdtree'           ,
      \ 't' : [':NERDTreeToggle'       , 'NerdTree Toggle'        ] ,
      \ 'b' : [':NERDTreeFromBookmark' , 'NerdTree From Bookmark' ] ,
      \ 'f' : [':NERDTreeFind'         , 'NerdTree Find'          ] ,
      \ }

let g:which_key_map.o = {
      \ 'name' : 'Obsess'     ,
      \ 's' : [':Obsess<CR>'  , ':Obsess'  ] ,
      \ 'S' : [':Obsess!<CR>' , ':Obsess!' ] ,
      \ }


let g:which_key_map.q = {
      \ 'name' : 'QuickFix'      ,
      \ 'i' : [':CocDiagnostics' , 'Diagnostics'          ] ,
      \ 'l' : [':lopen'          , 'LocalFix'             ] ,
      \ 'L' : [':lclose'         , 'close LocalFix'       ] ,
      \ 't' : [':Todo'           , 'Add todo to quickfix' ] ,
      \ 'q' : [':copen'          , 'QuickFix'             ] ,
      \ 'Q' : [':cclose'         , 'close QuickFix'       ] ,
      \ }
      " " Use unimpaired shortcuts instead [q ]q [l ]l
      " \ 'j' : [':cnext',   'Cnext'],
      " \ 'k' : [':cprev',  'Cprev'],
      " \ 'n' : [':lnext',   'lnext'],
      " \ 'p' : [':lprev',  'lprev'],


" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search'                                     ,
      \ '/' : [':History/'                                     , 'history'            ]    ,
      \ ';' : [':Commands'                                     , 'commands'           ]    ,
      \ 'a' : [':Ag'                                           , 'text Ag'            ]    ,
      \ 'b' : [':Buffers'                                      , 'all buffers'        ]    ,
      \ 'c' : [':BCommits'                                     , 'buffer commits'     ]    ,
      \ 'C' : [':Commits'                                      , 'commits'            ]    ,
      \ 'D' : [':CocCommand fzf-preview.Changes'               , 'delta/changes'      ]    ,
      \ 'f' : [':Files'                                        , 'files'              ]    ,
      \ 'g' : [':GFiles'                                       , 'git files'          ]    ,
      \ 'G' : [':GFiles?'                                      , 'modified git files' ]    ,
      \ 'h' : [':History'                                      , 'file history'       ]    ,
      \ 'H' : [':History:'                                     , 'command history'    ]    ,
      \ 'i' : [':CocCommand fzf-preview.CocCurrentDiagnostics' , 'diagnostics'        ]    ,
      \ 'I' : [':CocCommand fzf-preview.CocDiagnostics'        , 'all diagnostics'    ]    ,
      \ 'j' : [':CocCommand fzf-preview.Jumps'                 , 'jumps'              ]    ,
      \ 'k' : [':Cheat'                                        , 'cheat.sh'           ]    ,
      \ 'l' : [':Lines'                                        , 'lines'              ]    ,
      \ 'L' : [':BLines'                                       , 'current buffer'     ]    ,
      \ 'm' : [':Marks'                                        , 'marks'              ]    ,
      \ 'M' : [':Maps'                                         , 'normal maps'        ]    ,
      \ 'p' : [':Helptags'                                     , 'help tags'          ]    ,
      \ 'P' : [':Tags'                                         , 'project tags'       ]    ,
      \ 'q' : [':CocCommand fzf-preview.QuickFix'              , 'quickfix list'      ]    ,
      \ 'Q' : [':CocCommand fzf-preview.LocationList'          , 'location list'      ]    ,
      \ 'r' : [':RG'                                           , 'text Rg'            ]    ,
      \ 's' : [':CocList snippets'                             , 'snippets'           ]    ,
      \ 'S' : [':Colors'                                       , 'color schemes'      ]    ,
      \ 't' : [':RG'                                           , 'text Rg'            ]    ,
      \ 'T' : [':BTags'                                        , 'buffer tags'        ]    ,
      \ 'w' : [':Windows'                                      , 'search windows'     ]    ,
      \ 'y' : [':CocFzfList yank'                              , 'list yank'          ]    ,
      \ 'Y' : [':Filetypes'                                    , 'file types'         ]    ,
      \ 'z' : [':FZF'                                          , 'FZF'                ]    ,
      \ }

" " s is for search
" let g:which_key_map.s = {
      " \ 'name' : '+search' ,
      " \ '/' : [':History/'                                      , 'search history'],
      " \ ';' : [':Commands'                                      , 'commands'],
      " \ 'a' : [':Ag'                                            , 'text Ag'],
      " \ 'b' : [':CocCommand fzf-preview.Buffers'                , 'buffers'],
      " \ 'B' : [':CocCommand fzf-preview.AllBuffers'             , 'all buffers'],
      " \ 'c' : [':BCommits'                                      , 'buffer commits'],
      " \ 'C' : [':Commits'                                       , 'commits'],
      " \ 'd' : [':CocCommand fzf-preview.DirectoryFiles'         , 'directories'],
      " \ 'D' : [':CocCommand fzf-preview.Changes'                , 'delta changes'],
      " \ 'f' : [':CocCommand fzf-preview.DirectoryFiles'         , 'files'],
      " \ 'F' : [':Files'                                         , 'project files'],
      " \ 'g' : [':CocCommand fzf-preview.GitFiles'               , 'git files'],
      " \ 'G' : [':CocCommand fzf-preview.GitActions'             , 'git actions'],
      " \ 'h' : ['::CocCommand fzf-preview.GitFilesHistory'       , 'file history'],
      " \ 'H' : [':CocCommand fzf-preview.CommandPalette'         , 'command history'],
      " \ 'i' : [':CocCommand fzf-preview.CocCurrentDiagnostics'  , 'diagnostics'],
      " \ 'I' : [':CocCommand fzf-preview.CocDiagnostics'         , 'all diagnostics'],
      " \ 'j' : [':CocCommand fzf-preview.Jumps'                  , 'jumps'],
      " \ 'l' : [':CocCommand fzf-preview.Lines'                  , 'lines'] ,
      " \ 'L' : [':CocCommand fzf-preview.BufferLines'            , 'Buffer lines'] ,
      " \ 'm' : [':CocCommand fzf-preview.Marks'                  , 'list marks'],
      " \ 'M' : [':Maps'                                          , 'key maps'] ,
      " \ 'p' : [':Helptags'                                      , 'help tags'] ,
      " \ 'P' : [':CocCommand fzf-preview.Ctags'                  , 'project tags'],
      " \ 'q' : [':CocCommand fzf-preview.QuickFix'               , 'quickfix list'],
      " \ 'Q' : [':CocCommand fzf-preview.LocationList'           , 'location list'],
      " \ 'r' : [':Rg'                                            , 'text Rg'],
      " \ 's' : [':CocList snippets'                              , 'Snippets Search'],
      " \ 'S' : [':Colors'                                        , 'color schemes'],
      " \ 't' : [':Ag'                                            , 'text Grep'],
      " \ 'T' : [':CocCommand fzf-preview.BufferTags'             , 'buffer tags'],
      " \ 'w' : [':Windows'                                       , 'search windows'],
      " \ 'y' : [':CocFzfList yank'                               , 'list yank'],
      " \ 'Y' : [':Filetypes'                                     , 'filetypes'],
      " \ 'z' : [':FZF'                                           , 'FZF'],
      " \ }

      " \ 'g' : [':CocCommand fzf-preview.GitFiles'                   , 'git files'],
      " \ 'l' : [':Lines'                       , 'lines'] ,
      " \ 'l' : [':Lines'                       , 'lines'] ,
      " \ 'r' : [':CocCommand fzf-preview.DirectoryFiles'                          , 'text Rg'],
      " \ 'b' : [':Buffers'                     , 'open buffers'],
      " \ 'B' : [':BLines'                      , 'current buffer'],
      " \ 'f' : [':Files'                       , 'files'],
      " \ 'g' : [':GFiles'                      , 'git files'],
      " \ 'm' : [':Marks'                       , 'marks'] ,
      " \ 'M' : [':Maps'                        , 'normal maps'] ,


" TODO fix FZF preview or just move to Telescope
" s is for search powered by telescope

" let g:which_key_map.s = {
"       \ 'name' : '+search' ,
"       \ '.' : [':Telescope filetypes'                   , 'filetypes'],
"       \ ';' : [':Telescope commands'                    , 'commands'],
"       \ 'a' : [':Telescope lsp_code_actions'            , 'code_actions'],
"       \ 'A' : [':Telescope builtin'                     , 'all'],
"       \ 'b' : [':Telescope buffers'                     , 'buffers'],
"       \ 'B' : [':Telescope git_branches'                , 'git_branches'],
"       \ 'd' : [':Telescope lsp_document_diagnostics'    , 'document_diagnostics'],
"       \ 'D' : [':Telescope lsp_workspace_diagnostics'   , 'workspace_diagnostics'],
"       \ 'c' : [':Telescope git_bcommits'                , 'git_bcommits'],
"       \ 'C' : [':Telescope git_bcommits'                , 'git_bcommits'],
"       \ 'f' : [':Telescope find_files'                  , 'files'],
"       \ 'F' : [':Telescope git_files'                   , 'git_files'],
"       \ 'g' : [':Telescope tags'                        , 'tags'],
"       \ 'G' : [':Telescope current_buffer_tags'         , 'buffer_tags'],
"       \ 'h' : [':Telescope command_history'             , 'history'],
"       \ 'H' : [':Telescope help_tags'                   , 'help_tags'],
"       \ 'k' : [':Telescope keymaps'                     , 'keymaps'],
"       \ 'l' : [':Telescope loclist'                     , 'loclist'],
"       \ 'm' : [':Telescope marks'                       , 'marks'],
"       \ 'o' : [':Telescope vim_options'                 , 'vim_options'],
"       \ 'O' : [':Telescope oldfiles'                    , 'oldfiles'],
"       \ 'M' : [':Telescope man_pages'                   , 'man_pages'],
"       \ 'p' : [':Telescope fd'                          , 'fd'],
"       \ 'P' : [':Telescope spell_suggest'               , 'spell_suggest'],
"       \ 's' : [':CocFzfList snippets'                   , 'snippets'],
"       \ 'S' : [':Telescope grep_string'                 , 'grep_string'],
"       \ 't' : [':Telescope live_grep'                   , 'text'],
"       \ 'u' : [':Telescope colorscheme'                 , 'colorschemes'],
"       \ 'y' : [':Telescope symbols'                     , 'symbols'],
"       \ 'Y' : [':Telescope lsp_workspace_symbols'       , 'lsp_workspace_symbols'],
"       \ 'r' : [':Telescope registers'                   , 'registers'],
"       \ 'R' : [':Telescope reloader'                    , 'reloader'],
"       \ 'w' : [':Telescope file_browser'                , 'buf_fuz_find'],
"       \ 'z' : [':Telescope current_buffer_fuzzy_find'   , 'buf_fuz_find'],
"       \ }




" let g:which_key_map.S = {
"       \ 'name' : '+Session' ,
"       \ 'c' : [':SClose'          , 'Close Session']  ,
"       \ 'd' : [':SDelete'         , 'Delete Session'] ,
"       \ 'l' : [':SLoad'           , 'Load Session']     ,
"       \ 's' : [':Startify'        , 'Start Page']     ,
"       \ 'S' : [':SSave'           , 'Save Session']   ,
"       \ }


" t is for terminal
let g:which_key_map.t = {
      \ 'name' : '+terminal',
      \ ';': [ ':FloatermNew --wintype=popup --height=6' , 'terminal'       ] ,
      \ 'f': [ ':FloatermNew fzf'                        , 'fzf'            ] ,
      \ 'g': [ ':FloatermNew lazygit'                    , 'git'            ] ,
      \ 'i': [ ':vsplit | terminal ipython'              , 'ipython vsplit' ] ,
      \ 'd': [ ':FloatermNew lazydocker'                 , 'docker'         ] ,
      \ 'n': [ ':FloatermNew node'                       , 'node'           ] ,
      \ 'N': [ ':FloatermNew nnn'                        , 'nnn'            ] ,
      \ 'p': [ ':FloatermNew python3'                    , 'python'         ] ,
      \ 'r': [ ':RnvimrToggle'                           , 'ranger'         ] ,
      \ 'R': [ ':FloatermNew ranger'                     , 'ranger'         ] ,
      \ 'c': [ ':FloatermToggle'                         , 'console'         ] ,
      \ 'h': [ ':FloatermNew htop'                       , 'htop'           ] ,
      \ 's': [ ':FloatermNew ncdu'                       , 'ncdu'           ] ,
      \ 't' : {
        \ 'name': '+tab',
        \ '<Left>' :  [ ':tabm -1'           , '<= Tab'  ] ,
        \ '<Right>' : [ ':tabm +1'           , '=> Tab'  ] ,
        \ 'n' :       [ ':tabnew'            , 'new tab' ] ,
        \ 'c' :       [ ':tabnew | terminal' , 'new tab' ] ,
        \ '%' :       [ ':tabedit %' ,         'file in new tab' ] ,
        \ 'i' :       [ ':tabnew | terminal ipython'              , 'ipython'        ] ,
        \ },
      \ }
      " \ 'i' :       [ ':FloatermNew! ipython'                   , 'ipython'  ] ,
      " \ 'i' :       [ ':vsplit | terminal ipython'              , 'ipython vsplit'  ] ,
      " \ 'I' :       [ ':tabnew | terminal ipython'              , 'ipython'  ] ,

" " T is for tab
" let g:which_key_map.T = {
"       \ 'name' : '+Tab'                    ,
"       \ '<Left>' :  [ ':tabm -1'           , '<= Tab'  ] ,
"       \ '<Right>' : [ ':tabm +1'           , '=> Tab'  ] ,
"       \ 'n' :       [ ':tabnew'            , 'new tab' ] ,
"       \ 'T' :       [ ':tabnew | terminal' , 'new tab' ] ,
"       \ '%' :       [ ':tabedit %' ,         'file in new tab' ] ,
"       \ }
"       " \ '.' :       [ ':tabnew $MYVIMRC'                               ,  'init in new tab'],
" map <leader>Tt :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR>

" u is for UltiSnips or Undo
let g:which_key_map.u = {
      \ 'name' : '+ultisnips or undo'                  ,
      \ 'e' : [':CocCommand snippets.editSnippets'     , 'Ultisnips Edit'     ] ,
      \ 'f' : [':CocCommand snippets.openSnippetFiles' , 'Ultisnips Files'    ] ,
      \ 's' : [':CocList snippets'                     , 'Ultisnips Snippets' ] ,
      \ 't' : [':UndotreeToggle'                       , 'UndoTree'           ] ,
      \ }
" \ 'e' : [':CocCommand snippets.editSnippets'     , 'Ultisnips Edit'],
" \ 'e' : [':UltiSnipsEdit<cr>'                    , 'Ultisnips Edit'],
" convert visual selected code to snippet
xmap <leader>uc  <Plug>(coc-convert-snippet)


" w is for wiki
let g:which_key_map.w = {
      \ 'name' : '+wiki'                 ,
      \ 'w' : ['<Plug>VimwikiIndex'      , 'Wiki'         ] ,
      \ 'i' : ['<plug>VimwikiDiaryIndex' , 'dIary'        ] ,
      \ 'j' : ['<plug>(wiki-journal)'    , 'ncdu'         ] ,
      \ 't' : [':VimwikiTable'           , 'vimwikiTable' ] ,
      \ }


" --- Edit Files ---
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>aJ :%!python3 -m json.tool<cr>        " format json
" map <leader>aC :cd %:p:h<cr>:pwd<cr>            " Switch CWD to the current directory
" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" --- --- ---

" Register which key map
call which_key#register('<Space>', "g:which_key_map") 


nnoremap <MiddleMouse> <Nop>
nnoremap <2-MiddleMouse> <Nop>
nnoremap <3-MiddleMouse> <Nop>
nnoremap <4-MiddleMouse> <Nop>

inoremap <MiddleMouse> <Nop>
inoremap <2-MiddleMouse> <Nop>
inoremap <3-MiddleMouse> <Nop>
inoremap <4-MiddleMouse> <Nop>


" Selecting last pasted text 2 versions
" nnoremap gp `[v`]
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
