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

"maps '' to copy to system clipboard, visual mode
:vmap '' :w !xclip -selection c<CR><CR>

"maps sv,ev to loading/opening vimrc
nmap <silent> ;sv :so $MYVIMRC<CR>
nmap <silent> ;ev :e $MYVIMRC<CR>

"set tabs to spaces
set expandtab
set tabstop=4

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
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
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
Bundle 'Syntastic'
Bundle 'Tagbar'
Bundle 'scrooloose/nerdcommenter'
Bundle 'elzr/vim-json'
Bundle 'vim-ruby/vim-ruby'
Bundle 'moll/vim-node'
Bundle 'kchmck/vim-coffee-script'
filetype plugin indent on     " required!
syntax enable
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
autocmd FileType python setlocal ts=8 sw=4 sts=4 tw=79
autocmd Filetype html setlocal ts=2 sw=2 
autocmd Filetype ruby setlocal ts=2 sw=2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd Filetype javascript setlocal ts=2 sw=2 sts=2

"ctags
set tags=./tags,./TAGS,tags;~,TAGS;~

"tagbar
nnoremap <silent> <Leader>b :TagbarToggle<CR>
"NERDTree toggle
nnoremap <silent> <Leader>t :NERDTreeToggle<CR>
"leave insert mode quickly
inoremap jj <Esc>

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()
