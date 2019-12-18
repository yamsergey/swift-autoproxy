call plug#begin('~/.vim/plugged')
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'vim-syntastic/syntastic'
Plug 'keith/swift.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sainnhe/edge'
call plug#end()

if executable('sourcekit-lsp')
	    au User lsp_setup call lsp#register_server({
	            \ 'name': 'sourcekit-lsp',
	            \ 'cmd': {server_info->['sourcekit-lsp']},
	            \ 'whitelist': ['swift'],
	            \ })
endif

" Enable Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Enable Syntastic =============

" Autocomplition ===============
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
" Autocomplition ===============

" LSP ===========
nnoremap <C-b> :LspDefinition <CR>
" ===============

" Color Scheme Start ===========
" important!!
set termguicolors

" " for dark version
set background=dark
"
" " for light version
" set background=light
"
" " the configuration options should be placed before `colorscheme edge`
let g:edge_disable_italic_comment = 1
let g:edge_popup_menu_selection_background = 'green'

colorscheme edge
" Color Scheme Ends ============
