If &compatible
	set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/Session/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/Session/.vim/bundle')
	call dein#begin('~/Session/.vim/bundle')

	" Let dein manage dein
	" Required:
	call dein#add('~/Session/.vim/bundle/repos/github.com/Shougo/dein.vim')

	" Add or remove your plugins here:
	call dein#add('jistr/vim-nerdtree-tabs')
	call dein#add('Xuyuanp/nerdtree-git-plugin')
	if has('nvim')
		call dein#add('Shougo/neosnippet.vim', { 'merged': 0})
		call dein#add('Shougo/neosnippet-snippets', { 'merged': 0})
		call dein#add('w0rp/ale', { 'merged': 0})
		call dein#add('Shougo/neocomplete.vim', { 'merged': 0})
		call dein#add('jsfaint/gen_tags.vim', { 'merged': 0})
	endif
	if !has('nvim')
		call dein#disable('Shougo/neosnippet.vim')
		call dein#disable('Shougo/neosnippet-snippets')
		call dein#disable('w0rp/ale')
		call dein#disable('Shougo/neocomplete.vim')
		call dein#disable('jsfaint/gen_tags.vim')
	endif
	call dein#add('scrooloose/nerdtree')
	call dein#add('vim-airline/vim-airline')
	call dein#add('vim-airline/vim-airline-themes')
	"call dein#add('xolox/vim-easytags')
	"call dein#add('ludovicchabant/vim-gutentags')
	call dein#add('majutsushi/tagbar')
	call dein#add('xolox/vim-misc')
	call dein#add('sjl/gundo.vim')
	call dein#add('w0ng/vim-hybrid')
	call dein#add('Shougo/neco-vim')
	call dein#add('echuraev/Conque-GDB')
	call dein#add('airblade/vim-rooter')
	call dein#add('SirVer/ultisnips')
	call dein#add('honza/vim-snippets')
	call dein#add('mbbill/undotree')
	call dein#add('tpope/vim-fugitive')
	call dein#add('Raimondi/delimitMate')
	call dein#add('kien/ctrlp.vim')
	call dein#add('sebpalluel/42toolkit_vim')
	call dein#add('powerman/vim-plugin-viewdoc')
	call dein#add('vimlab/split-term.vim')
	" You can specify revision/branch/tag.
	call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

	" Required:
	call dein#end()
	call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
	call dein#install()
endif

"End dein Scripts-------------------------

" NERDTree
map <C-n> :NERDTreeTabsToggle<CR> 
let g:NERDTreeUpdateOnWrite = 0 "solve error linked to syntastic not updated on write

function! ToggleErrors()
	let old_last_winnr = winnr('$')
	lclose
	if old_last_winnr == winnr('$')
		lopen
	endif
endfunction

nnoremap <silent> <C-e> :<C-u>call ToggleErrors()<CR>


" vim-hybrid
let g:hybrid_custom_term_colors = 1

" vim-airline
let g:airline_theme = "hybrid"

if has('nvim')
	" neomake settings
	"let g:neomake_open_list = 0
	"call neomake#configure#automake('rw', 700)
endif

" gutentags

"let g:gutentags_project_root = '['.git']'
"let g:gutentags_ctags_auto_set_tags = 1
"let g:gutentags_generate_on_write = 1
" YCM settings
"let g:ycm_show_diagnostics_ui = 0
"let g:ycm_enable_diagnostic_signs = 0
"let g:ycm_enable_diagnostic_highlighting = 0
"let g:ycm_auto_trigger = 0
"let g:ycm_add_preview_to_completeopt = 1
"set omnifunc=youcompleteme#OmniComplete
"let g:ycm_min_num_of_chars_for_completion = 99
"let g:ycm_key_invoke_completion = '<C-n>'
"" make YCM compatible with UltiSnips (using supertab)
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
""let g:SuperTabDefaultCompletionType = '<C-n>'
"let g:ycm_global_ycm_extra_conf = '~/Session/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_autoclose_preview_window_after_completion = 1
""let g:ycm_autoclose_preview_window_after_insertion = 1 "pop_up window on top appear just when auto_complete
"let g:ycm_use_ultisnips_completer = 1

" neocomplete settings
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
			\ 'default' : '',
			\ 'vimshell' : $HOME.'/.vimshell_hist',
			\ 'scheme' : $HOME.'/.gosh_completions'
			\ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
	" For no inserting <CR> key.
	"return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
	let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" ultisnips
let g:UltiSnipsExpandTrigger="<c-t>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsListSnippets = "<F6>"
let g:UltiSnipsSnippetsDir='~/Session/.vim/bundle/vim-snippets/UltiSnips'
let g:UltiSnipsUsePythonVersion = 2

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

" split-term
nnoremap <leader>t :10Term<CR>

" Header/.c speed open script
nnoremap <leader>h :call Speed_open("vs")<cr>
nnoremap <leader>H :call Speed_open("sp")<cr>
