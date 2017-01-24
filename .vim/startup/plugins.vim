filetype off

set laststatus=2
set t_Co=256
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

call vundle#begin()
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
Plugin 'jameshclrk/Conque-GDB'
Plugin 'airblade/vim-rooter'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
"Plugin 'ervandew/supertab'
Plugin 'mbbill/undotree'
call vundle#end()
filetype on

" 42
Bundle '42header'
Bundle 'generator_h'
Bundle 'speed_open'

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" YCM settings
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_auto_trigger = 0
let g:ycm_add_preview_to_completeopt = 1
set omnifunc=youcompleteme#OmniComplete
"let g:ycm_min_num_of_chars_for_completion = 99
let g:ycm_key_invoke_completion = '<C-n>'
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1 "pop_up window on top appear just when auto_complete
let g:ycm_use_ultisnips_completer = 1

" ultisnips
let g:UltiSnipsExpandTrigger="<c-t>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsListSnippets = "<F6>"
let g:UltiSnipsSnippetsDir='~/.vim/bundle/vim-snippets/UltiSnips'
let g:UltiSnipsUsePythonVersion = 2

" vim tags settings
let g:easytags_cmd = '/usr/local/bin/ctags'
let g:easytags_async = 0 "experimental, might not work properly
let g:easytags_events = ['BufWritePost']
let g:easytags_autorecurse = 1
let g:easytags_include_members = 1
let g:easytags_resolve_links = 1
"with vim/root set tags in local directory as tag file to use contrary to
"/.vimtags
autocmd BufReadPre,FileReadPre * execute !empty(FindRootDirectory()) ? 'setlocal tags=' . FindRootDirectory() . "/.tags" : 'setlocal tags=./.tags'
let g:easytags_dynamic_files=2

" Conque-GDB**)
let g:ConqueTerm_Color = 2         " 1: strip color after 200 lines, 2: always with color
let g:ConqueTerm_CloseOnEnd = 1    " close conque when program ends running
let g:ConqueTerm_StartMessages = 0 " display warning messages if conqueTerm is configured incorrectly
let g:ConqueGdb_Leader = '\'
let g:ConqueGdb_Run = g:ConqueGdb_Leader . 'r'
let g:ConqueGdb_Continue = g:ConqueGdb_Leader . 'c'
let g:ConqueGdb_Next = g:ConqueGdb_Leader . 'n'
let g:ConqueGdb_Step = g:ConqueGdb_Leader . 's'
let g:ConqueGdb_Print = g:ConqueGdb_Leader . 'p'
let g:ConqueGdb_ToggleBreak = g:ConqueGdb_Leader . 'b'
let g:ConqueGdb_Finish = g:ConqueGdb_Leader . 'f'
nnoremap <silent> <leader>y :ConqueGdbCommand y<CR>
nnoremap <silent> <leader>n :ConqueGdbCommand n<CR>

" Undo-Tree
nnoremap <F5> :UndotreeToggle<cr>

" Header/.c speed open script
nnoremap <leader>h :call Speed_open("vs")<cr>
nnoremap <leader>H :call Speed_open("sp")<cr>
