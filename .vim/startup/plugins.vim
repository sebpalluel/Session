filetype off

set laststatus=2
set t_Co=256
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Plugin 'vundlevim/vundle.vim'
Plugin 'scrooloose/NERDTree'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
Plugin 'scrooloose/syntastic'
Plugin 'lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'szw/vim-tags' "http://www.gmarik.info/blog/2010/ctags-on-OSX/ -> alias to new ctags (bug ctags -R)
Plugin 'sjl/gundo.vim'
filetype on

" Syntastic settings

" 42
Bundle '42header'
Bundle 'generator_h'
Bundle 'speed_open'

" vimscript
let mapleader = ","
nnoremap <leader>h :call Speed_open("vs")<cr>
nnoremap <leader>H :call Speed_open("sp")<cr>
