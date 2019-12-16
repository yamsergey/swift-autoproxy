call plug#begin('~/.vim/plugged')
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
call plug#end()

if executable('sourcekit-lsp')
	    au User lsp_setup call lsp#register_server({
	            \ 'name': 'sourcekit-lsp',
	            \ 'cmd': {server_info->['sourcekit-lsp']},
	            \ 'whitelist': ['swift'],
	            \ })
endif
