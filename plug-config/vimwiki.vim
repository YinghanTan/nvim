" --- Vim Wiki & Instant Markdown Plugin ---
let g:vimwiki_listsyms = ' x'
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let wiki_1 = {}
let wiki_1.path = '~/vimwiki/worklog/'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'
let g:vimwiki_list = [wiki_1]
let g:vimwiki_folding = 'expr'
" map <leader>wt :VimwikiTable<cr>

nnoremap yot :syn on<cr>    " turn on syntax highlighting
