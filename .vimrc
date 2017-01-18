execute pathogen#infect()
syntax on
colorscheme monokai
filetype plugin indent on
set rnu
set noshowmode
set so=7
let mapleader = ","
set backspace=2
set splitbelow
set splitright

set undofile
set undodir=/Users/nickwhite/.vimundo

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

command W write

map <leader>vimrc :tabe $MYVIMRC<cr>
"autocmd bufwritepost .vimrc source $MYVIMRC
"Tabs
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

set ai
set si

"NERD Tree
autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror
autocmd VimEnter * wincmd w

function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()

nmap <silent> <F3> :NERDTreeToggle<CR>
"End NERD Tree

"Lightline
let g:lightline = { 'colorscheme': 'wombat', }

set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Inconsolata\ for\ Powerline:h15
   endif
else
    set term=xterm-256color
    set termencoding=utf-8
endif
"End Lightline
