" --- Reference ---
" https://www.youtube.com/watch?v=vBJj7YMVn6I

" --- Vim Wiki & Instant Markdown Plugin ---
let g:vimwiki_listsyms = ' x'
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let wiki_1 = {}
let wiki_1.path = '~/vimwiki/worklog/' " set path to a wiki directory
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md' " set extension to .md
let g:vimwiki_list = [wiki_1]
let g:vimwiki_folding = 'expr'

let g:vimwiki_global_ext = 0 " make sure vimwiki doesn't own all .md files




" Deprecated
" let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
" let g:vimwiki_list = [{'path': '$HOME/Dropbox/wiki'}] " set path to a directory inside Dropbox
" nnoremap yot :syn on<cr>    " turn on syntax highlighting
