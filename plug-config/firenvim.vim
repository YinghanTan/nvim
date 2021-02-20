" Fire Neovim


if exists('g:started_by_firenvim')
  set laststatus=0

  set guifont=FiraCode\ Nerd\ Font:h10
  " set guifont=Hack\ Nerd\ Font:h9
  augroup firenvim
else
  set laststatus=2
endif

if exists('g:started_by_firenvim') && g:started_by_firenvim

    " general options
    set cmdheight=1             " More space for displaying messages"

    augroup firenvim
        au!
        au BufEnter *ipynb* set filetype=python
        au BufEnter *ipynb* set lines=25
        au BufEnter github.com_*.txt set filetype=markdown
        au BufEnter txti.es_*.txt set filetype=javascript
        " au BufEnter airtable.com_*.txt set filetype=js
        au BufEnter *.airtableblocks.com_*.ts set filetype=javascript
        au BufEnter *-description.txt set filetype=markdown
        " au BufEnter *.ipynb* set filetype=python
    augroup END

endif



let g:firenvim_config = { 
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'priority': 1,
            \ 'selector': 'textarea',
            \ 'takeover': 'never',
        \ },
    \ }
\ }

" \ 'takeover': 'always',
let fc = g:firenvim_config['localSettings']
" let fc['*:8888*'] = { 'takeover': 'never', 'priority': 1 }




