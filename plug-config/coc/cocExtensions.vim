let g:coc_global_extensions = [
    \ 'coc-actions',
    \ 'coc-css',
    \ 'coc-cssmodules',
    \ 'coc-emmet',
    \ 'coc-eslint',
    \ 'coc-fzf-preview',
    \ 'coc-diagnostic',
    \ 'coc-yank',
    \ 'coc-ultisnips',
    \ 'coc-snippets',
    \ 'coc-prettier',
    \ 'coc-marketplace',
    \ 'coc-java-debug',
    \ 'coc-java',
    \ 'coc-lua',
    \ 'coc-tslint-plugin',
    \ 'coc-tsserver',
    \ 'coc-yaml',
    \ 'coc-vimlsp',
    \ 'coc-sh',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-svg',
    \ 'coc-xml',
    \ 'coc-pyright',
    \ 'coc-flutter',
    \ 'coc-swagger',
    \ 'coc-git',
    \ 'coc-docker',
    \ 'coc-htmldjango',
    \ 'coc-vimtex',
    \ 'coc-texlab',
    \ 'coc-flutter',
    \ 'coc-flutter-tools',
    \ ]
    " \ 'coc-jira-complete',
    " \ 'coc-jedi',
    " \ 'coc-python',
    " \ 'coc-pairs',
    " \ 'coc-list',
    " \ 'coc-hightlight',
    " \ 'coc-leetcode',
    " 'coc-fzf',




" coc-fzf-preview options
let g:coc_fzf_preview = ''
let g:coc_fzf_opts = []



" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Swagger
" tip: add a (slightly) short command
command -nargs=0 Swagger :CocCommand swagger.render

" yaegassy/coc-htmldjango
let g:coc_filetype_map = {
  \ 'jinja.html': 'htmldjango',
  \ }


" Brief help
" :CocUninstall   - Uninstall extensions
" :CocInstall     - installs extensions
" :CocUpdate      - To update your extensions
" :CocEnable      - Enable Coc
" :CocDisable     - Disable Coc
" :CocList extensions
