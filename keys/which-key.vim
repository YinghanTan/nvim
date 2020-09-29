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

" n is for NerdTree
let g:which_key_map.n = {
      \ 'name' : '+nerdtree' ,
      \ 't' : [':NERDTreeToggle'               , 'NerdTree Toggle'],
      \ 'b' : [':NERDTreeFromBookmark'         , 'NerdTree From Bookmark'],
      \ 'f' : [':NERDTreeFind'                 , 'NerdTree Find'],
      \ }

" u is for UltiSnips or Undo
let g:which_key_map.u = {
      \ 'name' : '+ultisnips or undo' ,
      \ 'e' : [':UltiSnipsEdit'            , 'Ultisnips Edit'],
      \ 't' : [':UndotreeToggle'               , 'UndoTree'],
      \ }

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ 'f' : [':Files'                       , 'files'],
      \ 'r' : [':Rg'                          , 'text Rg'],
      \ 'a' : [':Ag'                          , 'text Ag'],
      \ 'b' : [':BLines'                      , 'current buffer'],
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
      \ 'B' : [':Buffers'                     , 'open buffers'],
      \ 'm' : [':Marks'                       , 'marks'] ,
      \ 'M' : [':Maps'                        , 'normal maps'] ,
      \ 'p' : [':Helptags'                    , 'help tags'] ,
      \ 'P' : [':Tags'                        , 'project tags'],
      \ 'S' : [':Colors'                      , 'color schemes'],
      \ 'T' : [':BTags'                       , 'buffer tags'],
      \ 'w' : [':Windows'                     , 'search windows'],
      \ 'y' : [':Filetypes'                   , 'file types'],
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
      \ 'j' : ['<Plug>(GitGutterNextHunk)'         , 'next hunk'],
      \ 'k' : ['<Plug>(GitGutterPrevHunk)'         , 'prev hunk'],
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

nnoremap <leader>tb :Tabularize /
" t is for terminal or tabularize

let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew --wintype=popup --height=6'        , 'terminal'],
      \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      \ 'd' : [':FloatermNew lazydocker'                        , 'docker'],
      \ 'n' : [':FloatermNew node'                              , 'node'],
      \ 'N' : [':FloatermNew nnn'                               , 'nnn'],
      \ 'p' : [':FloatermNew python3'                           , 'python'],
      \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
      \ 't' : [':FloatermToggle'                                , 'toggle'],
      \ 'y' : [':FloatermNew htop'                              , 'htop'],
      \ 's' : [':FloatermNew ncdu'                              , 'ncdu'],
      \ '=' : [':Tabularize /=<CR>'                              , 'Tab='],
      \ ':' : [':Tabularize /:<CR>'                              , 'Tab:'],
      \ ',' : [':Tabularize /,<CR>'                              , 'Tab,'],
      \ }

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
      \ }
      " \ 'h' : ['Startify'  , 'home-buffer'],
      " \ '?' : ['Buffers'   , 'fzf-buffer'],

" T is for tab
let g:which_key_map.T = {
      \ 'name' : '+tab' ,
      \ 'n' : [':tabNext'                 , 'next tab'],
      \ 't' : [':tabnew'                  , 'new tab'],
      \ 'p' : [':tabprevious'             , 'prev tab'],
      \ '<Left>' : [':tabm -1'                 , '<= buffer'],
      \ '<Right>' : [':tabm +1'                 , '=> buffer'],
      \ }


" w is for wiki
let g:which_key_map.w = {
      \ 'name' : '+wiki' ,
      \ 'w' : ['<Plug>VimwikiIndex'                          , 'Wiki'],
      \ 'i' : ['<plug>VimwikiDiaryIndex'                     , 'dIary'],
      \ 'T' : [':VimwikiTable<cr>'                           , 'vimwikiTable'],
      \ }

" v is for vim
let g:which_key_map.v = {
      \ 'name' : '+vim' ,
      \ 'r' : [':e $MYVIMRC'                          , 'Edit vimrc'],
      \ }

" S is for Startify
let g:which_key_map.S = {
      \ 'name' : '+Session' ,
      \ 'c' : [':SClose'          , 'Close Session']  ,
      \ 'd' : [':SDelete!'         , 'Delete Session'] ,
      \ 'l' : [':SLoad'           , 'Load Session']     ,
      \ 's' : [':Startify'        , 'Start Page']     ,
      \ 'S' : [':SSave!'           , 'Save Session']   ,
      \ }

let g:which_key_map.f = {
      \ 'name' : '+find & replace' ,
      \ 'b' : [':Farr --source=vimgrep'    , 'buffer'],
      \ 'p' : [':Farr --source=rgnvim'     , 'project'],
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
nmap g[ <Plug>(coc-diagnostic-prev)
nmap g] <Plug>(coc-diagnostic-next)
nmap gp <Plug>(coc-diagnostic-prev-error)
nmap gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
" --- --- ---

" Coc Search & refactor
nnoremap <leader>? :CocSearch <C-R>=expand("<cword>")<CR><CR>
let g:which_key_map['?'] = 'search word'


" --- Edit Files ---
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>js :%!python3 -m json.tool<cr>
map <leader>cd :cd %:p:h<cr>:pwd<cr>            " Switch CWD to the directory of the open buffer
" map <leader>pp :setlocal paste!<cr>             " Toggle paste mode on and off
" set pastetoggle=<leader>pt       " paste mode: avoid auto indent, treat chars
" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" Spell checking, Pressing \ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>
" --- --- ---


" " --- AutoPairs Plugin ---
" let g:AutoPairsShortcutToggle= '<leader>ap'
" let g:AutoPairsShortcutFastWrap= '<leader>aw'
" let g:AutoPairsShortcutJump= '<leader>an'
" let g:AutoPairsShortcutBackInsert= '<leader>ab'
" " --- --- ---










