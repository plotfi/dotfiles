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
set shiftwidth=2  " The one true llvm way.
set mouse=a       " I am weak.

" Enable the wide-screen mouse WA if we are on a new enough non-neo vim.
" Without this, you can't click the far right of a large display in full screen.
if !has('nvim')
  if has("mouse_sgr")
    set ttymouse=sgr
  else
    set ttymouse=xterm2
  end
endif

" Our favorite colorscheme is muon, based on the only good thing to come out
" of Emacs: Charcoal Black.
colorscheme muon
filetype plugin indent on
syntax on

" MacBook Touchbars lack an escape, but ctrl-c does not behave consistently
" across modes. This makes things consistent so that we can use block
" insert/select without frustration.
noremap <C-c> <Esc>
imap <C-c> <Esc>

" I like to cycle through my buffers like a hamster.
map <LocalLeader><right> :hide bn<CR>
map <LocalLeader><left>  :hide bp<CR>
map <LocalLeader><down>  :hide bd<CR>
map <LocalLeader>m :make -C build<CR>

" Just run my clang format using the available python, don't care which.
if has('python3')
  map <C-K> :py3f ~/.vim/plugins/clang-format.py<cr>
else
  map <C-K> :pyf ~/.vim/plugins/clang-format.py<cr>
end

" If vim is new enough, and the LCN is cloned, enable clangd code navigation.
if ((v:version > 750) || has('nvim')) && isdirectory($HOME.'/.vim/plugins/LanguageClient-neovim')
  set runtimepath+=~/.vim/plugins/LanguageClient-neovim
  let g:LanguageClient_serverCommands = {
      \ 'cpp': ['~/Tools/clang+llvm/bin/clangd'],
      \ }
  nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
  nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
  nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
endif

" If we bothered to install nvim and clone deoplete, enable it.
if has('nvim') && isdirectory($HOME.'/.vim/plugins/deoplete.nvim/')
  set runtimepath+=~/.vim/plugins/deoplete.nvim/
  let g:deoplete#enable_at_startup = 1
endif

" The rest is enabling llvm and tablegen syntax highlighting:
augroup filetype
  au! BufRead,BufNewFile *.ll set filetype=llvm
augroup END

augroup filetype
  au! BufRead,BufNewFile *.td set filetype=tablegen
augroup END

augroup filetype
 au! BufRead,BufNewFile *.rst set filetype=rest
augroup END

