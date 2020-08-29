" Register which key map
call which_key#register('<Space>', "g:which_key_map")

" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>



" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'

" set timeoutlen=100

" Coc Search & refactor
nnoremap <leader>? :CocSearch <C-R>=expand("<cword>")<CR><CR>
let g:which_key_map['?'] = 'search word'


" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

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
set hidden
let g:which_key_map['.'] = [ ':e $MYVIMRC'     , 'open init' ]
let g:which_key_map[';'] = [ ':Commands'       , 'commands' ]
let g:which_key_map['p'] = [ ':Files'          , 'search files' ]
let g:which_key_map['r'] = [ ':RnvimrToggle'   , 'ranger' ]
let g:which_key_map['/'] = [ ':let @/ = ""'    , 'Clear highlight' ]

" Group mappings

" a is for actions or ale
let g:which_key_map.a = {
      \ 'name' : '+actions' ,
      \ 'c' : [':ColorizerToggle'              , 'colorizer'],
      \ 'e' : [':CocCommand explorer'          , 'explorer'],
      \ 'm' : [':MarkdownPreview'              , 'markdown preview'],
      \ 'M' : [':MarkdownPreviewStop'          , 'markdown preview stop'],
      \ 's' : [':let @/ = ""'                  , 'remove search highlight'],
      \ }
      " \ 'j' : ['<Plug>(ale_next_wrap)'         , 'ale next wrap'],
      " \ 'k' : ['<Plug>(ale_previous_wrap)'     , 'ale previous wrap'],
      " \ 'f' : ['<Plug>(ale_fix)'                       , 'ale fix'],


" b is for buffer
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '1' : ['b1'        , 'buffer 1'],
      \ '2' : ['b2'        , 'buffer 2'],
      \ 'd' : [':Bdelete'  , 'delete-buffer'],
      \ 'f' : ['bfirst'    , 'first-buffer'],
      \ 'h' : ['Startify'  , 'home-buffer'],
      \ 'l' : ['blast'     , 'last-buffer'],
      \ 'n' : ['bnext'     , 'next-buffer'],
      \ 'p' : ['bprevious' , 'previous-buffer'],
      \ '?' : ['Buffers'   , 'fzf-buffer'],
      \ }


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
      \ '/' : [':History/'                    , 'history'],
      \ ';' : [':Commands'                    , 'commands'],
      \ 'a' : [':Ag'                          , 'text Ag'],
      \ 'b' : [':BLines'                      , 'current buffer'],
      \ 'B' : [':Buffers'                     , 'open buffers'],
      \ 'c' : [':Commits'                     , 'commits'],
      \ 'C' : [':BCommits'                    , 'buffer commits'],
      \ 'f' : [':Files'                       , 'files'],
      \ 'g' : [':GFiles'                      , 'git files'],
      \ 'G' : [':GFiles?'                     , 'modified git files'],
      \ 'h' : [':History'                     , 'file history'],
      \ 'H' : [':History:'                    , 'command history'],
      \ 'l' : [':Lines'                       , 'lines'] ,
      \ 'm' : [':Marks'                       , 'marks'] ,
      \ 'M' : [':Maps'                        , 'normal maps'] ,
      \ 'p' : [':Helptags'                    , 'help tags'] ,
      \ 'P' : [':Tags'                        , 'project tags'],
      \ 's' : [':CocList snippets'            , 'snippets'],
      \ 'S' : [':Colors'                      , 'color schemes'],
      \ 't' : [':Rg'                          , 'text Rg'],
      \ 'T' : [':BTags'                       , 'buffer tags'],
      \ 'w' : [':Windows'                     , 'search windows'],
      \ 'y' : [':Filetypes'                   , 'file types'],
      \ 'z' : [':FZF'                         , 'FZF'],
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
      \ 'P' : [':Gpull'                         , 'pull'],
      \ 'r' : [':GRemove'                          , 'remove'],
      \ 'S' : ['<Plug>(GitGutterStageHunk)'        , 'stage hunk'],
      \ 's' : [':G'                      , 'status'],
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




" T is for tab
let g:which_key_map.T = {
      \ 'name' : '+tabline' ,
      \ 'b' : [':XTabListBuffers'         , 'list buffers'],
      \ 'd' : [':XTabCloseBuffer'         , 'close buffer'],
      \ 'D' : [':XTabDeleteTab'           , 'close tab'],
      \ 'h' : [':XTabHideBuffer'          , 'hide buffer'],
      \ 'i' : [':XTabInfo'                , 'info'],
      \ 'l' : [':XTabLock'                , 'lock tab'],
      \ 'm' : [':XTabMode'                , 'toggle mode'],
      \ 'n' : [':tabNext'                 , 'next tab'],
      \ 'N' : [':XTabMoveBufferNext'      , 'buffer->'],
      \ 't' : [':tabnew'                  , 'new tab'],
      \ 'p' : [':tabprevious'             , 'prev tab'],
      \ 'P' : [':XTabMoveBufferPrev'      , '<-buffer'],
      \ 'x' : [':XTabPinBuffer'           , 'pin buffer'],
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

let g:which_key_map.S = {
      \ 'name' : '+Session' ,
      \ 'c' : [':SClose'          , 'Close Session']  ,
      \ 'd' : [':SDelete'         , 'Delete Session'] ,
      \ 'l' : [':SLoad'           , 'Load Session']     ,
      \ 's' : [':Startify'        , 'Start Page']     ,
      \ 'S' : [':SSave'           , 'Save Session']   ,
      \ }


" " save session
" nnoremap <leader>ms :mksession ~/.vim/sessions/
" nnoremap <leader>ss :source ~/.vim/sessions/

" --- Leader Shortcuts ---
let mapleader="\\"       " leader is comma
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


" --- Edit Files ---
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>js :%!python3 -m json.tool<cr>
map <leader>md :MarkdownPreview GitHub<CR>
map <leader>cd :cd %:p:h<cr>:pwd<cr>            " Switch CWD to the directory of the open buffer
" map <leader>pp :setlocal paste!<cr>             " Toggle paste mode on and off
" set pastetoggle=<leader>pt       " paste mode: avoid auto indent, treat chars
" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" --- --- ---

" nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
" nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
" remap <leader>+ :vertical resize +5<CR>
" nnoremap <leader>- :vertical resize -5<CR>
" nnoremap <leader>+ :vertical resize +5<CR>
" nnoremap <leader>- :vertical resize -5<CR>

" Spell checking, Pressing \ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>
" --- --- ---


" --- vim ripgrep ctrlP ---
if executable('rg')
    let g:rg_derive_root='true'
endif
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" ag is fast enough that CtrlP doesn't need to cache
" Use ag in ctrl P for listing files
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
nnoremap <leader>ps :Rg<SPACE>
" --- --- ---


" " --- AutoPairs Plugin ---
" let g:AutoPairsShortcutToggle= '<leader>ap'
" let g:AutoPairsShortcutFastWrap= '<leader>aw'
" let g:AutoPairsShortcutJump= '<leader>an'
" let g:AutoPairsShortcutBackInsert= '<leader>ab'
" " --- --- ---

" --- Vim-Indent-Guide Plugin ---
nnoremap <leader>ig :IndentGuidesToggle<CR>
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 1
" --- --- ---

" --- Ctrl-P Plugin ---
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <leader>pb :CtrlPBuffer<CR>
" let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" --- --- ---


" --- NERDTree Plugin ---
" nnoremap <leader>nt :NERDTreeToggle<CR>
" nnoremap <leader>nb :NERDTreeFromBookmark<Space>
" nnoremap <silent> <leader>nf :NERDTreeFind<CR>
" let NERDTreeMapOpenInTab="o"
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

let NERDTreeMinimalUI = 0
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
" --- --- ---


" --- nvim-toggle-terminal ---
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
" --- --- ---



" --- Vim Wiki & Instant Markdown Plugin ---
let g:vimwiki_listsyms = ' x'
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let wiki_1 = {}
let wiki_1.path = '~/vimwiki/worklog/'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'
let g:vimwiki_list = [wiki_1]
let g:vimwiki_folding = 'expr'
" map <leader>wt :VimwikiTable<cr>
nnoremap yot :syn on<cr>    " turn on syntax highlighting
"  --- --- ---
