" --- Reference ---
" https://www.chrisatmachine.com/Neovim/05-vim-airline/

" Theme
let g:airline_theme = 'onedark'   " Switch to your current theme
let g:airline_powerline_fonts = 1 " enable powerline fonts
let g:webdevicons_enable_airline_tabline = 1
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''

" TABLINE:                                                                                                                                 
let g:airline#extensions#tabline#enabled = 1           " enable airline tabline                                                           
let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline                                            
let g:airline#extensions#tabline#tabs_label = ''       " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
let g:airline#extensions#tabline#buffers_label = ''    " can put text here like TABS to denote tabs (I clear it so nothing is shown)      
let g:airline#extensions#tabline#fnamemod = ':t'       " disable file paths in the tab                                                    
let g:airline#extensions#tabline#show_tab_count = 0    " dont show tab numbers on the right                                                           
let g:airline#extensions#tabline#show_buffers = 0      " dont show buffers in the tabline                                                 
let g:airline#extensions#tabline#tab_min_count = 1     " minimum of 2 tabs needed to display the tabline                                  
set showtabline=2
let g:airline#extensions#tabline#show_tabs = 1 " enable/disable displaying tabs, regardless of number. (c) >
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1 " enable/disable displaying tab number in tabs mode.
let g:airline#extensions#tabline#show_splits = 1       " disables the buffer name that displays on the right of the tabline               
let g:airline#extensions#tabline#show_tab_type = 0     " disables the weird orange arrow on the tabline
let g:airline#extensions#tabline#overflow_marker = '…' " change the symbol for skipped tabs/buffers (default '...') >
let g:airline_extensions = ['branch', 'hunks', 'coc', 'fugitiveline', 'tabline']   " Show branches hunks and COC
let g:airline#extensions#hunks#coc_git = 1
let g:airline#extensions#coc#enabled = 1    " Enable COC Integration
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]
let g:airline_skip_empty_sections = 1
let airline#extensions#tabline#current_first = 0 " always show current tabpage/buffer first >


" --- Sections ---
" let g:airline_section_c = '%t'
" let g:airline_section_b = airline#section#create_left(['hunks'])
" let g:airline_section_c = '%{airline#extensions#branch#get_head()} %t' " in section B of the status line display the CWD                                                 
let g:airline_section_c = airline#section#create_left(['%{airline#extensions#branch#get_head()}', '%t']) " in section B of the status line display the CWD                                                 
" let g:airline_section_a = " NVCode"
" let g:airline_section_c = '%t' " in section B of the status line display the CWD                                                 
" '%{airline#extensions#branch#get_head()} %{airline#extensions#hunks#get_raw_hunks()}' " in section B of the status line display the CWD                                                 
" let g:airline_section_a = ""
" " let g:airline_section_c = airline#section#create([''])
" " let g:airline_section_z = airline#section#create(['linenr'])
" let g:airline_section_y = ''
" --- --- ---


" Shortens Mode Indicator to 1 Letter
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ ''   : 'V',
    \ 's'  : 'S',
    \ }
" --- --- ---

