" --- Reference ---
" https://www.chrisatmachine.com/Neovim/19-coc-marketplace/

" Brief help
" :CocUninstall   - Uninstall extensions
" :CocInstall     - installs extensions
" :CocUpdate      - To update your extensions
" :CocEnable      - Enable Coc
" :CocDisable     - Disable Coc
" :CocList extensions  - Manage extensions
" :CocList marketplace    - List all extensions for installation

let g:coc_global_extensions = [
    \ 'coc-restclient',
    \ 'coc-actions',
    \ 'coc-css',
    \ 'coc-cssmodules',
    \ 'coc-diagnostic',
    \ 'coc-docker',
    \ 'coc-emmet',
    \ 'coc-eslint',
    \ 'coc-flutter',
    \ 'coc-flutter-tools',
    \ 'coc-fzf-preview',
    \ 'coc-git',
    \ 'coc-html',
    \ 'coc-htmldjango',
    \ 'coc-java',
    \ 'coc-java-debug',
    \ 'coc-json',
    \ 'coc-lua',
    \ 'coc-marketplace',
    \ 'coc-prettier',
    \ 'coc-pyright',
    \ 'coc-sh',
    \ 'coc-snippets',
    \ 'coc-svg',
    \ 'coc-swagger',
    \ 'coc-texlab',
    \ 'coc-tslint-plugin',
    \ 'coc-tsserver',
    \ 'coc-ultisnips',
    \ 'coc-vimlsp',
    \ 'coc-vimtex',
    \ 'coc-xml',
    \ 'coc-yaml',
    \ 'coc-yank',
    \ '@yaegassy/coc-ansible',
    \ ]
    " \ 'coc-cfn-lint',
    " \ 'coc-fzf',
    " \ 'coc-hightlight',
    " \ 'coc-jedi',
    " \ 'coc-jira-complete',
    " \ 'coc-leetcode',
    " \ 'coc-list',
    " \ 'coc-pairs',
    " \ 'coc-python',

" coc-fzf-preview options
let g:coc_fzf_preview = ''
let g:coc_fzf_opts = []

" Prettier
" command! -nargs=0 Prettier :CocCommand prettier.formatFile

" " Swagger
" " tip: add a (slightly) short command
" command -nargs=0 Swagger :CocCommand swagger.render

" yaegassy/coc-htmldjango
let g:coc_filetype_map = {
  \ 'jinja.html': 'htmldjango',
  \ 'htmldjango': 'html',
  \ }


