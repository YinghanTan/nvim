" Fire Neovim

set guifont=FiraCode_Nerd_Font:h17 " for Firenvim only as Neovim does not use guifont only GVim uses guifont
if !exists('g:started_by_firenvim')
  " set laststatus=0
  " augroup firenvim
  " general options

else
    set laststatus=2
endif


if exists('g:started_by_firenvim') && g:started_by_firenvim
    " general options
    " set laststatus=0 nonumber noruler noshowcmd
    set cmdheight=1             " More space for displaying messages"

    augroup firenvim
        au!
        au BufEnter *ipynb* set filetype=python
        au BufEnter *ipynb* set lines=25
        " au BufEnter *ipynb* set columns=90
        " Change `firenvim` file type to enable syntax highlight, `coc` works perfectly
        au BufEnter github.com_*.txt set filetype=markdown
        au BufEnter txti.es_*.txt set filetype=javascript
        au BufEnter *.airtableblocks.com_*.ts set filetype=javascript
        au BufEnter *-description.txt set filetype=markdown
        " autocmd BufEnter txti.es_*.txt set filetype=typescript
    augroup END
endif


function! s:IsFirenvimActive(event) abort
    if !exists('*nvim_get_chan_info')
        return 0
    endif
    let l:ui = nvim_get_chan_info(a:event.chan)
    return has_key(l:ui, 'client') && has_key(l:ui.client, 'name') &&
                \ l:ui.client.name =~? 'Firenvim'
endfunction
function! OnUIEnter(event) abort
    if s:IsFirenvimActive(a:event)
        " Disable the Status bar
        " set laststatus=0
        " Increase the font size
        " set guifont=Hack\ Nerd\ Font:h10
        " set guifont=FiraCode\ Nerd\ Font:h10
        nnoremap <C-w>M :set lines=100 columns=100<cr>
        nnoremap <C-w>m :set lines=25 columns=100<cr>
    endif
endfunction
autocmd UIEnter * call OnUIEnter(deepcopy(v:event))





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

" let fc = g:firenvim_config['localSettings']
" let fc['*:8888*'] = { 'takeover': 'never', 'priority': 1 }




