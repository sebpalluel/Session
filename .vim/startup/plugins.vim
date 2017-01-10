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
Plugin 'craigemery/vim-autotag'
Plugin 'sjl/gundo.vim'
Plugin 'w0ng/vim-hybrid'
Plugin 'Valloric/YouCompleteMe'
filetype on

" Syntastic settings

" vim tags settings
set tags=tags

" 42
Bundle '42header'
Bundle 'generator_h'
Bundle 'speed_open'

" vimscript
let mapleader = ","
nnoremap <leader>h :call Speed_open("vs")<cr>
nnoremap <leader>H :call Speed_open("sp")<cr>
