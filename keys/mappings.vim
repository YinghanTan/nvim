
" xnoremap('<leader>P', '\"_dp') " Paste keeping buffer intact


" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>


" Visually select the text that was last edited/pasted
nmap gV `[v`]
" Open file under cursor in split

" nmap gF <c-w>f
nmap gF :vert wincmd f<CR>

if !exists('g:lasttab')
  let g:lasttab = 1
endif
nmap g^ :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" modify paste in visual mode to paste repeatedly
xnoremap <leader>p "_dP

" add :Te to :tabe.
cnoreabbrev Te tabe.

" map <leader>pp :setlocal paste!<cr>             " Toggle paste mode on and off
" set pastetoggle=<leader>pt       " paste mode: avoid auto indent, treat chars

" Press * to search for the term under the cursor or a visual selection and
" then press the keys below to replace all instances of it in the current file.
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>

" The same as above but instead of acting on the whole file it will be
" restricted to the previously visually selected range. You can do that by
" pressing *, visually selecting the range you want it to apply to and then
" press a key below to replace all instances of it in the current selection.
xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>


" Prevent x from overriding what's in the clipboard.
" noremap x "_x
" noremap X "_x

" Ensure tabs don't get converted to spaces in Makefiles.
autocmd FileType make setlocal noexpandtab

" Ensure tabs don't get converted to spaces in Makefiles.
autocmd FileType make setlocal noexpandtab


" Add all TODO items to the quickfix list relative to where you opened Vim.
function! s:todo() abort
  let entries = []
  for cmd in ['git grep -niIw -e TODO -e FIXME 2> /dev/null',
            \ 'grep -rniIw -e TODO -e FIXME . 2> /dev/null']
    let lines = split(system(cmd), '\n')
    if v:shell_error != 0 | continue | endif
    for line in lines
      let [fname, lno, text] = matchlist(line, '^\([^:]*\):\([^:]*\):\(.*\)')[1:3]
      call add(entries, { 'filename': fname, 'lnum': lno, 'text': text })
    endfor
    break
  endfor

  if !empty(entries)
    call setqflist(entries)
    copen
  endif
endfunction

command! Todo call s:todo()

" Profile Vim by running this command once to start it and again to stop it.
function! s:profile(bang)
  if a:bang
    profile pause
    noautocmd qall
  else
    profile start /tmp/profile.log
    profile func *
    profile file *
  endif
endfunction

command! -bang Profile call s:profile(<bang>0)

