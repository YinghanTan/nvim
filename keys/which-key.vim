call which_key#register('<Space>', "g:which_key_map")    " Register which key map

" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

let g:which_key_map =  {}    " Create map to add keys to
let g:which_key_sep = '→'    " Define a separator
let g:which_key_use_floating_win = 0     " Not a fan of floating windows for this
" set timeoutlen=100


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
" let g:which_key_map['.'] = [ ':e $MYVIMRC'     , 'open init' ]
let g:which_key_map[';'] = [ ':Commands'       , 'commands' ]
let g:which_key_map['/'] = [ ':let @/ = ""'    , 'Clear highlight' ]
" let g:which_key_map['p'] = [ ':Files'          , 'search files' ]

" Group mappings
" a is for actions or ale
let g:which_key_map.a = {
      \ 'name' : '+actions',
      \ 'c' : [':ColorizerToggle'             , 'colorizer'],
      \ 'm' : ['<Plug>MarkdownPreviewToggle'  , 'markdown preview'],
      \ 'M' : ['<Plug>MarkdownPreviewStop'    , 'markdown preview stop'],
      \ }
      " \ 'e' : [':CocCommand explorer'         , 'explorer'],
      " \ 'j' : ['<Plug>(ale_next_wrap)'         , 'ale next wrap'],
      " \ 'k' : ['<Plug>(ale_previous_wrap)'     , 'ale previous wrap'],
      " \ 'f' : ['<Plug>(ale_fix)'                       , 'ale fix'],

" modify paste in visual mode to paste repeatedly
xnoremap <leader>p "_dP

" b is for buffer
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '1' : ['b1'        , 'buffer 1'],
      \ '2' : ['b2'        , 'buffer 2'],
      \ 'd' : [':Bdelete'  , 'delete-buffer'],
      \ 'f' : ['bfirst'    , 'first-buffer'],
      \ 'l' : ['blast'     , 'last-buffer'],
      \ 'n' : ['bnext'     , 'next-buffer'],
      \ 'p' : ['bprevious' , 'previous-buffer'],
      \ 'b' : ['Buffers'   , 'fzf-buffer'],
      \ }
      " \ 'h' : ['Startify'  , 'home-buffer'],



let g:which_key_map.f = {
      \ 'name' : '+find & replace' ,
      \ 'b' : [':Farr --source=vimgrep'    , 'buffer'],
      \ 'p' : [':Farr --source=rgnvim'     , 'project'],
      \ }

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'a' : [':Git add .'                        , 'add all'],
      \ 'A' : [':Git add %'                        , 'add current'],
      \ 'b' : [':Git blame'                        , 'blame'],
      \ 'B' : [':GBrowse'                          , 'browse'],
      \ 'c' : [':Git commit'                       , 'commit'],
      \ 'd' : [':Gdiff'                            , 'diff'],
      \ 'D' : [':Gdiffsplit'                       , 'diff split'],
      \ 'g' : [':GGrep'                            , 'git grep'],
      \ 'h' : [':GitGutterLineHighlightsToggle'    , 'highlight hunks'],
      \ 'H' : ['<Plug>(GitGutterPreviewHunk)'      , 'preview hunk'],
      \ 'i' : [':Gist -b'                          , 'post gist'],
      \ 'l' : [':Git log'                          , 'log'],
      \ 'm' : ['<Plug>(git-messenger)'             , 'message'],
      \ 'p' : [':Git push'                         , 'push'],
      \ 'P' : [':Gpull'                            , 'pull'],
      \ 'r' : [':GRemove'                          , 'remove'],
      \ 'S' : ['<Plug>(GitGutterStageHunk)'        , 'stage hunk'],
      \ 's' : [':G'                                , 'status'],
      \ 't' : [':GitGutterSignsToggle'             , 'toggle signs'],
      \ 'u' : ['<Plug>(GitGutterUndoHunk)'         , 'undo hunk'],
      \ 'v' : [':GV'                               , 'view commits'],
      \ 'V' : [':GV!'                              , 'view buffer commits'],
      \ 'w' : [':Gwrite'                           , 'Gwrite'],
      \ 'j' : [':diffget //3<CR>'                  , 'diffget right hunk'],
      \ 'f' : [':diffget //2<CR>'                  , 'diffget left hunk'],
      \ }

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

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ 'f' : [':Files'                       , 'files'],
      \ 'r' : [':Rg'                          , 'text Rg'],
      \ 'a' : [':Ag'                          , 'text Ag'],
      \ 'B' : [':BLines'                      , 'current buffer'],
      \ 'l' : [':Lines'                       , 'lines'] ,
      \ 'h' : [':History'                     , 'file history'],
      \ 'H' : [':History:'                    , 'command history'],
      \ 'c' : [':Commits'                     , 'commits'],
      \ 'C' : [':BCommits'                    , 'buffer commits'],
      \ 'z' : [':FZF'                         , 'FZF'],
      \ 'g' : [':GFiles'                      , 'git files'],
      \ 'G' : [':GFiles?'                     , 'modified git files'],
      \ 's' : [':CocList snippets'            , 'snippets'],
      \ '/' : [':History/'                    , 'history'],
      \ ';' : [':Commands'                    , 'commands'],
      \ 'b' : [':Buffers'                     , 'open buffers'],
      \ 'm' : [':Marks'                       , 'marks'] ,
      \ 'M' : [':Maps'                        , 'normal maps'] ,
      \ 'p' : [':Helptags'                    , 'help tags'] ,
      \ 'P' : [':Tags'                        , 'project tags'],
      \ 'S' : [':Colors'                      , 'color schemes'],
      \ 'T' : [':BTags'                       , 'buffer tags'],
      \ 'w' : [':Windows'                     , 'search windows'],
      \ 'y' : [':Filetypes'                   , 'file types'],
      \ }

" S is for Startify
let g:which_key_map.S = {
      \ 'name' : '+Session' ,
      \ 'c' : [':SClose'    , 'Close Session']  ,
      \ 'd' : [':SDelete!'  , 'Delete Session'] ,
      \ 'l' : [':SLoad'     , 'Load Session']   ,
      \ 'h' : [':Startify'  , 'Start Page']     ,
      \ 'S' : [':SSave!'    , 'Save Session']   ,
      \ }
" Spell checking, Pressing \SS will toggle and untoggle spell checking
map <leader>Ss :setlocal spell!<cr>

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
      \ 'h' :       [ ':FloatermNew htop'                              , 'htop'],
      \ 's' :       [ ':FloatermNew ncdu'                              , 'ncdu'],
      \ '<Left>' :  [ ':tabm -1'                                       ,  '<= Tab'],
      \ '<Right>' : [ ':tabm +1'                                       ,  '=> Tab'],
      \ 'T' :       [ ':tabnew'                                        ,  'new tab'],
      \ }

" " T is for tab
" let g:which_key_map.T = {
"       \ 'name' : '+tab' ,
"       \ 't' :       [ ':tabnew'                  ,  'new tab'],
"       \ }

" u is for UltiSnips or Undo
let g:which_key_map.u = {
      \ 'name' : '+ultisnips or undo'                      ,
      \ 't' : [':UndotreeToggle'                           , 'UndoTree']           ,
      \ }
      " \ 'e' : [':CocCommand snippets.editSnippets<cr>'     , 'Ultisnips Edit']     ,
      " \ 'f' : [':CocCommand snippets.openSnippetFiles<cr>' , 'Ultisnips Files']    ,
      " \ 's' : [':CocList snippets<cr>'                     , 'Ultisnips Snippets'] ,

" v is for vim
let g:which_key_map.v = {
      \ 'name' : '+vim' ,
      \ 'r' : [':e $MYVIMRC'                          , 'Edit vimrc'],
      \ 'b' : [':VimBeGood'                          , 'Edit vimrc'],
      \ }

" w is for wiki
let g:which_key_map.w = {
      \ 'name' : '+wiki' ,
      \ 'w' : ['<Plug>VimwikiIndex'                          , 'Wiki'],
      \ 'i' : ['<plug>VimwikiDiaryIndex'                     , 'dIary'],
      \ 'T' : [':VimwikiTable<cr>'                           , 'vimwikiTable'],
      \ }

" --- Leader Shortcuts ---
" let mapleader="\\"       " leader is comma
" --- --- ---

" --- COC ---
" GoTo code navigation.
nmap gd <Plug>(coc-definition)
nmap gr <Plug>(coc-references)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap rr <Plug>(coc-rename)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" nmap g[ <Plug>(coc-diagnostic-prev)
" nmap g] <Plug>(coc-diagnostic-next)
nmap <silent> [G <Plug>(coc-diagnostic-prev-error)
nmap <silent> ]G <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
" --- --- ---

" Coc Search & refactor
nnoremap <leader>? :CocSearch <C-R>=expand("<cword>")<CR><CR>
let g:which_key_map['?'] = 'search word'


" --- Edit Files ---
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>js :%!python3 -m json.tool<cr>
map <leader>cd :cd %:p:h<cr>:pwd<cr>            " Switch CWD to the current directory
" map <leader>pp :setlocal paste!<cr>             " Toggle paste mode on and off
" set pastetoggle=<leader>pt       " paste mode: avoid auto indent, treat chars
" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" Spell checking, Pressing \ss will toggle and untoggle spell checking
" map <leader>ss :setlocal spell!<cr>
" --- --- ---


" " --- AutoPairs Plugin ---
" let g:AutoPairsShortcutToggle= '<leader>ap'
" let g:AutoPairsShortcutFastWrap= '<leader>aw'
" let g:AutoPairsShortcutJump= '<leader>an'
" let g:AutoPairsShortcutBackInsert= '<leader>ab'
" " --- --- ---


" Visually select the text that was last edited/pasted
nmap gV `[v`]








