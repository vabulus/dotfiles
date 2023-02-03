"--------------------------------------------------------------------------------------------------------------------------------------------------

" vim plugin manager
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'junegunn/limelight.vim'
Plug 'img-paste-devs/img-paste.vim'
Plug 'jungegunn/goyo.vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'mcchrish/nnn.vim'
call plug#end()

"--------------------------------------------------------------------------------------------------------------------------------------------------

" vabulus: remap vim navigation for my german keyboard
noremap j h
noremap k k
noremap l j
noremap ö l
"--------------------------------------------------------------------------------------------------------------------------------------------------

" miscellaneous settings

" enable syntax
syntax on

" delete whole word
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
set backspace=indent,eol,start

" to save changes to a file with root access within vim 
cmap w!! %!sudo tee > /dev/null %

" abbreviation to open the n³ file explorer quicker + open files in tab view
cnoreabbrev n NnnPicker
nnoremap <leader>n :NnnPicker %:p:h<CR>
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-s>': 'split',
      \ '<c-v>': 'vsplit' }
let g:nnn#command = 'nnn -A'

" custom css for markdown preview
let g:mkdp_markdown_css='/home/fabio/.local/lib/github-markdown-css/github-markdown.css'
"--------------------------------------------------------------------------------------------------------------------------------------------------
