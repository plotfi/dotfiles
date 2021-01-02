filetype off

" Skip vi-compat; draw fast and smooth.
set nocompatible
set lazyredraw
set ttyfast

" Autoload file if it changes and skip backups and swapfiles.
set nobackup
set nowritebackup
set noswapfile
set autoread

" Display info about lines, columns, modes, search and brace matches.
set incsearch
set hlsearch
set showmatch
set cursorline
set showmode
set number
set ruler
set showcmd
set colorcolumn=81

" Display white space.
set list
set listchars=tab:>-,trail:~,extends:>,precedes:<

" Use ninja by default, but load a per-project vimrc for a custom makeprg.
set makeprg=ninja
set exrc

" Indent the llvm way.
set expandtab
set autoindent
set cindent
set smartindent
set backspace=2
set laststatus=2
set softtabstop=2
set tabstop=2
set shiftwidth=2

" Integrate with mouse and OS clipboard.
set mouse=a
set clipboard=unnamed

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

" If vim is new enough, and LanguageClient is cloned then enable it.
if ((v:version > 750) || has('nvim')) && isdirectory($HOME.'/.vim/plugins/LanguageClient-neovim')
  set runtimepath+=~/.vim/plugins/LanguageClient-neovim
  let g:LanguageClient_serverCommands = {
      \ 'cpp': ['clangd'],
      \ }
  nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
  nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
  nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
endif

if isdirectory($HOME.'/.vim/plugins/ctrlp.vim')
  set runtimepath^=~/.vim/plugins/ctrlp.vim
endif

" The rest is enabling llvm and tablegen syntax highlighting:
augroup filetype
  au! BufRead,BufNewFile *.ll set filetype=llvm
augroup END

augroup filetype
  au! BufRead,BufNewFile *.td set filetype=tablegen
augroup END

