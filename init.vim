" General Settings
set runtimepath^=~/.config/nvim/autoload/coc.nvim/

source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/functions.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/keys/which-key.vim

" Themes
source $HOME/.config/nvim/themes/onedark.vim

" Update
luafile $HOME/.config/nvim/lua/config-telescope.lua
" source $HOME/.config/nvim/plug-config/signify.vim

" Autocompletion
source $HOME/.config/nvim/plug-config/coc/coc-git.vim
source $HOME/.config/nvim/plug-config/cocSnippets.vim
source $HOME/.config/nvim/plug-config/ultisnips.vim

" Plugin Configuration
source $HOME/.config/nvim/plug-config/firenvim.vim
source $HOME/.config/nvim/plug-config/rainbow.vim
source $HOME/.config/nvim/plug-config/codi.vim
source $HOME/.config/nvim/plug-config/easyMotion.vim
source $HOME/.config/nvim/plug-config/surround.vim
source $HOME/.config/nvim/plug-config/nerdtree.vim
source $HOME/.config/nvim/plug-config/vimIndentGuide.vim
source $HOME/.config/nvim/plug-config/tabularize.vim
source $HOME/.config/nvim/plug-config/fugitive.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/vimwiki.vim
source $HOME/.config/nvim/plug-config/coc/coc.vim
source $HOME/.config/nvim/plug-config/coc/cocExtensions.vim
source $HOME/.config/nvim/plug-config/floaterm.vim
source $HOME/.config/nvim/plug-config/far.vim
source $HOME/.config/nvim/plug-config/autopairs.vim
source $HOME/.config/nvim/plug-config/bracey.vim
source $HOME/.config/nvim/plug-config/leetcode.vim
source $HOME/.config/nvim/plug-config/fastFold.vim
source $HOME/.config/nvim/plug-config/git-messenger.vim
source $HOME/.config/nvim/plug-config/vim-rooter.vim
source $HOME/.config/nvim/plug-config/vimtex.vim
source $HOME/.config/nvim/plug-config/dart.vim
source $HOME/.config/nvim/plug-config/easy-align.vim
luafile $HOME/.config/nvim/lua/plug-colorizer.lua
source $HOME/.config/nvim/plug-config/markdownPreview.vim
source $HOME/.config/nvim/plug-config/fzfPreview.vim
source $HOME/.config/nvim/plug-config/markdown.vim
source $HOME/.config/nvim/plug-config/gist.vim
source $HOME/.config/nvim/plug-config/grepper.vim
source $HOME/.config/nvim/plug-config/rnvimr.vim
source $HOME/.config/nvim/plug-config/undotree.vim
source $HOME/.config/nvim/plug-config/vimspector.vim
" source $HOME/.config/nvim/plug-config/start-screen.vim

" Status Line
source $HOME/.config/nvim/themes/airline.vim


" Brief help
" :PlugInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PlugClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" :PlugUpdate     - To update your plugins
" :PlugUpgrade    - Upgrade vim-plug itself
" :PlugStatus     - Check Status of plugins
