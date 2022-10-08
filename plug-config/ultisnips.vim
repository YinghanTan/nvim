" --- Ultisnips Support Multiple FileTypes ---
autocmd FileType tex,latex UltiSnipsAddFiletypes tex.latex
" autocmd FileType javascript,javascriptreact,typescript,typescriptreact
"   \ UltiSnipsAddFiletypes javascript.javascriptreact.typescript.typescriptreact

" --- UltiSnip Plugin ---
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsEditSplit="vertical"
" let g:UltiSnipsListSnippets="<C-l>"
" --- --- --- ---

" --- honza vim-snippets --- 
let g:snips_author="Yinghan Tan"
" --- --- --- ---

" --- runtimepath ---
" Add your private snippet path to runtimepath
set runtimepath^=~/dotfiles
set runtimepath+=~/.config/nvim   " Vim Ultisnips Emmet SkeletonFolder
set runtimepath+=~/.config/nvim/autoload/plugged/vim-snippets   " Vim Ultisnips Emmet SkeletonFolder
set runtimepath+=~/.config/nvim/autoload/plugged/vim-snippets/pythonx   " Vim Ultisnips Emmet SkeletonFolder
set runtimepath+=~/.config/nvim/autoload/plugged/vim-react-snippets   " add vim-react-snippets
set runtimepath+=~/.config/nvim/autoload/plugged/dartlang-snippets " add dartlang snippets
set runtimepath+=~/.config/nvim/autoload/plugged/dartlang-snippets/UltiSnips/dart " add dartlang snippets
" --- --- --- ---

" --- Snippet Directories ---
" When vim starts, Ultisnips tries to find snippet directories defined below, under the paths in runtimepath.
let g:UltiSnipsSnippetDirectories=["UltiSnips", "user_snippets", "pythonx"]
" Our personal snippets go into ~/dotfiles/user_snippets.
" By defining this, ':UltiSnipsEdit' call opens new file at this location
let g:UltiSnipsSnippetsDir="~/.config/nvim/UltiSnips"
" By defining this, ':UltiSnipsEdit' search for snippets to edit at this location
let g:UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit = "~/.config/nvim/UltiSnips"
" --- --- --- ---

" Hitting $ now directly translates into being in inline math mode. How cool is that?
" inoremap <silent> $$ $$<C-R>=UltiSnips#Anon(':latex:\`$1\`', '$$')<cr>


" ultisnips
xmap <leader>uc  <Plug>(coc-convert-snippet)
