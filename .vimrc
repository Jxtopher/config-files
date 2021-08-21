runtime! debian.vim

" syntax highlighting
colorscheme desert
syntax on

" For using TABs only
set tabstop=4
set shiftwidth=4
set nosmarttab
set softtabstop=0

set clipboard=unnamedplus


if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
