" https://github.com/craftzdog/dotfiles-public/blob/master/.config/nvim/after/plugin/tabline.rc.vim
if !exists('#LspColors') | finish | endif

lua << EOF
require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})
EOF

