let mapleader=" "

" move line up or down 
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

nmap <silent> <leader>Up :wincmd k<CR>
nmap <silent> <leader>Down :wincmd j<CR>
nmap <silent> <leader>Left :wincmd h<CR>
nmap <silent> <leader>Right :wincmd l<CR>

"indent
"autocmd BufWritePre * :normal mzgg=G`z "indent and come back to current line
"when save
" Indent and stay on same line
map <leader>i mzgg=G`z 
"nnoremap <leader>i :normal mzgg=G`z
