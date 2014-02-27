"automatically change directory to current working file
"may need to change this in the future to:
"autocmd BufEnter * silent! lcd %:p:h
set autochdir
set number
"persistent undo
set undodir=~/.vim/undodir
set undofile
set undolevels =1000 "maximum number of changes that can be undone
set undoreload =10000 "maximum number lines to save for undo on a buffer reload

" enables :Paste to just do what you want
command Paste execute 'set noai | insert | set ai'

"maps '' to copy to system clipboard, visual mode
:vmap '' :w !xclip -selection c<CR><CR>

"maps sv,ev to loading/opening vimrc
nmap <silent> ;sv :so $MYVIMRC<CR>
nmap <silent> ;ev :e $MYVIMRC<CR>

" set colorscheme
colorscheme elflord
"VUNDLE
"autoinstaller
 let iCanHazVundle=1
 let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
 if !filereadable(vundle_readme)
     echo "Installing Vundle.."
     echo ""
     silent !mkdir -p ~/.vim/bundle
     silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
     let iCanHazVundle=0
 endif

set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" " required! 
Bundle 'gmarik/vundle'

" Bundles here
Bundle 'ervandew/supertab'
Bundle 'scrooloose/nerdtree'
Bundle 'ack.vim'
Bundle 'nerdtree-ack'
Bundle 'scrooloose/syntastic'
Bundle 'vim-slime'
Bundle 'Tagbar'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

" Use jshint (uses ~/.jshintrc)
let g:syntastic_javascript_checkers = ['jshint']

" supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = "<c-n>"

" python autocompletion
autocmd FileType python set omnifunc=pythoncomplete#Complete

" python style
set expandtab
"set textwidth=79
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent
:syntax on

"ctags
set tags=./tags,./TAGS,tags;~,TAGS;~

"tagbar
nnoremap <silent> <Leader>b :TagbarToggle<CR>
