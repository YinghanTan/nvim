" General Settings
set runtimepath^=~/.config/nvim/autoload/coc.nvim/

source $HOME/.config/nvim/vim-plug/plugins.vim
luafile $HOME/.config/nvim/lua/settings.lua
source $HOME/.config/nvim/general/settings.vim
" source $HOME/.config/nvim/general/folding.vim
luafile $HOME/.config/nvim/lua/folding.lua
source $HOME/.config/nvim/general/functions.vim
source $HOME/.config/nvim/keys/mappings.vim

" Themes
luafile $HOME/.config/nvim/lua/one-dark.lua
source $HOME/.config/nvim/themes/theme.vim
luafile $HOME/.config/nvim/lua/nvim-web-devicons.lua
luafile $HOME/.config/nvim/lua/lualine.lua
luafile $HOME/.config/nvim/lua/nvim-tree.lua
luafile $HOME/.config/nvim/lua/project-nvim.lua
luafile $HOME/.config/nvim/lua/gitsigns.lua

" Status Line

" COC
source $HOME/.config/nvim/plug-config/coc/coc.vim
source $HOME/.config/nvim/plug-config/coc/cocExtensions.vim

" Autocompletion
source $HOME/.config/nvim/plug-config/ultisnips.vim

" Git
source $HOME/.config/nvim/plug-config/fugitive.vim
source $HOME/.config/nvim/plug-config/git-messenger.vim

" Plugin Configuration
source $HOME/.config/nvim/plug-config/firenvim.vim
source $HOME/.config/nvim/plug-config/surround.vim
source $HOME/.config/nvim/plug-config/vimIndentGuide.vim
source $HOME/.config/nvim/plug-config/tabularize.vim
source $HOME/.config/nvim/plug-config/floaterm.vim
source $HOME/.config/nvim/plug-config/far.vim
source $HOME/.config/nvim/plug-config/autopairs.vim
" source $HOME/.config/nvim/plug-config/fastFold.vim
source $HOME/.config/nvim/plug-config/rnvimr.vim
source $HOME/.config/nvim/plug-config/undotree.vim
source $HOME/.config/nvim/plug-config/vimspector.vim
source $HOME/.config/nvim/plug-config/zoomwintab.vim
source $HOME/.config/nvim/plug-config/grepper.vim
source $HOME/.config/nvim/plug-config/scripts.vim

source $HOME/.config/nvim/plug-config/vimwiki.vim
source $HOME/.config/nvim/plug-config/vimwiki-sync.vim
source $HOME/.config/nvim/plug-config/markdownPreview.vim
source $HOME/.config/nvim/plug-config/markdown.vim
source $HOME/.config/nvim/plug-config/vimtex.vim
source $HOME/.config/nvim/plug-config/tex-conceal.vim
source $HOME/.config/nvim/plug-config/dart-vim-plugin.vim

" --- Lua Plugins ---
" luafile $HOME/.config/nvim/lua/plug-colorizer.lua
luafile $HOME/.config/nvim/lua/hop.lua
luafile $HOME/.config/nvim/lua/pretty-fold.lua
luafile $HOME/.config/nvim/lua/neoscroll.lua
luafile $HOME/.config/nvim/lua/vim-matchup.lua
luafile $HOME/.config/nvim/lua/todo-comments.lua
luafile $HOME/.config/nvim/lua/gitlinker.lua
luafile $HOME/.config/nvim/lua/treesitter.lua
luafile $HOME/.config/nvim/lua/nvim-treesitter-context.lua
luafile $HOME/.config/nvim/lua/_telescope.lua
luafile $HOME/.config/nvim/lua/neo-clip.lua
luafile $HOME/.config/nvim/lua/whichkey.lua
luafile $HOME/.config/nvim/lua/git-worktree.lua
luafile $HOME/.config/nvim/lua/hop.lua
" luafile $HOME/.config/nvim/lua/neozoom.lua
" luafile $HOME/.config/nvim/lua/numb.lua

" LSP
" luafile $HOME/.config/nvim/lua/lsp-config.lua
" luafile $HOME/.config/nvim/lua/cmp.lua
" luafile $HOME/.config/nvim/lua/dial.lua
" source $HOME/.config/nvim/plug-config/rainbow.vim
" source $HOME/.config/nvim/plug-config/codi.vim




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
" source $HOME/.config/nvim/keys/which-key.vim
" source $HOME/.config/nvim/themes/dracula.vim
" luafile $HOME/.config/nvim/lua/tokyonight.lua
" luafile $HOME/.config/nvim/lua/dracula.lua
" source $HOME/.config/nvim/themes/onedark.vim
" source $HOME/.config/nvim/themes/airline.vim
" source $HOME/.config/nvim/plug-config/nerdtree.vim
" source $HOME/.config/nvim/plug-config/cocSnippets.vim
" source $HOME/.config/nvim/plug-config/vim-rooter.vim
" source $HOME/.config/nvim/plug-config/coc/coc-git.vim
" source $HOME/.config/nvim/plug-config/fzf.vim
" source $HOME/.config/nvim/plug-config/fzfPreview.vim
" source $HOME/.config/nvim/plug-config/vim-zoom.vim

" === Dependencies ===
" --- Python Dependencies ---
" pynvim pyright black pylint ranger-fm flake8

" --- Node Dependencies ---
" neovim prettier 

" --- linux dependencies ---
" ripgrep fzf bat fdfind delta
