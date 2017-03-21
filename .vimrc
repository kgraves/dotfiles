filetype off
execute pathogen#infect()
filetype plugin indent on
set nocompatible

" mappings
nnoremap <C-h> :tabp<CR>
nnoremap <C-l> :tabn<CR>
nnoremap <C-j> :tabm-1<CR>
nnoremap <C-k> :tabm+1<CR>
nnoremap <C-t> :tabe 
nnoremap <tab> %
vnoremap <tab> %
" Executes the current line in a shell, then replaces that with the results.
nnoremap Q !!sh<CR>

" Basic Settings
set encoding=utf-8
set modelines=0
set autoindent
set showmode
set showcmd
set hidden
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set nonumber
set norelativenumber
set laststatus=2
set history=1000
set undofile
set undoreload=10000
set nofoldenable

" set list
set lazyredraw
set matchtime=3
set splitbelow
set splitright
set autowrite
set autoread
set shiftround
set title

set linebreak
set colorcolumn=+1
set nu

" show listing of options in command mode
" I was looking for this setting for a while.
set wildmode=longest,list
set wildmenu

" Leader
let mapleader = ","
let maplocalleader = "\\"

" status line
set statusline=%!BuildStatusLine()

" Tabs, spaces, wrapping
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set wrap
set textwidth=80

" backups
set backup
set noswapfile
set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p")
endif

" Color scheme

" 256 colors for maximum bling.
if (&term =~ "xterm") || (&term =~ "screen")
  set t_Co=256
endif

set termguicolors " added for nvim color support
syntax on

let g:seoul256_background = 233
colorscheme seoul256
set background=dark

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault

set scrolloff=3
set sidescroll=1
set sidescrolloff=10

" ctrlp plugin settings
set runtimepath^=~/.vim/bundle/ctrlp.vim

" syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" let g:syntastic_auto_jump = 1

" status line
" (https://github.com/mcantor/dotfiles/blob/master/vim/.vimrc)
function! BuildStatusLine()
    let statusline = ""
    " Filename (F -> full, f -> relative)
    let statusline .= "%f"
    " Buffer flags
    let statusline .= "%( %h%1*%m%*%r%w%) "
    " File format and type
    let statusline .= "(%{&ff}%(\/%Y%))"

    " syntastic error messages
    let statusline .= "%#warningmsg#"
    let statusline .= "%{SyntasticStatuslineFlag()}"
    let statusline .= "%*"

    " Left/right separator
    let statusline .= "%="

    " Line & column
    let statusline .= "(%l,%c%V) "
    " Character under cursor (decimal)
    let statusline .= "%03.3b "
    " Character under cursor (hexadecimal)
    let statusline .= "0x%02.2B "
    " File progress
    let statusline .= "| %P/%L"

    return statusline
endfunction

"""""""""""""""""""""""""""""""""""""
" Vimscript The Hard Way test stuff "
"""""""""""""""""""""""""""""""""""""

" caps a whole word
nnoremap <leader>u viwU

" open vimrc in a split, and source
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" insert mode abbreviations for correcting common spelling mistakes
iabbrev adn and
iabbrev @@ this is an expanded region
