" --- Reference ---
" https://www.youtube.com/watch?v=ID_kNcj9cMo&t=89s
" https://github.com/alerque/que-vim/blob/f8d189cee8649b61d8969e7aee8e27626446bbdd/.config/nvim/init.vim#L908
" --- Fire Neovim ---


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
        au BufEnter bitbucket.com_*.txt set filetype=markdown
        au BufEnter gitlab.com_*.txt set filetype=markdown
        au BufEnter txti.es_*.txt set filetype=javascript
        au BufEnter *.airtableblocks.com_*.ts set filetype=javascript
        au BufEnter *-description.txt set filetype=markdown
    augroup END
endif


function! s:IsFirenvimActive(event) abort
    if !exists('*nvim_get_chan_info')
        return 0
    endif
    let l:ui = nvim_get_chan_info(a:event.chan)
    return has_key(l:ui, 'client') &&
                \ has_key(l:ui.client, 'name') &&
                \ l:ui.client.name =~? 'Firenvim'
endfunction


function! OnUIEnter(event) abort
    if s:IsFirenvimActive(a:event)
        " set guifont=Hack\ Nerd\ Font:h10
        set guifont=FiraCode\ Nerd\ Font:h10
        nnoremap <C-w>M :set lines=100 columns=100<cr>
        nnoremap <C-w>m :set lines=25 columns=100<cr>
    endif
endfunction

autocmd UIEnter * call OnUIEnter(deepcopy(v:event))


let g:firenvim_config = { 
    \ 'globalSettings': {
        \ 'alt': 'all',
        \ '<C-n>': 'noop',
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

