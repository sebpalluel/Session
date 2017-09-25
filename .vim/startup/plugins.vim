filetype off

set laststatus=2
set t_Co=256
set nocompatible
set rtp+=~/Session/.vim/bundle/Vundle.vim
call vundle#rc("~/Session/.vim/bundle")

call vundle#begin()
Plugin 'vundlevim/vundle.vim'
Plugin 'scrooloose/NERDTree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
Plugin 'scrooloose/syntastic'
Plugin 'lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'xolox/vim-misc'
Plugin 'sjl/gundo.vim'
Plugin 'w0ng/vim-hybrid'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/Conque-GDB'
Plugin 'airblade/vim-rooter'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
"Plugin 'ervandew/supertab'
Plugin 'mbbill/undotree'
Plugin 'tpope/vim-fugitive'
Plugin 'Raimondi/delimitMate'
Plugin 'kien/ctrlp.vim'
call vundle#end()
filetype on

" 42
Bundle '42header'
Bundle 'generator_h'
Bundle 'speed_open'

" NERDTree
map <C-n> :NERDTreeTabsToggle<CR> 
let g:NERDTreeUpdateOnWrite = 0 "solve error linked to syntastic not updated on write

" Syntastic settings
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
nnoremap <silent> <C-e> :<C-u>call ToggleErrors()<CR>
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_aggregate_errors = 1
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
let g:ycm_min_num_of_chars_for_completion = 99
let g:ycm_key_invoke_completion = '<C-n>'
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_global_ycm_extra_conf = '~/Session/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1 "pop_up window on top appear just when auto_complete
let g:ycm_use_ultisnips_completer = 1

" ultisnips
let g:UltiSnipsExpandTrigger="<c-t>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsListSnippets = "<F6>"
let g:UltiSnipsSnippetsDir='~/Session/.vim/bundle/vim-snippets/UltiSnips'
let g:UltiSnipsUsePythonVersion = 2

" vim tags settings
let g:easytags_cmd = 'ctagscustom'
let g:easytags_languages = {
			\   'language': {
			\     'cmd': g:easytags_cmd,
			\       'args': [],
			\       'fileoutput_opt': '-f',
			\       'stdout_opt': '-f-',
			\       'recurse_flag': '-R'
			\   }
			\}
let g:easytags_async = 1 "experimental, might not work properly
"let g:easytags_events = ['BufWritePost', 'BufReadPre']
let g:easytags_autorecurse = 1
let g:easytags_auto_update = 0
let g:easytags_include_members = 1
let g:easytags_resolve_links = 1
"with vim/root set tags in local directory as tag file to use contrary to
"/.vimtags
let g:rooter_patterns = ['Makefile']
"let g:rooter_patterns = ['Makefile', '.git/']
" two custom function to avoid ctags process on ~ directory
function! Create_tag()
   if filereadable(".ctagsignore")
	   echo "dont work on ~"
	   let g:easytags_auto_update = 0
	   "  silent! exec "r!pkill ctags"
   else
	   let g:easytags_auto_update = 1
		execute 'setlocal tags=' . FindRootDirectory() . "/.tags" 
   endif
endfunction

function! Eval_tag()
   if filereadable(".ctagsignore")
	   echo "dont work on ~"
	   let g:easytags_auto_update = 0
	   "  silent! exec "r!pkill ctags"
   else
	   let g:easytags_auto_update = 1
		execute 'setlocal tags=./.tags'
   endif
endfunction

autocmd BufReadPre,FileReadPre * execute !empty(FindRootDirectory()) ? Create_tag() : Eval_tag()
"map <Space>t :execute !empty(FindRootDirectory()) ? Create_tag() : Eval_tag()<CR>
"autocmd BufWritePost * execute !empty(FindRootDirectory()) ? Create_tag() : Eval_tag()
let g:easytags_dynamic_files=2
let g:easytags_python_enabled=0
let g:easytags_syntax_keyword=1
let g:easytags_auto_highlight=0 "was creating a massive slowdown in vim engine !!
set regexpengine=1

" tab-bar
nmap <F7> :TagbarToggle<CR>

" Conque-GDB**)
let g:ConqueTerm_Color = 2         " 1: strip color after 200 lines, 2: always with color
let g:ConqueTerm_CloseOnEnd = 1    " close conque when program ends running
let g:ConqueTerm_StartMessages = 0 " display warning messages if conqueTerm is configured incorrectly
let g:ConqueTerm_ReadUnfocused = 1      "Update unfocused buffers
let g:ConqueGdb_Leader = '\'
let g:ConqueGdb_Run = g:ConqueGdb_Leader . 'r'
let g:ConqueGdb_Continue = g:ConqueGdb_Leader . 'c'
let g:ConqueGdb_Next = g:ConqueGdb_Leader . 'n'
let g:ConqueGdb_Step = g:ConqueGdb_Leader . 's'
let g:ConqueGdb_Print = g:ConqueGdb_Leader . 'p'
let g:ConqueGdb_ToggleBreak = g:ConqueGdb_Leader . 'b'
let g:ConqueGdb_DeleteBreak = g:ConqueGdb_Leader . 'd'
let g:ConqueGdb_Finish = g:ConqueGdb_Leader . 'f'
nnoremap <silent> <Leader>Y :ConqueGdbCommand y<CR>
nnoremap <silent> <Leader>N :ConqueGdbCommand n<CR>

" Undo-Tree
nnoremap <F5> :UndotreeToggle<cr>

" vim-fugitive
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
set statusline+=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gvdiff 
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>dp :diffput<CR>
nnoremap <leader>dg :diffget<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>ggr :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>grm :Gremove
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Git push<CR>
nnoremap <leader>gpl :Git pull<CR>

" Header/.c speed open script
nnoremap <leader>h :call Speed_open("vs")<cr>
nnoremap <leader>H :call Speed_open("sp")<cr>
