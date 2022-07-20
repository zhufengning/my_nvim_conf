call plug#begin()
" Use release branch (recommend)
Plug 'preservim/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Yggdroot/indentLine'
Plug 'luochen1990/rainbow'
" Plug 'majutsushi/tagbar'
Plug 'preservim/nerdtree'
" Plug 'morhetz/gruvbox'
Plug 'liuchengxu/vista.vim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'EdenEast/nightfox.nvim', { 'tag': 'v1.0.0' } " Vim-Plug
let g:rainbow_active = 1
" Or build from source code by using yarn: https://yarnpkg.com
" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
call plug#end()
set rnu
set nocompatible "关闭与vi的兼容模式
set encoding=utf-8  "通用的 utf8 编码，避免乱码
set fenc=utf-8      "编码
set mouse=a        "支持使用鼠标
" 缩进
set tabstop=4    " Tab = 4 空格
set expandtab   " Tab 键在不同的编辑器缩进不一致，自动将 Tab 转为空格
" 外观
set bg=dark
set cursorline  " 光标所在的当前行高亮
set shiftwidth=4
set cindent
set autoindent
set cole=0
set hidden
set shortmess+=c

if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
hi Pmenu ctermbg=green ctermfg=white
nmap <F7> :Vista!!<CR>
nnoremap <F8> :NERDTreeToggle<CR>
" set clipboard+=unnamedplus
" set clipboard+=unnamed
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
hi Pmenu ctermbg=black ctermfg=white
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
command! -nargs=0 Format :call CocActionAsync('format')
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
imap <silent> <Esc> <Esc>:silent !im-select 1033<CR>
let g:vista_default_executive = 'coc'
colorscheme duskfox

