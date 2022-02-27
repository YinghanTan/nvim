" General Settings
set runtimepath^=~/.config/nvim/autoload/coc.nvim/

source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/folding.vim
source $HOME/.config/nvim/general/functions.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/keys/which-key.vim

" Themes
source $HOME/.config/nvim/themes/onedark.vim

" Status Line
source $HOME/.config/nvim/themes/airline.vim

" Autocompletion
source $HOME/.config/nvim/plug-config/coc/coc.vim
source $HOME/.config/nvim/plug-config/coc/cocExtensions.vim
source $HOME/.config/nvim/plug-config/cocSnippets.vim
source $HOME/.config/nvim/plug-config/ultisnips.vim

" Git
source $HOME/.config/nvim/plug-config/fugitive.vim
source $HOME/.config/nvim/plug-config/coc/coc-git.vim
source $HOME/.config/nvim/plug-config/git-messenger.vim

" Plugin Configuration
source $HOME/.config/nvim/plug-config/firenvim.vim
source $HOME/.config/nvim/plug-config/rainbow.vim
source $HOME/.config/nvim/plug-config/codi.vim
source $HOME/.config/nvim/plug-config/surround.vim
source $HOME/.config/nvim/plug-config/nerdtree.vim
source $HOME/.config/nvim/plug-config/vimIndentGuide.vim
source $HOME/.config/nvim/plug-config/tabularize.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/vimwiki.vim
source $HOME/.config/nvim/plug-config/vimwiki-sync.vim
source $HOME/.config/nvim/plug-config/floaterm.vim
source $HOME/.config/nvim/plug-config/far.vim
source $HOME/.config/nvim/plug-config/autopairs.vim
source $HOME/.config/nvim/plug-config/fastFold.vim
source $HOME/.config/nvim/plug-config/vim-rooter.vim
source $HOME/.config/nvim/plug-config/vimtex.vim
source $HOME/.config/nvim/plug-config/dart.vim
source $HOME/.config/nvim/plug-config/markdownPreview.vim
source $HOME/.config/nvim/plug-config/fzfPreview.vim
source $HOME/.config/nvim/plug-config/markdown.vim
source $HOME/.config/nvim/plug-config/gist.vim
source $HOME/.config/nvim/plug-config/grepper.vim
source $HOME/.config/nvim/plug-config/rnvimr.vim
source $HOME/.config/nvim/plug-config/undotree.vim
source $HOME/.config/nvim/plug-config/vimspector.vim

" --- Lua Plugins
luafile $HOME/.config/nvim/lua/plug-colorizer.lua
luafile $HOME/.config/nvim/lua/hop.lua
luafile $HOME/.config/nvim/lua/neoscroll.lua
luafile $HOME/.config/nvim/lua/dial.lua
luafile $HOME/.config/nvim/lua/numb.lua
luafile $HOME/.config/nvim/lua/vim-matchup.lua
luafile $HOME/.config/nvim/lua/todo-comments.lua
luafile $HOME/.config/nvim/lua/gitlinker.lua


" --- Brief help ---
" \.                        - go to init.vim
" gf                        - cursor on sourced file to explore configs
" gx                        - cursor on url to explore references
" :checkhealth              - check that installations are healthy
" :PlugInstall              - installs plugins; append `!` to update or just :PluginUpdate
" :PlugClean                - confirms removal of unused plugins; append `!` to auto-approve removal
" :PlugUpdate               - To update your plugins
" :PlugUpgrade              - Upgrade vim-plug itself
" :PlugStatus               - Check Status of plugins
" :UpdateRemotePlugins

" --- References ---
" https://www.chrisatmachine.com/
" https://www.youtube.com/channel/UC8ENHE5xdFSwx71u3fDH5Xw
" http://vimcasts.org/episodes/
" https://www.youtube.com/c/BrodieRobertson/community

" --- Deprecated ---
" source $HOME/.config/nvim/plug-config/easyMotion.vim

" --- Python Dependencies ---
" pynvim pyright black pylint ranger-fm

" --- Node Dependencies ---
" neovim prettier 

" ripgrep fzf
