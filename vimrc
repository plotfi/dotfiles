filetype off
set nocompatible
set expandtab
set lazyredraw
set ttyfast
set hlsearch
set autoindent
set cindent
set smartindent
set nobackup
set nowritebackup
set noswapfile
set autoread
set cursorline
set incsearch
set showmode
set number
set ruler
set showcmd
set showmatch
set list
set listchars=tab:>-,trail:~,extends:>,precedes:<
set clipboard=unnamed
set makeprg=ninja
set colorcolumn=81
set backspace=2
set laststatus=2
set softtabstop=2
set tabstop=2
set shiftwidth=2

noremap <C-c> <Esc>
imap <C-c> <Esc>

filetype plugin indent on

set mouse=a
if has("mouse_sgr")
  set ttymouse=sgr
else
  set ttymouse=xterm2
end

syntax on
colorscheme muon

map <LocalLeader><right> :hide bn<CR>
map <LocalLeader><left>  :hide bp<CR>
map <LocalLeader><down>  :hide bd<CR>
map <LocalLeader>m :make -C build<CR>
map <C-K> :py3f ~/.vim/plugins/clang-format.py<cr>

augroup filetype
  au! BufRead,BufNewFile *.ll set filetype=llvm
augroup END

augroup filetype
  au! BufRead,BufNewFile *.td set filetype=tablegen
augroup END

augroup filetype
 au! BufRead,BufNewFile *.rst set filetype=rest
augroup END

