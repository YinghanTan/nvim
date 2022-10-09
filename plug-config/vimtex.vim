if has('unix')
    if b:system == "mac"
        let g:vimtex_view_method = "skim"
        let g:vimtex_view_general_viewer
                \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
        let g:vimtex_view_general_options = '-r @line @pdf @tex'
        let g:vimtex_context_pdf_viewer='skim'

        function! UpdateSkim(status)
            if !a:status | return | endif

            let l:out = b:vimtex.out()
            let l:tex = expand('%:p')
            let l:cmd = [g:vimtex_view_general_viewer, '-r']
            if !empty(system('pgrep Skim'))
            call extend(l:cmd, ['-g'])
            endif
            if has('nvim')
            call jobstart(l:cmd + [line('.'), l:out, l:tex])
            elseif has('job')
            call job_start(l:cmd + [line('.'), l:out, l:tex])
            else
            call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
            endif
        endfunction
    elseif b:system == 'wsl'
        let g:latex_view_general_viewer = "zathura"
        let g:vimtex_view_method = "zathura"
        let g:vimtex_context_pdf_viewer='zathura'
    elseif b:system == 'termux'

    elseif b:system == 'linux'
        let g:latex_view_general_viewer = "zathura"
        let g:vimtex_view_method = "zathura"
        let g:vimtex_context_pdf_viewer='zathura'
    endif
elseif has('win32')

endif





let g:tex_flavor  = 'latex'
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_fold_manual = 1

" Enable mappings
let g:vimtex_mappings_enabled = 1

" " show the compiler hint
" let g:vimtex_quickfix_mode = 1
let g:vimtex_quickfix_mode = 0

if has('nvim')
    let g:vimtex_compiler_progname = 'nvr'
endif

" One of the neosnippet plugins will conceal symbols in LaTeX which is confusing
" let g:tex_conceal='abdmg'
" set conceallevel=1
let g:tex_conceal = ""

" use vimtex as default compiler
let g:vimtex_compiler_latexmk_engines={'_':'-xelatex'}
let g:vimtex_compiler_latexrun_engines={'_':'xelatex'}

let g:vimtex_compiler_latexmk = { 
        \ 'executable' : 'latexmk',
        \ 'options' : [ 
        \   '-xelatex',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
