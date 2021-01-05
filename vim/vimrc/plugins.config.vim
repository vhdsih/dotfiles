" ----------------------------------------------------------------
"  Plug 'ludovicchabant/vim-gutentags'
" 设置符号索引
set tags=./.tags;,.tags
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '/usr/local/Cellar/global/6.6.3/share/gtags/gtags.conf'
" let g:gutentags_enabled = 1
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0
let g:gutentags_plus_nomap = 1
let g:gutentags_define_advanced_commands = 1

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
endif

noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
noremap <silent> <leader>gC :GscopeFind c <C-R><C-W><cr>
noremap <silent> <leader>gT :GscopeFind t <C-R><C-W><cr>
noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>
"gs Find symbol (reference) under cursor
"gg Find symbol definition under cursor
"gc Functions called by this function
"gt Functions calling this function
"ge Find text string under cursor
"gf Find egrep pattern under cursor
"gi Find file name under cursor
"gd Find files #including the file name under cursor
"ga Find places where current symbol is assigned

" ----------------------------------------------------------------

let g:echodoc#enable_at_startup = 1

" vim-easy-line
"
" NERDTREE
let NERDTreeWinSize=40
let NERDTreeAutoCenter=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
map <leader>nn :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeIgnore=['\.pyc','\~$','\.swp', '\.out']
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
" }}}
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" trailing-whitespace
nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>
" multiple-cursors
"
" lightline
"

" ----------------------------------------------------------------------------
" LIGHTLINE
" ----------------------------------------------------------------------------
set statusline=
set statusline+=%{lessmess#statusline()}

" set showtabline=2  " Show tabline
" set guioptions-=e  " Don't use GUI tabline

function! Lessmess()
    if exists('*lessmess#statusline')
        return lessmess#statusline()
    endif
    return ''
endfunction

let g:lightline = {
    \ 'colorscheme': 'one',
    \ 'active': {
    \    'left': [
    \        [ 'mode', 'paste' ],
    \        [ 'gitbranch', 'readonly', 'filename', 'modified' ],
    \    ],
    \    'right': [
    \        [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
    \        [ 'lessmess' ],
    \        [ 'cocstatus' ],
    \        [ 'lineinfo', 'percent' ],
    \        [ 'tagbar', 'fileformat', 'fileencoding', 'filetype' ],
    \    ]
    \ },
    \ 'component': {
    \     'lineinfo': '# %3l:%-2v',
    \     'readonly': '%{&readonly?"*root":""}',
    \     'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
    \ },
    \ 'component_function': {
    \     'gitbranch': 'fugitive#head',
    \     'lessmess': 'Lessmess',
    \     'mode': 'LightlineMode',
    \     'cocstatus': 'coc#status'
    \ }
\ }

let g:lightline.component_expand = {
    \ 'linter_checking': 'lightline#ale#checking',
    \ 'linter_warnings': 'lightline#ale#warnings',
    \ 'linter_errors': 'lightline#ale#errors',
    \ 'linter_ok': 'lightline#ale#ok',
\ }

let g:lightline.component_type = {
    \ 'linter_checking': 'left',
    \ 'linter_warnings': 'warning',
    \ 'linter_errors': 'error',
    \ 'linter_ok': 'left',
\ }

let g:lightline.separator = {
    \ 'left': '', 'right': ''
\ }

let g:lightline.subseparator = {
    \ 'left': '|', 'right': '|'
\}

let g:lightline.tabline = {
    \ 'left': [ ['tabs'] ],
    \ 'right': [ ['close'] ]
\ }


function! LightlineMode()
  let fname = expand('%:t')
  return fname ==# '__Tagbar__' ? 'Tagbar' :
        \ fname ==# 'ControlP' ? 'CtrlP' :
        \ fname ==# '__Gundo__' ? 'Gundo' :
        \ fname ==# '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ?  'NERDTree':
        \ &ft ==# 'unite' ? 'Unite' :
        \ &ft ==# 'vimfiler' ? 'VimFiler' :
        \ &ft ==# 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction"
"
"
"" ----------------------------------------------------------------
" Plug 'skywind3000/asyncrun.vim'

" 自动打开 quickfix window ，高度为 10
let g:asyncrun_open = 8 " 任务结束时候响铃提醒 let g:asyncrun_bell = 1
" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(10)<cr>
" 重新定义项目标志
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml'] 
" F4为更新Makefile文件
nnoremap <silent> <F4> :AsyncRun -cwd=<root> cmake . <cr>
" F6 clang编译c++程序
" noremap <F6> :AsyncRun g++ -v -lboost_filesystem -lboost_system -std=c++17 "%" -o "%<"<CR>
noremap <F1> :AsyncRun clang++ -std=c++11 "%" -o "%<"<CR>
" noremap <F6> :AsyncRun g++ -Iboost_1_68_0 -Lboost_1_68_0/lib/ -lboost-filesystem -lboost-system -std=c++11 "%" -o "%<"<CR>
" F7编译整个项目
nnoremap <silent> <F7> :AsyncRun -cwd=<root> make <cr>
" F8 运行当前项目
nnoremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr>
" F9编译单文件
nnoremap <silent> <F9> :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>

" ----------------------------------------------------------------"
"YouCompleteMe
"配置默认文件路径
let g:ycm_global_ycm_extra_conf='~/.me/vim/ycm_extra_conf.py'
"打开vim时不再询问是否加载ycm_extra_conf.py配置
let g:ycm_confirm_extra_conf = 0
set completeopt=longest,menu
"自动开启语义补全
let g:ycm_seed_identifiers_with_syntax = 1
"在注释中也开启补全
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"字符串中也开启补全
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
"开启基于tag的补全，可以在这之后添加需要的标签路径
let g:ycm_collect_identifiers_from_tags_files = 1
"开始补全的字符数
let g:ycm_min_num_of_chars_for_completion = 2
"补全后自动关闭预览窗口
let g:ycm_autoclose_preview_window_after_completion = 1
"禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"语法关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
"整合UltiSnips的提示
let g:ycm_use_ultisnips_completer = 1
"在实现和声明之间跳转,并分屏打开
let g:ycm_goto_buffer_command = 'horizontal-split'
nnoremap <Leader>g :YcmCompleter GoTo<CR>
"与syntastic有冲突，建议关闭
let g:ycm_show_diagnostics_ui = 0
"let g:ycm_error_symbol = '>>'
"let g:ycm_warning_symbol = '>>'
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_echo_current_diagnostic = 0



" Plug 'w0rp/ale'
let g:ale_linters_explicit = 1
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

let g:ale_echo_delay = 20
let g:ale_list_window_size = 5
let g:ale_completion_delay = 500
let g:ale_sign_column_always = 1

let g:ale_sign_error = "\ue009\ue009"
"hi! clear SpellBad
"hi! clear SpellCap
"hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta

"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 1
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = "◉"
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '◉ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %code: %%s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
" "使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
    \   'cpp': ['cppcheck','clang','gcc'],
    \   'c': ['cppcheck','clang', 'gcc'],
    \   'python': ['pylint'],
    \   'java': ['checkstyle'],
    \   'shell': ['checkstyle'],
    \}
"设置状态栏显示的内容
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}\ %{ALEGetStatusLine()}
set fenc=

inoremap <silent><expr> ( complete_parameter#pre_complete("()")
smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)

" ----------------------------------------------------------------
" Plug 'octol/vim-cpp-enhanced-highlight'

" Vim 自带语法文件更好的 C/C++ 语法标注，支持 cpp11/14/17
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1

" ----------------------------------------------------------------
"
" ----------------------------------------------------------------
" Plug 'fzf'

nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>

" ----------------------------------------------------------------
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle"
