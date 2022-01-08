" navigate chunks of current buffer
nmap [h <Plug>(coc-git-prevchunk)
nmap ]h <Plug>(coc-git-nextchunk)


" " navigate conflicts of current buffer
" nmap [c <Plug>(coc-git-prevconflict)
" nmap ]c <Plug>(coc-git-nextconflict)
" " show chunk diff at current position
" nmap \gi <Plug>(coc-git-chunkinfo)
" " show commit contains current position => use git status cc instead
" nmap gC <Plug>(coc-git-commit)
" create text object for git chunks

omap ih <Plug>(coc-git-chunk-inner)
xmap ih <Plug>(coc-git-chunk-inner)
omap ah <Plug>(coc-git-chunk-outer)
xmap ah <Plug>(coc-git-chunk-outer)



" airline status line integration

function! s:update_git_status()
  let g:airline_section_b = "%{get(b:,'coc_git_status','')}"
endfunction
let g:airline_section_b = "%{get(b:,'coc_git_status','')}"
autocmd User CocGitStatusChange call s:update_git_status()


