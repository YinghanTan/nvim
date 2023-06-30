" --- Reference ---
" https://www.youtube.com/watch?v=vBJj7YMVn6I

" --- Vim Wiki & Instant Markdown Plugin ---
let g:vimwiki_listsyms = ' x'
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let wiki_1 = {}
let wiki_1.path = '~/vimwiki/notes/' " set path to a wiki directory
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md' " set extension to .md

let wiki_2 = {}
let wiki_2.path = '~/vimwiki/reference/' " set path to a wiki directory
let wiki_2.syntax = 'markdown'
let wiki_2.ext = '.md' " set extension to .md

let g:vimwiki_list = [ wiki_1, wiki_2 ]
let g:vimwiki_folding = 'expr'
let g:vimwiki_global_ext = 1 " make sure vimwiki doesn't own all .md files




" --- Shortcuts ---

" multiple paste
" xnoremap <leader>p pgvy
" modify paste in visual mode to paste repeatedly
xnoremap <leader>p "_dP

" Change directory to directory of current file
nnoremap <leader>cd :cd %:h<CR>

" clear search
map <leader>/ :let @/=''<cr>

" -- Toggle paste mode on and off
map <leader><leader>p :setlocal paste!<cr>


