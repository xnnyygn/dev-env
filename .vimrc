set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'derekwyatt/vim-scala'
Bundle 'vim-scripts/ZenCoding.vim'
Bundle 'vim-scripts/The-NERD-tree'
Bundle 'ctrlp.vim'
Bundle 'bufexplorer.zip'
Bundle 'Lokaltog/vim-powerline'
Bundle 'project.tar.gz'
Bundle 'tpope/vim-fugitive'
Bundle 'AutoClose'
Bundle 'Tagbar'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'othree/vim-autocomplpop'
Bundle 'vim-scripts/L9'
Bundle 'Lokaltog/vim-easymotion'

filetype plugin indent on     " required!

set number
syntax on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set fileencodings=utf8,cp936
" set foldmethod=syntax

let g:user_zen_settings = {
\  'indentation' : '  ',
\  'perl' : {
\    'aliases' : {
\      'req' : 'require '
\    },
\    'snippets' : {
\      'use' : "use strict\nuse warnings\n\n",
\      'warn' : "warn \"|\";",
\    }
\  }
\}

let g:user_zen_expandabbr_key = '<c-e>'
let g:use_zen_complete_tag = 1

map <leader>e :NERDTreeToggle<CR>:NERDTreeMirror<CR>
nmap <leader>nt :NERDTreeFind<CR>

map <leader>tt :TagbarToggle<CR>

map <leader>p :Project<CR>

let g:ctrlp_custom_ignore = { 
  \ 'dir':  '\v[\/]\.(git|svn)$',
  \ 'file': '\v\.(class)$'
  \ }

let NERDTreeShowBookmarks=1

set completeopt=preview
