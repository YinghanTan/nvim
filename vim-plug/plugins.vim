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
    Plug 'itchyny/lightline.vim'
    " Plug 'maximbaz/lightline-ale'
    " Plug 'vim-airline/vim-airline'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    Plug 'jremmen/vim-ripgrep'

    Plug 'sheerun/vim-polyglot'
    Plug 'lifepillar/vim-solarized8'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'pedrohdz/vim-yaml-folds'

    Plug 'sirver/ultisnips'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'airblade/vim-rooter'
    Plug 'mattn/webapi-vim'
    " Plug 'mattn/emmet-vim'
    Plug 'honza/vim-snippets'
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'tomtom/tcomment_vim'
    Plug 'tomtom/tlib_vim'
    Plug 'jiangmiao/auto-pairs' " Brackets autocomplete

    " Plug 'dense-analysis/ale', { 'on': 'ALEToggle' }
    " Plug 'dense-analysis/ale'
    Plug 'editorconfig/editorconfig-vim'

    Plug 'scrooloose/nerdtree'
    Plug 'ctrlpvim/ctrlp.vim'

    Plug 'vim-utils/vim-man'
    Plug 'leafgarland/typescript-vim'
    Plug 'mbbill/undotree'
    " Plug 'tpope/vim-sleuth'
    Plug 'pakutoma/toggle-terminal'
    " Plug 'gu-fan/Simpleterm.vim'
    " Plug 'iamcco/markdown-preview.vim'

    " Themes
    Plug 'joshdick/onedark.vim'
    " Plug 'rakr/vim-one'
    " Git Integration
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
    Plug 'voldikss/vim-floaterm'

    Plug 'caenrique/nvim-toggle-terminal'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'liuchengxu/vim-which-key'
    Plug 'godlygeek/tabular'
    Plug 'mhinz/vim-startify'

call plug#end()
