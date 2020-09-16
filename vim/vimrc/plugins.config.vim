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
let g:lightline = {}

" asyncrun

" YouCompleteMe
"
let g:ycm_confirm_extra_conf=0
let g:ycm_global_ycm_extra_conf='~/.me/vim/ycm_extra_conf.py'
set completeopt=longest,menu
let g:ycm_complete_in_strings = 1
let g:ycm_complete_in_comments = 1
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_key_invoke_completion = '<c-z>'
noremap <c-z> <NOP>
let g:ycm_semantic_triggers =  {
          \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
          \ 'cs,lua,javascript': ['re!\w{2}'],
          \ }

" ALE
let g:ale_sign_error = '✗'
let g:ale_sign_warning = 'w'
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_list_window_size = 5
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_sign_column_always = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
"
"
