" line number
set number
"
set ruler
set showcmd
" set nobackup
" set noswapfile
set cursorline
set autoindent
set cindent
set smarttab
set expandtab
set smartindent
set wildmenu
set hlsearch
set nowrap
set guifont=monaco
set encoding=utf-8
set mouse=a
set tabstop=4
set shiftwidth=4
set softtabstop=4
set history=5000
set backspace=2

"leader
let mapleader=","
nmap <leader>w :w!<CR>
nmap <leader>q :q<CR>
nmap <leader>q1 :q!<CR>
nmap <leader>wq :wq<CR>
nmap <leader>y "+y
nmap <leader>p "+p
nmap <space> :
nmap <C-l> :noh<CR>
"buffer
nmap <leader><Tab> :bn<CR>


" hightlight
syntax enable
syntax on

" color
" airline can be display when set this
set t_Co=256
set laststatus=2
set background=dark
colorscheme gruvbox

" encoding
set encoding=utf-8
set colorcolumn=80
set termencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936,latin1
set enc=utf8
set fencs=utf8,gbk,gb2312,gb18030