if &compatible
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
	if has('nvim')
		call dein#add('w0rp/ale', { 'merged': 0})
		call dein#add('janko-m/vim-test', { 'merged': 0})
		" neosnippet
		call dein#add('Shougo/neosnippet.vim', { 'merged': 0})
		call dein#add('Shougo/neosnippet-snippets', { 'merged': 0})
		call dein#add('roxma/vim-hug-neovim-rpc', { 'merged': 0})
		call dein#add('roxma/nvim-yarp', { 'merged': 0})
		call dein#add('honza/vim-snippets', { 'merged': 0})
		" deoplete
		call dein#add('roxma/nvim-yarp', { 'merged': 0})
		call dein#add('roxma/vim-hug-neovim-rpc', { 'merged': 0})
		call dein#add('Shougo/deoplete.nvim', { 'merged': 0})
		call dein#add('Shougo/neco-syntax', { 'merged': 0})
		call dein#add('zchee/deoplete-clang', { 'merged': 0})
		call dein#add('wokalski/autocomplete-flow', { 'merged': 0})
		call dein#add('mhartington/nvim-typescript', { 'merged': 0})
		call dein#add('Shougo/context_filetype.vim', { 'merged': 0})
		call dein#add('zchee/deoplete-jedi', { 'merged': 0})
		call dein#add('zchee/deoplete-zsh', { 'merged': 0})
		" web
		call dein#add('pangloss/vim-javascript', { 'merged': 0})
		call dein#add('posva/vim-vue', { 'merged': 0})
		call dein#add('rhysd/NyaoVim', { 'merged': 0})
		call dein#add('rhysd/nyaovim-mini-browser', { 'merged': 0})
		call dein#add('rhysd/nyaovim-popup-tooltip', { 'merged': 0})
		call dein#add('rhysd/nyaovim-markdown-preview', { 'merged': 0})
	endif
	if !has('nvim')
		call dein#disable('w0rp/ale')
		call dein#disable('janko-m/vim-test')
		" neosnippet
		call dein#disable('Shougo/neosnippet.vim')
		call dein#disable('Shougo/neosnippet-snippets')
		call dein#disable('roxma/vim-hug-neovim-rpc')
		call dein#disable('roxma/nvim-yarp')
		call dein#disable('honza/vim-snippets')
		" deoplete
		call dein#disable('roxma/nvim-yarp')
		call dein#disable('roxma/vim-hug-neovim-rpc')
		call dein#disable('Shougo/deoplete.nvim')
		call dein#disable('Shougo/neco-syntax')
		call dein#disable('zchee/deoplete-clang')
		call dein#disable('wokalski/autocomplete-flow')
		call dein#disable('mhartington/nvim-typescript')
		call dein#disable('Shougo/context_filetype.vim')
		call dein#disable('zchee/deoplete-jedi')
		call dein#disable('zchee/deoplete-zsh')
		" web
		call dein#disable('pangloss/vim-javascript')
		call dein#disable('posva/vim-vue')
		call dein#disable('rhysd/NyaoVim')
		call dein#disable('rhysd/nyaovim-mini-browser')
		call dein#disable('rhysd/nyaovim-popup-tooltip')
		call dein#disable('rhysd/nyaovim-markdown-preview')
	endif
	call dein#add('scrooloose/nerdtree')
	call dein#add('scrooloose/nerdcommenter')
	call dein#add('terryma/vim-multiple-cursors')
	call dein#add('jistr/vim-nerdtree-tabs')
	call dein#add('Xuyuanp/nerdtree-git-plugin')
	call dein#add('vim-airline/vim-airline')
	call dein#add('vim-airline/vim-airline-themes')
	"call dein#add('xolox/vim-easytags')
	"call dein#add('ludovicchabant/vim-gutentags')
	call dein#add('jsfaint/gen_tags.vim')
	call dein#add('majutsushi/tagbar')
	call dein#add('xolox/vim-misc')
	call dein#add('sjl/gundo.vim')
	call dein#add('w0ng/vim-hybrid')
	call dein#add('Shougo/neco-vim')
	call dein#add('echuraev/Conque-GDB')
	call dein#add('airblade/vim-rooter')
	call dein#add('mbbill/undotree')
	call dein#add('tpope/vim-fugitive')
	call dein#add('kien/ctrlp.vim')
	call dein#add('sebpalluel/42toolkit_vim')
	call dein#add('powerman/vim-plugin-viewdoc')
	call dein#add('vimlab/split-term.vim')
	call dein#add('anonkey/vim_bundles')
	" You can specify revision/branch/tag.
	call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
	" web
	call dein#add('mattn/emmet-vim')
	call dein#add('hail2u/vim-css3-syntax')
	call dein#add('ap/vim-css-color')

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
map <Esc>n :NERDTreeTabsToggle<CR> 
let g:NERDTreeUpdateOnWrite = 0 "solve error linked to syntastic not updated on write


""" vim-multiple-cursor
"let g:multi_cursor_use_default_mapping=0
""
""" Default mapping
"let g:multi_cursor_start_word_key      = '<leader>n'
"let g:multi_cursor_select_all_word_key = '<A-n>'
"let g:multi_cursor_start_key           = 'g<C-n>'
"let g:multi_cursor_select_all_key      = 'g<A-n>'
"let g:multi_cursor_next_key            = '<leader>n'
"let g:multi_cursor_prev_key            = '<C-p>'
"let g:multi_cursor_skip_key            = '<C-x>'
"let g:multi_cursor_quit_key            = '<Esc>'

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
	let g:ale_cpp_clang_options = '-std=c++14 -Wall -I./includes $(sdl2-config --libs) -l -Wl, --unresolved-symbols=ignore-all'
	" neomake settings
	"let g:neomake_open_list = 0
	"call neomake#configure#automake('rw', 700)
endif

" neosnippet
let g:neosnippet#enable_completed_snippet = 1

" deoplete settings

" trigger snippet

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"


let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:deoplete#sources#dictionary#dictionaries = {
			\ 'default' : '',
			\ 'vimshell' : $HOME.'/.vimshell_hist',
			\ 'scheme' : $HOME.'/.gosh_completions'
			\ }

" Define keyword.
if !exists('g:deoplete#keyword_patterns')
	let g:deoplete#keyword_patterns = {}
endif
let g:deoplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     deoplete#undo_completion()
inoremap <expr><C-l>     deoplete#complete_common_string()

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
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" language library
let g:deoplete#sources#clang#libclang_path = "/Library/Developer/CommandLineTools/usr/lib/libclang.dylib"

" Enable heavy omni completion.
if !exists('g:deoplete#sources#omni#input_patterns')
	let g:deoplete#sources#omni#input_patterns = {}
endif
"let g:deoplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:deoplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:deoplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:deoplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"css
augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END

"gen-tags
let g:gen_tags#ctags_auto_gen = 1
let g:gen_tags#gtags_default_map = 1
let g:gen_tags#blacklist = ['$HOME']
let g:gen_tags#statusline = 1

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
