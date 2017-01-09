set hlsearch

" appearance
set cursorline
set ruler
set nowrap
set colorcolumn=80
highlight clear SignColumn

" encoding
set enc=utf-8
set noexpandtab
set tabstop=4
set shiftwidth=4

" files
set ffs=unix
syntax enable
set smartcase
filetype plugin indent on
set noswapfile

" interface
set ttyfast
set mouse=a
set backspace=indent,eol,start
set history=1000
set nocompatible
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list

" Kill error bells
set noerrorbells
set visualbell
set t_vb=

" relative numbers
set relativenumber
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber

" indent
autocmd BufWritePre * :normal gg=G
