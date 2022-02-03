" --- UltiSnip Plugin ---
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsEditSplit="vertical"
" let g:UltiSnipsListSnippets="<C-l>"

let g:UltiSnipsSnippetDirectories=["~/.config/nvim/UltiSnips", "UltiSnips"]
" --- --- --- ---

" --- honza vim-snippets --- 
let g:snips_author="Yinghan Tan"
" --- --- --- ---

" Our personal snippets go into ~/dotfiles/user_snippets.
" By defining this, ':UltiSnipsEdit' call opens new file at this location
let g:UltiSnipsSnippetsDir="~/.config/nvim/UltiSnips"

" Add your private snippet path to runtimepath
set runtimepath^=~/dotfiles
set runtimepath+=~/.config/nvim   " Vim Ultisnips Emmet SkeletonFolder
set runtimepath+=~/.config/nvim/autoload/plugged/vim-snippets   " Vim Ultisnips Emmet SkeletonFolder
set runtimepath+=~/.config/nvim/autoload/plugged/vim-snippets/pythonx   " Vim Ultisnips Emmet SkeletonFolder
set runtimepath+=~/.config/nvim/autoload/plugged/vim-react-snippets   " Vim Ultisnips Emmet SkeletonFolder

" When vim starts, Ultisnips tries to find snippet directories defined below, under the paths in runtimepath.
let g:UltiSnipsSnippetDirectories=["UltiSnips", "user_snippets", "pythonx"]


