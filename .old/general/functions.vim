" Random Useful Functions

" Turn spellcheck on for markdown files
augroup auto_spellcheck
  autocmd BufNewFile,BufRead *.md setlocal spell
augroup END

" nnoremap <f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
" \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
" \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

" function! HandleURL()
"   let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
"   echo s:uri
"   if s:uri != ""
"     silent exec "!open '".s:uri."'"
"   else
"     echo "No URI found in line."
"   endif
" endfunction
" map <leader>au :call HandleURL()<cr>


