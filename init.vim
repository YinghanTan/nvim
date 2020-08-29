source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/themes/onedark.vim
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/ultisnips.vim
source $HOME/.config/nvim/plug-config/floaterm.vim
source $HOME/.config/nvim/plug-config/start-screen.vim
source $HOME/.config/nvim/keys/which-key.vim
source $HOME/.config/nvim/keys/mappings.vim

" --- EasyMotion Plugin ---
hi link EasyMotionTarget Search
hi link EasyMotionTarget2First Search
hi link EasyMotionTarget2Second Search
hi link EasyMotionShade Comment
" --- --- ---
set textwidth=0
set wrapmargin=0


"--- Emmet Plugin ---
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.vim/.snippets_custom.json')), "\n"))
let g:user_emmet_install_global = 0
autocmd FileType html,css,md EmmetInstall
if has("autocmd")
    autocmd FileType html,css,md EmmetInstall
endif
" --- --- --- ---

set diffopt=vertical
