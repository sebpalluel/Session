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
Plugin 'w0ng/vim-hybrid'
Plugin 'Valloric/YouCompleteMe'
filetype on

" Syntastic settings

" vim-tags settings
let g:vim_tags_auto_generate = 1
let g:vim_tags_use_vim_dispatch = 0
let g:vim_tags_ctags_binary = "/usr/local/bin/ctags"
let g:vim_tags_ignore_files = ['.gitignore', '.svnignore', '.cvsignore']
"let g:vim_tags_directories = [".git"]

" 42
Bundle '42header'
Bundle 'generator_h'
Bundle 'speed_open'

" vimscript
let mapleader = ","
nnoremap <leader>h :call Speed_open("vs")<cr>
nnoremap <leader>H :call Speed_open("sp")<cr>
