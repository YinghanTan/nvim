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
let g:which_key_map['/'] = [ ':let @/ = ""'    , 'Clear highlight' ]
let g:which_key_map['.'] = [ ':e $MYVIMRC'                                     , 'open init' ]
let g:which_key_map[';'] = [ ':Commands'                                       , 'commands' ]
let g:which_key_map['n'] = [ ':let @/ = ""'                                    , 'no highlight' ]
let g:which_key_map['o'] = [ ':RnvimrToggle'                                   , 'open' ]
let g:which_key_map['q'] = [ '<Plug>(coc-fix-current)'                         , 'quickfix' ]
" let g:which_key_map['u'] = [ ':UndotreeToggle'                                 , 'undo tree']
" let g:which_key_map['p'] = [ ':Files'                                          , 'search files' ]
" let g:which_key_map['T'] = [ ':TSHighlightCapturesUnderCursor'                 , 'treesitter highlight' ]
" let g:which_key_map['/'] = [ ':call Comment()'                                 , 'comment' ]
" let g:which_key_map['v'] = [ '<C-W>v'                                          , 'split right']
" let g:which_key_map['W'] = [ ':call WindowSwap#EasyWindowSwap()'               , 'move window' ]
" let g:which_key_map['z'] = [ 'Goyo'                                            , 'zen' ]
" let g:which_key_map['='] = [ '<C-W>='                                          , 'balance windows' ]
" let g:which_key_map['e'] = [ ':CocCommand explorer --toggle --sources=file+'   , 'explorer' ]
" let g:which_key_map['h'] = [ '<C-W>s'                                          , 'split below']


" Group mappings

" a is for actions
let g:which_key_map.a = {
      \ 'name' : '+actions' ,
      \ 'c' : [':ColorizerToggle'        , 'colorizer'],
      \ 'e' : [':CocCommand explorer'    , 'explorer'],
      \ 'l' : [':Bracey'                 , 'start live server'],
      \ 'L' : [':BraceyStop'             , 'stop live server'],
      \ 'm' : ['<Plug>MarkdownPreviewToggle'  , 'markdown preview toggle'],
      \ 'n' : [':set nonumber!'          , 'line-numbers'],
      \ 'r' : [':set norelativenumber!'  , 'relative line nums'],
      \ 'v' : [':Codi'                   , 'virtual repl on'],
      \ 'V' : [':Codi!'                  , 'virtual repl off'],
      \ 'z' : [':MaximizerToggle'        , 'zoom'],
      \ }
      " \ 't' : [':FloatermToggle'         , 'terminal'],
      " \ 'w' : [':StripWhitespace'        , 'strip whitespace'],
      " \ 'M' : ['<Plug>MarkdownPreviewStop'    , 'markdown preview stop'],
      " \ 's' : [':s/\%V\(.*\)\%V/"\1"/'   , 'surround'],
      " \ 'h' : [':let @/ = ""'            , 'remove search highlight'],


" b is for buffer
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ 'f' : ['bfirst'    , 'first-buffer'],
      \ 'l' : ['blast'     , 'last-buffer'],
      \ 'n' : ['bnext'     , 'next-buffer'],
      \ 'p' : ['bprevious' , 'previous-buffer'],
      \ 'b' : ['Buffers'   , 'fzf-buffer'],
      \ }

" d is for debug
let g:which_key_map.d = {
      \ 'name' : '+debug' ,
      \ 'b' : ['<Plug>VimspectorToggleBreakpoint'              , 'breakpoint'],
      \ 'B' : ['<Plug>VimspectorToggleConditionalBreakpoint'   , 'conditional breakpoint'],
      \ 'c' : ['<Plug>VimspectorRunToCursor'                   , 'run to cursor'],
      \ 'd' : ['<Plug>VimspectorContinue'                      , 'continue'],
      \ 'f' : ['<Plug>VimspectorAddFunctionBreakpoint'         , 'function breakpoint'],
      \ 'm' : [':MaximizerToggle'                              , 'maximize window'],
      \ 'o' : ['<Plug>VimspectorStepOver'                      , 'step over'],
      \ 'O' : ['<Plug>VimspectorStepOut'                       , 'step out'],
      \ 'i' : ['<Plug>VimspectorStepInto'                      , 'step into'],
      \ 'p' : ['<Plug>VimspectorPause'                         , 'pause'],
      \ 'r' : ['<Plug>VimspectorRestart'                       , 'restart'],
      \ 'R' : ['VimspectorReset'                               , 'Reset'],
      \ 'S' : ['<Plug>VimspectorStop'                          , 'stop'],
      \ 'z' : [':MaximizerToggle'                              , 'zoom'],
      \ }
      " \ 'v' : [':call Vimspector#Launch()<cr>'                 , 'vimspector'],
nmap <leader>dv :call vimspector#Launch()<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>ds :VimspectorShowOutput

" f is for find and replace
let g:which_key_map.f = {
      \ 'name' : '+find & replace' ,
      \ 'f' : [':Farr --source=vimgrep'    , 'file'],
      \ 'p' : [':Farr --source=rgnvim'     , 'project'],
      \ }


" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'f' : [':diffget //2<CR>'                  , 'diffget left hunk'],
      \ 'j' : [':diffget //3<CR>'                  , 'diffget right hunk'],
      \ 'a' : [':Git add .'                        , 'add all'],
      \ 'A' : [':CocCommand fzf-preview.GitStatus' , 'actions'],
      \ 'b' : [':Git blame'                        , 'blame'],
      \ 'B' : [':GBrowse'                          , 'browse'],
      \ 'c' : [':Git commit'                       , 'commit'],
      \ 'd' : [':Gdiff'                            , 'diff'],
      \ 'D' : [':Gdiffsplit'                       , 'diff split'],
      \ 'g' : [':GGrep'                            , 'git grep'],
      \ 'G' : [':Gstatus'                          , 'status'],
      \ 'h' : [':GitGutterLineHighlightsToggle'    , 'highlight hunks'],
      \ 'H' : ['<Plug>(GitGutterPreviewHunk)'      , 'preview hunk'],
      \ 'i' : [':Gist -b'                          , 'post gist'],
      \ 'l' : [':Git log'                          , 'log'],
      \ 'm' : ['<Plug>(git-messenger)'             , 'message'],
      \ 'p' : [':Git push'                         , 'push'],
      \ 'P' : [':Gpull'                            , 'pull'],
      \ 'r' : [':GRemove'                          , 'remove'],
      \ 's' : ['<Plug>(GitGutterStageHunk)'        , 'stage hunk'],
      \ 'S' : [':CocCommand fzf-preview.GitStatus' , 'status'],
      \ 't' : [':GitGutterSignsToggle'             , 'toggle signs'],
      \ 'u' : ['<Plug>(GitGutterUndoHunk)'         , 'undo hunk'],
      \ 'v' : [':GV'                               , 'view commits'],
      \ 'V' : [':GV!'                              , 'view buffer commits'],
      \ 'w' : [':Gwrite'                           , 'Gwrite'],
      \ }
      " \ 'k' : ['<Plug>(GitGutterPrevHunk)'         , 'prev hunk'],
      " \ 'j' : ['<Plug>(GitGutterNextHunk)'         , 'next hunk'],
      " \ 'A' : [':Git add %'                        , 'add current'],
      " \ 's' : [':G'                                , 'status'],

" G is for Gist
let g:which_key_map.G = {
      \ 'name' : '+gist' ,
      \ 'a' : [':Gist -a'                          , 'post gist anon'],
      \ 'b' : [':Gist -b'                          , 'post gist browser'],
      \ 'd' : [':Gist -d'                          , 'delete gist'],
      \ 'e' : [':Gist -e'                          , 'edit gist'],
      \ 'l' : [':Gist -l'                          , 'list public gists'],
      \ 's' : [':Gist -ls'                         , 'list starred gists'],
      \ 'm' : [':Gist -m'                          , 'post gist all buffers'],
      \ 'p' : [':Gist -P'                          , 'post public gist '],
      \ 'P' : [':Gist -p'                          , 'post private gist '],
      \ }

" k is for cheat.sh
" TODO


" i is for indent
let g:which_key_map.i = {
      \ 'name' : 'indent' ,
      \ 'g' : [':IndentGuidesToggle<CR>'               , 'Indent Guide'],
      \ }




" l is for language server protocol
let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ '.' : [':CocConfig'                          , 'config'],
      \ ';' : ['<Plug>(coc-refactor)'                , 'refactor'],
      \ 'a' : ['<Plug>(coc-codeaction)'              , 'line action'],
      \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
      \ 'b' : [':CocNext'                            , 'next action'],
      \ 'B' : [':CocPrev'                            , 'prev action'],
      \ 'c' : [':CocList commands'                   , 'commands'],
      \ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
      \ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
      \ 'e' : [':CocList extensions'                 , 'extensions'],
      \ 'f' : ['<Plug>(coc-format-selected)'         , 'format selected'],
      \ 'F' : ['<Plug>(coc-format)'                  , 'format'],
      \ 'h' : ['<Plug>(coc-float-hide)'              , 'hide'],
      \ 'i' : ['<Plug>(coc-implementation)'          , 'implementation'],
      \ 'I' : [':CocList diagnostics'                , 'diagnostics'],
      \ 'j' : ['<Plug>(coc-float-jump)'              , 'float jump'],
      \ 'l' : ['<Plug>(coc-codelens-action)'         , 'code lens'],
      \ 'n' : ['<Plug>(coc-diagnostic-next)'         , 'next diagnostic'],
      \ 'N' : ['<Plug>(coc-diagnostic-next-error)'   , 'next error'],
      \ 'o' : [':Vista!!'                            , 'outline'],
      \ 'O' : [':CocList outline'                    , 'outline'],
      \ 'p' : ['<Plug>(coc-diagnostic-prev)'         , 'prev diagnostic'],
      \ 'P' : ['<Plug>(coc-diagnostic-prev-error)'   , 'prev error'],
      \ 'q' : ['<Plug>(coc-fix-current)'             , 'quickfix'],
      \ 'r' : ['<Plug>(coc-references)'              , 'references'],
      \ 'R' : ['<Plug>(coc-rename)'                  , 'rename'],
      \ 's' : [':CocList -I symbols'                 , 'references'],
      \ 'S' : [':CocList snippets'                   , 'snippets'],
      \ 't' : ['<Plug>(coc-type-definition)'         , 'type definition'],
      \ 'y' : ['<Plug>(coc-type-definition)'         , 'type definition'],
      \ 'u' : [':CocListResume'                      , 'resume list'],
      \ 'U' : [':CocUpdate'                          , 'update CoC'],
      \ 'z' : [':CocDisable'                         , 'disable CoC'],
      \ 'Z' : [':CocEnable'                          , 'enable CoC'],
      \ }
      " \ 'o' : ['<Plug>(coc-openlink)'                , 'open link'],


" n is for NerdTree
let g:which_key_map.n = {
      \ 'name' : '+nerdtree' ,
      \ 't' : [':NERDTreeToggle'               , 'NerdTree Toggle'],
      \ 'b' : [':NERDTreeFromBookmark'         , 'NerdTree From Bookmark'],
      \ 'f' : [':NERDTreeFind'                 , 'NerdTree Find'],
      \ }

let g:which_key_map.o = {
      \ 'name' : 'Obsess',
      \ 's' : [':Obsess<CR>',   ':Obsess'],
      \ 'S' : [':Obsess!<CR>',  ':Obsess!'],
      \ }

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'                    , 'history'],
      \ ';' : [':FzfPreviewCommandPalette'              , 'commands'],
      \ 'a' : [':Ag'                          , 'text Ag'],
      \ 'b' : [':CocCommand fzf-preview.Buffers'               , 'open buffers'],
      \ 'B' : [':CocCommand fzf-preview.BufferLines'                , 'current buffer'],
      \ 'c' : [':Commits'                     , 'commits'],
      \ 'C' : [':BCommits'                    , 'buffer commits'],
      \ 'd' : [':CocCommand fzf-preview.DirectoryFiles'              , 'directories'],
      \ 'f' : ['Files'                 , 'files'],
      \ 'F' : [':CocCommand fzf-preview.ProjectFiles'                 , 'project files'],
      \ 'g' : [':CocCommand fzf-preview.GitFiles'                , 'git files'],
      \ 'G' : [':GFiles?'                     , 'modified git files'],
      \ 'h' : [':History'                     , 'file history'],
      \ 'H' : [':History:'                    , 'command history'],
      \ 'l' : [':Lines'                       , 'lines'] ,
      \ 'm' : [':CocCommand fzf-preview.Marks', 'list marks'],
      \ 'M' : [':Maps'                  , 'normal maps'] ,
      \ 'p' : [':Helptags'                    , 'help tags'] ,
      \ 'P' : [':Tags'                        , 'project tags'],
      \ 'q' : [':CocCommand fzf-preview.QuickFix'                  , 'quickfix list'],
      \ 'r' : [':Rg'                          , 'text Rg'],
      \ 'S' : [':Colors'                      , 'color schemes'],
      \ 'T' : [':BTags'                       , 'buffer tags'],
      \ 'w' : [':Windows'                     , 'search windows'],
      \ 'y' : [':Filetypes'                   , 'file types'],
      \ 'z' : [':FZF'                         , 'FZF'],
      \ 's' : [':CocList snippets'            , 'Snippets Search'],
      \ }
      " \ 'b' : [':Buffers'                     , 'open buffers'],
      " \ 'B' : [':BLines'                      , 'current buffer'],
      " \ 'f' : [':Files'                       , 'files'],
      " \ 'g' : [':GFiles'                      , 'git files'],
      " \ 'm' : [':Marks'                       , 'marks'] ,
      " \ 'M' : [':Maps'                        , 'normal maps'] ,





" let g:which_key_map.S = {
"       \ 'name' : '+Session' ,
"       \ 'c' : [':SClose'          , 'Close Session']  ,
"       \ 'd' : [':SDelete'         , 'Delete Session'] ,
"       \ 'l' : [':SLoad'           , 'Load Session']     ,
"       \ 's' : [':Startify'        , 'Start Page']     ,
"       \ 'S' : [':SSave'           , 'Save Session']   ,
"       \ }


" t is for terminal & tab
let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ ';' :       [ ':FloatermNew --wintype=popup --height=6'        , 'terminal'],
      \ 'f' :       [ ':FloatermNew fzf'                               , 'fzf'],
      \ 'g' :       [ ':FloatermNew lazygit'                           , 'git'],
      \ 'd' :       [ ':FloatermNew lazydocker'                        , 'docker'],
      \ 'n' :       [ ':FloatermNew node'                              , 'node'],
      \ 'N' :       [ ':FloatermNew nnn'                               , 'nnn'],
      \ 'p' :       [ ':FloatermNew python3'                           , 'python'],
      \ 'r' :       [ ':FloatermNew ranger'                            , 'ranger'],
      \ 't' :       [ ':FloatermToggle'                                , 'toggle'],
      \ 'T' :       [ ':tabnew | terminal'                             , 'new tab'],
      \ 'h' :       [ ':FloatermNew htop'                              , 'htop'],
      \ 's' :       [ ':FloatermNew ncdu'                              , 'ncdu'],
      \ }

" T is for tab
let g:which_key_map.T = {
      \ 'name' : '+tab' ,
      \ '<Left>' :  [ ':tabm -1'                                       ,  '<= Tab'],
      \ '<Right>' : [ ':tabm +1'                                       ,  '=> Tab'],
      \ 'n' :       [ ':tabnew'                                        ,  'new tab'],
      \ 'T' :       [ ':tabnew | terminal'                             , 'new tab'],
      \ }

" u is for UltiSnips or Undo
let g:which_key_map.u = {
      \ 'name' : '+ultisnips or undo'                      ,
      \ 'e' : [':CocCommand snippets.editSnippets'     , 'Ultisnips Edit'],
      \ 'f' : [':CocCommand snippets.openSnippetFiles' , 'Ultisnips Files'],
      \ 's' : [':CocList snippets'                     , 'Ultisnips Snippets'],
      \ 't' : [':UndotreeToggle'                           , 'UndoTree']           ,
      \ }
" convert visual selected code to snippet
xmap <leader>uc  <Plug>(coc-convert-snippet)


" v is for vim
let g:which_key_map.v = {
      \ 'name' : '+vim' ,
      \ 'r' : [':e $MYVIMRC'                          , 'Edit vimrc'],
      \ }

" w is for wiki
let g:which_key_map.w = {
      \ 'name' : '+wiki' ,
      \ 'w' : ['<Plug>VimwikiIndex'                          , 'Wiki'],
      \ 'i' : ['<plug>VimwikiDiaryIndex'                     , 'dIary'],
      \ 'j' : ['<plug>(wiki-journal)'                              , 'ncdu'],
      \ 't' : [':VimwikiTable'                           , 'vimwikiTable'],
      \ }


" --- Edit Files ---
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>aJ :%!python3 -m json.tool<cr>
map <leader>aC :cd %:p:h<cr>:pwd<cr>            " Switch CWD to the current directory
" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" --- --- ---

" Register which key map
call which_key#register('<Space>', "g:which_key_map") 






