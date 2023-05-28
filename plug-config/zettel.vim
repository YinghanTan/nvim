" --- zettlekasten ---
let g:zettelkasten = "~/vimwiki/"
command! -nargs=1 Zet :execute ":e" zettelkasten . strftime("%Y%m%d%H%M%S") . "-<args>.md"
nnoremap <leader>nz :Zet 

" let g:zettel_options
" let g:zettel_format
" let g:zettel_default_mappings
" let g:zettel_fzf_command
" let g:zettel_fzf_options
" let g:zettel_backlinks_title
" let g:zettel_backlinks_title_level
" let g:zettel_unlinked_notes_title
" let g:zettel_unlinked_notes_title_level
" let g:zettel_generated_tags_title
" let g:zettel_generated_tags_title_level
" |Vim-Zettel-Templates|

" --- vim-zettel ---
let g:nv_search_paths = ['~/vimwiki/']

" Filename format. The filename is created using strftime() function
let g:zettel_format = "%y%m%d%H%M%S"
" command used for VimwikiSearch 
" possible values: "ag", "rg", "grep"
let g:zettel_fzf_command = "ag"
" Disable default keymappings
let g:zettel_default_mappings = 0
" This is basically the same as the default configuration
augroup filetype_vimwiki
  autocmd!
  autocmd FileType vimwiki imap <silent> ]] ]]<esc><Plug>ZettelSearchMap
  autocmd FileType vimwiki nmap T <Plug>ZettelYankNameMap
  autocmd FileType vimwiki xmap z <Plug>ZettelNewSelectedMap
  autocmd FileType vimwiki nmap gZ <Plug>ZettelReplaceFileWithLink
augroup END
" for file search use <C-x><C-f> and use gZ

" " Set template and custom header variable for the second Wiki
" let g:zettel_options = [{},{"front_matter" : {"tags" : ""}, "template" :  "~/mytemplate.tpl"}]


