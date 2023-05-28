" --- zettlekasten ---
let g:zettelkasten = "~/vimwiki/"
command! -nargs=1 Zet :execute ":e" zettelkasten . strftime("%Y%m%d%H%M%S") . "-<args>.md"
nnoremap <leader>nz :Zet 

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

" :ZettelBackLinks command – insert list of notes that link to the current note.
" :ZettelInbox command – insert list of notes that no other note links to.
" :ZettelGenerateLinks command – insert list of all wiki pages in the current page. It needs updated tags database. The tags database can be updated using the :VimwikiRebuildTags command.
" z command in the visual mode – create a new wiki file using selected text for the note title
" ]] command in the insert mode – create a link to a note. It uses FZF for the note searching.
" T command in the normal mode – yank the current note filename and title as a Vimwiki link
" gZ command in the normal mode – replace file path under cursor with Wiki link
" use <C-x><C-f> and the Enter to create link
