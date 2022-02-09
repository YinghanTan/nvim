" --- Reference --- 
" https://www.chrisatmachine.com/Neovim/15-which-key/

" Functions
fun! GoToWindow(id)
    call win_gotoid(a:id)
    " MaximizerToggle
endfun

function TrimWhitespace()
 let l = line(".")
 let c = col(".")
 %s/\s\+$//e
 call cursor(l, c)
endfun

" Which-Key settings
" Timeout
let g:which_key_timeout = 100
let g:which_key_display_names = {'<CR>': '↵', '<TAB>': '⇆'}
let g:which_key_map =  {}    " Create map to add keys to
let g:which_key_sep = '→'    " Define a separator

" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

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

" WhichKey Mappings
let g:which_key_map['/' ] = [ ':let @/ = ""'                        , 'Clear highlight' ]
let g:which_key_map['.' ] = [ ':e $MYVIMRC'                , 'open init'                ]
let g:which_key_map[';' ] = [ ':Commands'                           , 'commands'        ]


" \ is for nav
let g:which_key_map['\'] = {
      \ 'name' : '+nav'                 ,
      \ 'w' : ['HopWord'           , 'word' ] ,
      \ 'f' : ['HopChar2'          , 'find' ] ,
      \ 'l' : ['HopLineStart'           , 'line' ] ,
      \ }


" a is for actions
let g:which_key_map.a = {
      \ 'name' : '+actions'                 ,
      \ 'c' : [':ColorizerToggle'           , 'colorizer'               ] ,
      \ 'C' : [':cd %:p:h<cr>:pwd<cr>'      , 'set current directory'   ] ,
      \ 's' : [':source $MYVIMRC'           , 'source init'             ] ,
      \ 'S' : [':CocCommand swagger.render' , 'swagger'                 ] ,
      \ 'g' : ['IndentGuidesToggle'    , 'indent Guide'            ] ,
      \ 'm' : ['<Plug>MarkdownPreview'      , 'markdown preview toggle' ] ,
      \ 'M' : ['<Plug>MarkdownPreviewStop'  , 'markdown preview stop'   ] ,
      \ 'p' : ['Codi'                      , 'scratchpad' ] ,
      \ }
      " \ 'w' : [':call TrimWhitespace()<cr>' , 'trim whitespace'             ] ,
nnoremap <leader>aw :call TrimWhitespace()<CR>
    

" d is for debug
let g:which_key_map.d = {
        \ 'name' : '+debug'                                                           ,
        \ 'b' : ['<Plug>VimspectorToggleBreakpoint'                                   , 'breakpoint'             ] ,
        \ 'B' : {
            \ 'name': '+breakpoint'                                           ,
            \ 'd' : [':call vimspector#ClearBreakpoints()'                            , 'remove all breakpoints' ] ,
            \ 'f' : ['<Plug>VimspectorAddFunctionBreakpoint'                          , 'func breakpoint'        ] ,
            \ 'c' : ['<Plug>VimspectorToggleConditionalBreakpoint'                    , 'conditional breakpoint' ] ,
            \ }                                                                       ,
        \ 'c' : ['<Plug>VimspectorContinue | zz'                                      , 'continue'               ] ,
        \ 'C' : ['<Plug>VimspectorRunToCursor | zz'                                   , 'run to cursor'          ] ,
        \ 'd' : [':call vimspector#Launch()'                                      , 'debug'                  ] ,
        \ 'e' : [':VimspectorEval'                                                    , 'evaluate'               ] ,
        \ 'i' : ['<Plug>VimspectorBalloonEval'                                        , 'inspect'                ] ,
        \ 'n' : ['<Plug>VimspectorStepOver | zz'                                      , 'next'                   ] ,
        \ 's' : ['<Plug>VimspectorStepInto | zz'                                      , 'step into'              ] ,
        \ 'S' : ['<Plug>VimspectorStepOut | zz'                                       , 'step out'               ] ,
        \ 'v' : {
            \ 'name': '+view'                                                         ,
            \ 'v' : [':call GoToWindow(g:vimspector_session_windows.variables)<CR>'   , 'variables'              ] ,
            \ 'w' : [':call GoToWindow(g:vimspector_session_windows.watches)<CR>'     , 'watches'                ] ,
            \ 's' : [':call GoToWindow(g:vimspector_session_windows.stack_trace)<CR>' , 'stack'                  ] ,
            \ 't' : [':call GoToWindow(g:vimspector_session_windows.output)<CR>'      , 'terminal'                 ] ,
            \ 'T' : [':call GoToWindow(g:vimspector_session_windows.tagpage)<CR>'     , 'tag'                    ] ,
            \ 'c' : [':call GoToWindow(g:vimspector_session_windows.code)<CR>'        , 'code'                   ] ,
            \ }                                                                       ,
        \ 'k' : ['<Plug>VimspectorUpFrame'                                            , 'Up frame'               ] ,
        \ 'j' : ['<Plug>VimspectorDownFrame'                                          , 'Down frame'             ] ,
        \ 'p' : ['<Plug>VimspectorPause'                                              , 'pause'                  ] ,
        \ 'P' : ['<Plug>VimspectorStop'                                               , 'stoP'                   ] ,
        \ 'r' : ['<Plug>VimspectorRestart'                                            , 'restart'                ] ,
        \ 'D' : ['VimspectorReset'                                                    , 'Reset'                  ] ,
        \ 'w' : [':call AddToWatch()<CR>'                                             , 'add to watch'           ] ,
        \ 'z' : [':MaximizerToggle'                                                   , 'maximize window'        ] ,
        \ }
        " \ 't' : [':call GoToWindow(g:vimspector_session_windows.terminal)<CR>'    , 'terminal'               ] ,

" nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput
nnoremap <leader>dd :call vimspector#Launch()<CR>
" inspect word under cursor - normal mode
nmap <leader>di <Plug>VimspectorBalloonEval
" inspect word under cursor - visual mode
xmap <Leader>di <Plug>VimspectorBalloonEval

" f is for find and replace
let g:which_key_map.f = {
      \ 'name' : '+find & replace'      ,
      \ 'f' : [':Farr --source=vimgrep' , 'in File'    ] ,
      \ 'p' : [':Farr --source=rgnvim'  , 'in Project' ] ,
      \ }

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git'                         ,
      \ 'd' : {
          \ 'name': '+diff'                     ,
          \ 'd' : [':Gdiff'                  , 'diff'                ] ,
          \ 's' : [':Gdiffsplit'                , 'diff split'          ] ,
          \ 'i' : [':CocCommand git.diffCached' , 'diff info'           ] ,
          \ },
      \ 'a' : [':CocCommand fzf-preview.GitActions' , 'actions'            ] ,
      \ 'A' : [':Git add .'                         , 'add all'            ] ,
      \ 'b' : [':Git blame'                         , 'blame'              ] ,
      \ 'B' : ['GBrowse'                           , 'browse'             ] ,
      \ 'c' : ['BCommits'                          , 'buffer commits'     ] ,
      \ 'C' : ['Commits'                           , 'commits'            ] ,
      \ 'g' : {
          \ 'name': '+gutter'                           ,
          \ 'u' : [':CocCommand git.chunkUndo'          , 'undo hunk'          ] ,
          \ 'i' : [':CocCommand git.chunkInfo'          , 'chunk info'         ] ,
          \ 't' : [':CocCommand git.toggleGutters'      , 'toggle signs'       ] ,
          \ 's' : [':CocCommand git.chunkStage'         , 'stage hunk'         ] ,
          \ 'f' : [':CocCommand git.foldUnchanged'      , 'fold unchanged'     ] ,
          \ },
      \ 'l' : [':Git log --oneline'                 , 'log'                ] ,
      \ 'L' : [':Git log'                           , 'log'                ] ,
      \ 'm' : ['<Plug>(git-messenger)'              , 'message'            ] ,
      \ 'p' : [':GGrep'                             , 'search grep'           ] ,
      \ 'r' : [':GDelete'                           , 'remove'             ] ,
      \ 'v' : [':GV!'                               , 'file commits'       ] ,
      \ 'V' : [':GV'                                , 'all commits'        ] ,
      \ 'f' : [':diffget //2'                       , 'diffget left hunk'  ] ,
      \ 'j' : [':diffget //3'                       , 'diffget right hunk' ] ,
      \ }

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

" l is for language server protocol
let g:which_key_map.l = {
      \ 'name' : '+lsp'                                        ,
      \ '.' : [':CocConfig'                           , 'config'                                          ] ,
      \ 'a' : ['<Plug>(coc-codeaction)'                        , 'line action'                                     ] ,
      \ 'A' : ['<Plug>(coc-codeaction-selected)'               , 'selected action'                                 ] ,
      \ 'c' : [':CocCommand rest-client.request'               , 'api Client'                                         ] ,
      \ 'f' : ['<Plug>(coc-format)'                            , 'format'                                          ] ,
      \ 'F' : ['<Plug>(coc-format-selected)'                   , 'format selected'                                 ] ,
      \ 'i' : [':CocCommand fzf-preview.CocCurrentDiagnostics' , 'diagnostics current'                             ] ,
      \ 'I' : [':CocCommand fzf-preview.CocDiagnostics'        , 'diagnostics'                                     ] ,
      \ 'o' : [":call CocAction('runCommand', 'editor.action.organizeImport')" , 'organise imports'                ] ,
      \ 'r' : ['<Plug>(coc-rename)'                            , 'rename'                                          ] ,
      \ 'R' : ['<Plug>(coc-refactor)'                          , 'refactor'                                        ] ,
      \ 'q' : ['<Plug>(coc-fix-current)'                       , 'coc quick fix'                                        ] ,
      \ 'l' : {
            \ 'name': '+lsp options',
            \ 'a' : [':CocFzfList -I symbols'                        , 'all coc'                                      ] ,
            \ ';' : [':CocFzfList commands'                          , 'commands'                                        ] ,
            \ 'r' : [':CocRestart'                                   , 'restart'                                     ] ,
            \ 'u' : [':CocUpdate'                                    , 'update'                                      ] ,
            \ 'O' : [':CocDisable'                                   , 'close'                                     ] ,
            \ 'o' : [':CocEnable'                                    , 'open'                                      ] ,
            \ 'i' : [':VimtexInfo'                                    , 'latex info'                                      ] ,
            \ 'c' : [':VimtexCompile'                                    , 'latex compile'                                      ] ,
            \ 'e' : [':CocFzfList extensions'                        , 'extensions'                                      ] ,
            \ },
      \ }
      " \ 'o' : ['<Plug>(coc-openlink)'                , 'open link'],
      " <C-w>p jump in and out of floating notifications
      " <C-w>w jump in and out of floating notifications
      " nnoremap <leader>lA : <Plug>(coc-codeaction-selected)



" n is for NerdTree
let g:which_key_map.n = {
      \ 'name' : '+nerdtree'           ,
      \ 't' : [':NERDTreeToggle'       , 'NerdTree Toggle'        ] ,
      \ 'b' : [':NERDTreeFromBookmark' , 'NerdTree From Bookmark' ] ,
      \ 'f' : [':NERDTreeFind'         , 'NerdTree Find'          ] ,
      \ }

" let g:which_key_map.o = {
"       \ 'name' : 'Obsess'     ,
"       \ 's' : [':Obsess<CR>'  , ':Obsess'  ] ,
"       \ 'S' : [':Obsess!<CR>' , ':Obsess!' ] ,
"       \ }


let g:which_key_map.q = {
      \ 'name' : 'QuickFix'      ,
      \ 'g' : [':CocDiagnostics' , 'Diagnostics'          ] ,
      \ 't' : [':Todo'           , 'Add todo to quickfix' ] ,
      \ 'q' : [':copen'          , 'QuickFix'             ] ,
      \ 'Q' : [':cclose'         , 'close QuickFix'       ] ,
      \ 'l' : [':lopen'          , 'LocalFix'             ] ,
      \ 'L' : [':lclose'         , 'close LocalFix'       ] ,
      \ 'r' : [':Rg :'         , 'close LocalFix'       ] ,
      \ }
      " " Use unimpaired shortcuts instead [q ]q [l ]l


" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search'                                     ,
      \ '/' : [':History/'                                     , 'history'            ]    ,
      \ ';' : [':Commands'                                     , 'commands'           ]    ,
      \ '?' : [':Helptags'                                     , 'help'          ]    ,
      \ 'a' : [':Ag'                                           , 'text Ag'            ]    ,
      \ 'b' : [':Buffers'                                      , 'buffers'        ]    ,
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
      \ 'l' : [':Lines'                                        , 'lines'              ]    ,
      \ 'L' : [':BLines'                                       , 'current buffer'     ]    ,
      \ 'm' : [':Marks'                                        , 'marks'              ]    ,
      \ 'M' : [':Maps'                                         , 'normal maps'        ]    ,
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
      \ 'l': [ ':FloatermNew lua'                        , 'lua'            ] ,
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

" u is for UltiSnips or Undo
let g:which_key_map.u = {
      \ 'name' : '+ultisnips or undo'                  ,
      \ 'e' : [':CocCommand snippets.editSnippets'     , 'Ultisnips Edit'     ] ,
      \ 'f' : [':CocCommand snippets.openSnippetFiles' , 'Ultisnips Files'    ] ,
      \ 's' : [':CocList snippets'                     , 'Ultisnips Snippets' ] ,
      \ 't' : [':UndotreeToggle'                       , 'UndoTree'           ] ,
      \ }
" \ 'e' : [':UltiSnipsEdit<cr>'                    , 'Ultisnips Edit'],
" convert visual selected code to snippet
xmap <leader>uc  <Plug>(coc-convert-snippet)

" w is for wiki
let g:which_key_map.w = {
      \ 'name' : '+wiki'                 ,
      \ 'w' : ['<Plug>VimwikiIndex'      , 'Wiki'         ] ,
      \ 'd' : ['<plug>VimwikiDiaryIndex' , 'Diary'        ] ,
      \ 'j' : ['<plug>(wiki-journal)'    , 'journal'      ] ,
      \ 't' : [':VimwikiTable'           , 'vimwikiTable' ] ,
      \ }

" yo is for toggle
let g:which_key_map.y = {
      \ 'name' : '+toggle'                 ,
      \ 'o' : {
          \ 'name': '+options'                                           ,
          \ 'g' : [':IndentGuidesToggle'        , 'indent Guide'            ] ,
          \ 'm' : ['<Plug>MarkdownPreview'      , 'markdown preview toggle' ] ,
          \ 'M' : ['<Plug>MarkdownPreviewStop'  , 'markdown preview stop'   ] ,
          \ 'C' : [':ColorizerToggle'           , 'colorizer'               ] ,
          \ 'b': ['yob',	'background'],
          \ 'c': ['yoc',	'cursorline'],
          \ 'd': ['yod',	'diff'],
          \ 'e': ['yoe',	'spell'],
          \ 'h': ['yoh',	'hlsearch'],
          \ 'i': ['yoi',	'ignorecase'],
          \ 'l': ['yol',	'list'],
          \ 'n': ['yon',	'number'],
          \ 'r': ['yor',	'relativenumber'],
          \ 'u': ['you',	'cursorcolumn'],
          \ 'v': ['yov',	'virtualedit'],
          \ 'w': ['yow',	'wrap'],
          \ 'x': ['yox',	'crosshairs'],
          \ }                                                                       ,
      \ }
nnoremap yog :IndentGuidesToggle<cr>
nnoremap yom <Plug>MarkdownPreview
nnoremap yoC :ColorizerToggle<cr>

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
