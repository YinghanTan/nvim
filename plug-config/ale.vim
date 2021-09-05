function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_warnings = l:counts.total - l:all_errors

    let l:errors_recap = l:all_errors == 0 ? '' : printf('%d⨉ ', all_errors)
    let l:warnings_recap = l:all_warnings == 0 ? '' : printf('%d⚠ ', all_warnings)
    return (errors_recap . warnings_recap)
endfunction


" " --- Status Line warning & Errors ---
" function! LinterStatus() abort
"     let l:counts = ale#statusline#Count(bufnr(''))
"     let l:all_errors = l:counts.error + l:counts.style_error
"     let l:all_non_errors = l:counts.total - l:all_errors
"     return l:counts.total == 0 ? '✨ all good ✨' : printf(
"         \   '😞 %dW %dE',
"         \   all_non_errors,
"         \   all_errors
"         \)
" endfunction
" " --- --- ---


set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}



" --- Ale Plugin ---
" let g:ale_disable_lsp = 1 " disable ale parts for working with coc
let g:ale_linters_explicit = 1
let g:ale_lint_on_enter = 0
let g:ale_fix_on_save = 1  " Set this variable to 1 to fix files when you save them.
" let g:ale_echo_cursor = 0
let g:ale_javascript_prettier_options = '--tab-width 4'
let b:ale_warn_about_trailing_whitespace = 0
let g:ale_linters = {
    \   'python': ['flake8', 'pylint'],
    \   'ruby': ['standardrb', 'rubocop'],
    \   'javascript': ['eslint'],
    \   'typescript': ['eslint'],
    \   'cloudformation': ['cfn-python-lint']
    \}

let g:ale_fixers = {
    \    'python': ['black', 'yapf'],
    \    'javascript': ['eslint' ],
    \    'typescript': [ 'prettier' ],
    \    'vue': ['prettier'],
    \    'scss': ['prettier'],
    \    'html': ['prettier']
    \}

" Disable warnings about trailing whitespace for Python files.

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
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow


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
