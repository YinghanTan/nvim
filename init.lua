vim.g.python3_host_prog = '$HOME/.pyenv/versions/3.9.9/bin/python'

require("config")
require("utils")
require("plugins").setup()


vim.cmd('source $HOME/.config/nvim/general/settings.vim')
vim.cmd('source $HOME/.config/nvim/general/folding.vim')
vim.cmd('source $HOME/.config/nvim/general/functions.vim')
vim.cmd('source $HOME/.config/nvim/keys/mappings.vim')
vim.cmd('source $HOME/.config/nvim/themes/theme.vim')
vim.cmd('source $HOME/.config/nvim/plug-config/fugitive.vim')
vim.cmd('source $HOME/.config/nvim/plug-config/git-messenger.vim')
vim.cmd('source $HOME/.config/nvim/plug-config/firenvim.vim')
vim.cmd('source $HOME/.config/nvim/plug-config/surround.vim')
vim.cmd('source $HOME/.config/nvim/plug-config/tabularize.vim')
vim.cmd('source $HOME/.config/nvim/plug-config/vimwiki.vim')
vim.cmd('source $HOME/.config/nvim/plug-config/vimwiki-sync.vim')
vim.cmd('source $HOME/.config/nvim/plug-config/floaterm.vim')
vim.cmd('source $HOME/.config/nvim/plug-config/fastFold.vim')
vim.cmd('source $HOME/.config/nvim/plug-config/markdownPreview.vim')
vim.cmd('source $HOME/.config/nvim/plug-config/rnvimr.vim')
vim.cmd('source $HOME/.config/nvim/plug-config/undotree.vim')
vim.cmd('source $HOME/.config/nvim/plug-config/vimspector.vim')
vim.cmd('source $HOME/.config/nvim/plug-config/grepper.vim')
vim.cmd('source $HOME/.config/nvim/plug-config/scripts.vim')
vim.cmd('source $HOME/.config/nvim/plug-config/zoomwintab.vim')


-- --- Brief help ---
-- \.                        - go to init.vim
-- gf                        - cursor on sourced file to explore configs
-- gx                        - cursor on url to explore references
-- :checkhealth              - check that installations are healthy
-- :PlugInstall              - installs plugins; append `!` to update or just :PluginUpdate
-- :PlugClean                - confirms removal of unused plugins; append `!` to auto-approve removal
-- :PlugUpdate               - To update your plugins
-- :PlugUpgrade              - Upgrade vim-plug itself
-- :PlugStatus               - Check Status of plugins
-- :UpdateRemotePlugins

-- --- References ---
-- https://www.chrisatmachine.com/
-- https://www.youtube.com/channel/UC8ENHE5xdFSwx71u3fDH5Xw
-- http://vimcasts.org/episodes/
-- https://www.youtube.com/c/BrodieRobertson/community

-- --- Deprecated ---
-- source $HOME/.config/nvim/plug-config/easyMotion.vim
-- source $HOME/.config/nvim/keys/which-key.vim
-- source $HOME/.config/nvim/themes/dracula.vim
-- luafile $HOME/.config/nvim/lua/tokyonight.lua
-- luafile $HOME/.config/nvim/lua/dracula.lua
-- source $HOME/.config/nvim/themes/airline.vim
-- source $HOME/.config/nvim/themes/onedark.vim
-- source $HOME/.config/nvim/plug-config/nerdtree.vim
-- luafile $HOME/.config/nvim/lua/vim-notify.lua
-- luafile $HOME/.config/nvim/lua/fzf-lua.lua
-- source $HOME/.config/nvim/plug-config/fzf.vim
-- source $HOME/.config/nvim/plug-config/fzfPreview.vim
-- source $HOME/.config/nvim/plug-config/vim-rooter.vim
-- source $HOME/.config/nvim/plug-config/vimtex.vim
--
-- --- Python Dependencies ---
-- pynvim pyright black pylint ranger-fm
--
-- --- Node Dependencies ---
-- neovim prettier 
--
-- ripgrep fzf
--
-- map <leader>ew :e <C-R>=expand("%:p:h") ."/"<CR>
-- map <leader>es :sp <C-R>=expand("%:p:h") ."/"<CR>
-- map <leader>ev :vsp <C-R>=expand("%:p:h") ."/"<CR>
--
