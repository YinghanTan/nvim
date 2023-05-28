" --- Reference ---
" https://www.youtube.com/watch?v=vBJj7YMVn6I

" --- Vim Wiki & Instant Markdown Plugin ---
let g:vimwiki_listsyms = ' x'
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let wiki_1 = {}
let wiki_1.path = '~/vimwiki/' " set path to a wiki directory
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md' " set extension to .md
let g:vimwiki_list = [wiki_1]
let g:vimwiki_folding = 'expr'
let g:vimwiki_global_ext = 1 " make sure vimwiki doesn't own all .md files


" --- zettlekasten ---
let g:zettelkasten = "~/vimwiki/"
command! -nargs=1 NewZettel :execute ":e" zettelkasten . strftime("%Y%m%d%H%M%S") . "-<args>.md"
nnoremap <leader>nz :NewZettel 


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

" --- search ---
function! HandleFZF(file)
    "let filename = fnameescape(fnamemodify(a:file, ":t"))
    "why only the tail ?  I believe the whole filename must be linked unless everything is flat ...
    let filename = fnameescape(a:file)
    let filename_wo_timestamp = fnameescape(fnamemodify(a:file, ":t:s/^[0-9]*-//"))
     " Insert the markdown link to the file in the current buffer
    let mdlink = "[ ".filename_wo_timestamp." ]( ".filename." )"
    put=mdlink
endfunction

command! -nargs=1 HandleFZF :call HandleFZF(<f-args>)


" Deprecated
" let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
" let g:vimwiki_list = [{'path': '$HOME/Dropbox/wiki'}] " set path to a directory inside Dropbox
" nnoremap yot :syn on<cr>    " turn on syntax highlighting
