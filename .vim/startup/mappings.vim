let mapleader=" "

" move line up or down 
nnoremap <C-m-j> :m .+1<CR>==
nnoremap <C-m-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

"move to split window down up right left
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"autocmd BufWritePre * :normal mzgg=G`z "indent and come back to current line
"when save
" Indent and stay on same line
map <leader>i mzgg=G`z 
nnoremap <leader>w :w<CR>
"nnoremap <leader>i :normal mzgg=G`z
