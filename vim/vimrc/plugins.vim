" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
"
call plug#begin('~/.vim/plugged')

Plug 'ludovicchabant/vim-gutentags'

Plug 'junegunn/vim-easy-align'
Plug 'skywind3000/quickmenu.vim'
Plug 'skywind3000/asyncrun.vim'

" test object
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
Plug 'sgur/vim-textobj-parameter'

" complete
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'tenfyzhong/CompleteParameter.vim'

" error message
Plug 'dense-analysis/ale'

"
Plug 'bronson/vim-trailing-whitespace'

" bottom line
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

" Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/echodoc.vim'

Plug 'https://github.com/junegunn/vim-github-dashboard.git'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" 修改比较
Plug 'mhinz/vim-signify'

" 编辑辅助，高亮
Plug 'octol/vim-cpp-enhanced-highlight'

" 函数列表
Plug 'Yggdroot/LeaderF'

" 参数提示
Plug 'Shougo/echodoc.vim'

" fzf搜索神器
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" theme
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
Plug 'luochen1990/rainbow'
Plug 'preservim/nerdcommenter'

" Initialize plugin system
call plug#end()
