" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-abolish'
    Plug 'vimwiki/vimwiki'
    " Plug 'terryma/vim-multiple-cursors'

    Plug 'easymotion/vim-easymotion'
    " Plug 'itchyny/lightline.vim'
    " Plug 'maximbaz/lightline-ale'
    Plug 'vim-airline/vim-airline'
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'jremmen/vim-ripgrep'
    Plug 'airblade/vim-rooter'

    Plug 'sheerun/vim-polyglot'
    Plug 'lifepillar/vim-solarized8'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'pedrohdz/vim-yaml-folds'

    Plug 'sirver/ultisnips'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'mattn/webapi-vim'
    " Plug 'mattn/emmet-vim'
    Plug 'honza/vim-snippets'
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'tomtom/tcomment_vim'
    Plug 'tomtom/tlib_vim'
    Plug 'jiangmiao/auto-pairs' " Brackets autocomplete

    Plug 'editorconfig/editorconfig-vim'
    Plug 'scrooloose/nerdtree'
    Plug 'vim-utils/vim-man'
    Plug 'leafgarland/typescript-vim'
    Plug 'mbbill/undotree'
    " Plug 'pakutoma/toggle-terminal'
    " Plug 'tpope/vim-sleuth'
    " Plug 'dense-analysis/ale', { 'on': 'ALEToggle' }
    " Plug 'dense-analysis/ale'
    " Plug 'ctrlpvim/ctrlp.vim'

    " Themes
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
    Plug 'voldikss/vim-floaterm'
    Plug 'joshdick/onedark.vim'
    " Plug 'rakr/vim-one'
    " Git Integration

    Plug 'caenrique/nvim-toggle-terminal'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'liuchengxu/vim-which-key'
    Plug 'godlygeek/tabular'
    Plug 'mhinz/vim-startify'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'junegunn/rainbow_parentheses.vim'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'metakirby5/codi.vim'
    Plug 'ChristianChiarulli/far.vim'
    Plug 'nelstrom/vim-visual-star-search'

call plug#end()
