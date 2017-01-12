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
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'sjl/gundo.vim'
Plugin 'w0ng/vim-hybrid'
Plugin 'Valloric/YouCompleteMe'
filetype on

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" YCM settings
let g:ycm_show_diagnostics_ui = 0
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" vim tags settings
let g:easytags_cmd = '/usr/local/bin/ctags'
let g:easytags_async = 1 "experimental, might not work properly
let g:easytags_events = ['BufWritePost']
let g:easytags_autorecurse = 1
let g:easytags_include_members = 1
let g:easytags_resolve_links = 1
"set tags=tags
"let g:autotagTagsFile="tags"

" 42
Bundle '42header'
Bundle 'generator_h'
Bundle 'speed_open'

" vimscript
let mapleader = ","
nnoremap <leader>h :call Speed_open("vs")<cr>
nnoremap <leader>H :call Speed_open("sp")<cr>
