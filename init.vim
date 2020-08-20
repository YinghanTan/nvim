source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/themes/onedark.vim
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/floaterm.vim
source $HOME/.config/nvim/keys/which-key.vim
source $HOME/.config/nvim/keys/mappings.vim

" --- EasyMotion Plugin ---
hi link EasyMotionTarget Search
hi link EasyMotionTarget2First Search
hi link EasyMotionTarget2Second Search
hi link EasyMotionShade Comment
" --- --- ---
set textwidth=0 
set wrapmargin=0


" --- Ale Plugin ---
let g:ale_echo_cursor = 0
let g:ale_linters = {
    \   'python': ['flake8', 'pylint'],
    \   'ruby': ['standardrb', 'rubocop'],
    \   'javascript': ['eslint'],
    \   'typescript': ['eslint'],
    \   'cloudformation': ['cfn-python-lint']
    \}

let g:ale_fixers = {
    \    'python': ['autopep8', 'yapf'],
    \    'javascript': [ 'eslint' ],
    \    'typescript': [ 'eslint'],
    \    'vue': ['eslint'],
    \    'scss': ['prettier'],
    \    'html': ['prettier']
    \}

" Disable warnings about trailing whitespace for Python files.
" let b:ale_warn_about_trailing_whitespace = 0

" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
" nmap <silent> <leader>aj :ALENextWrap<cr>
" nmap <silent> <leader>ak :ALEPreviousWrap<cr>
" nmap <silent> <leader>af :ALEFix<cr>
" nmap <silent> <leader>aJ :ALENextWrap<cr>
" nmap <silent> <leader>aK :ALEPreviousWrap<cr>

" Do not lint or fix minified files.
let g:ale_pattern_options = {
\ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
\   '.*\.env$': {'ale_enabled': 0},
\}

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
" Set this variable to 1 to fix files when you save them.

" --- Status Line warning & Errors ---
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '😞 %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}
" --- --- ---

" --- Lightline Ale Plugin ---
let g:lightline = {}
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }
let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }
" let g:lightline#ale#indicator_checking = "\uf110"
" let g:lightline#ale#indicator_warnings = "\uf071"
" let g:lightline#ale#indicator_errors = "\uf05e"
" let g:lightline#ale#indicator_ok = "\uf00c"
" --- --- ---

"--- Emmet Plugin ---
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.vim/.snippets_custom.json')), "\n"))
let g:user_emmet_install_global = 0
autocmd FileType html,css,md EmmetInstall
if has("autocmd")
    autocmd FileType html,css,md EmmetInstall
endif
" --- --- --- ---

set diffopt=vertical

