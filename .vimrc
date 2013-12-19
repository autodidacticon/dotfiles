set clipboard=unnamed
set runtimepath+=~/.vim_runtime
set number

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

"fixes terminal copy paste on mac
if &term =~ "xterm.*" || &term =~ "screen"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
endif

"maps '' to copy to system clipboard, visual mode
:vmap '' :w !pbcopy<CR><CR>

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
Bundle 'FindInNerdTree'
Bundle 'ack.vim'
Bundle 'nerdtree-ack'
Bundle 'Syntastic'
Bundle 'vim-slime'

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
