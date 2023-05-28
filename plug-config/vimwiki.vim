" --- Reference ---
" https://www.youtube.com/watch?v=vBJj7YMVn6I

" --- Vim Wiki & Instant Markdown Plugin ---
let g:vimwiki_listsyms = ' x'
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let wiki_1 = {}
let wiki_1.path = '~/vimwiki/' " set path to a wiki directory
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md' " set extension to .md
let zettelkasten = {}
let zettelkasten.path = '~/vimwiki/zettelkasten/' " set path to a wiki directory
let zettelkasten.syntax = 'markdown'
let zettelkasten.ext = '.md' " set extension to .md
let g:vimwiki_list = [wiki_1, zettelkasten]
let g:vimwiki_folding = 'expr'
au FileType vimwiki setlocal shiftwidth=2 tabstop=2 noexpandtab

let g:vimwiki_global_ext = 1 " make sure vimwiki doesn't own all .md files


" --- zettlekasten ---
let g:zettelkasten = "~/vimwiki/zettelkasten/"
command! -nargs=1 NewZettel :execute ":e" zettelkasten . strftime("%Y%m%d%H%M%S") . "-<args>.md"
nnoremap <leader>nz :NewZettel 




" Deprecated
" let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
" let g:vimwiki_list = [{'path': '$HOME/Dropbox/wiki'}] " set path to a directory inside Dropbox
" nnoremap yot :syn on<cr>    " turn on syntax highlighting
