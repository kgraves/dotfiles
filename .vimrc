filetype off

set nocompatible

filetype plugin indent on


" vim-plug
call plug#begin('~/.vim/plugged-in')

" plugins
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
"Plug 'tpope/vim-sleuth'
Plug 'junegunn/fzf'
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }  "should be able to remove this b/c ripgrep, need to configure
Plug 'junegunn/fzf.vim'
Plug 'vim-syntastic/syntastic'
Plug 'editorconfig/editorconfig-vim'
Plug 'rhysd/committia.vim'
Plug 'mbbill/undotree'
Plug 'ludovicchabant/vim-gutentags'
Plug 'nathanaelkane/vim-indent-guides'
"Plug 'scrooloose/nerdtree'
Plug 'janko/vim-test'
Plug 'vimwiki/vimwiki'
Plug 'sheerun/vim-polyglot'

"colorschemes
Plug 'nanotech/jellybeans.vim'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/seoul256.vim' "not enough color variety in some cases
Plug 'morhetz/gruvbox'

call plug#end()


" mappings
" view tab to the left, right
nnoremap <C-h> :tabp<CR>
nnoremap <C-l> :tabn<CR>
" move tab to the left, right
nnoremap <C-j> :tabm-1<CR>
nnoremap <C-k> :tabm+1<CR>
nnoremap <C-t> :tabe<space>
nnoremap <tab> %
vnoremap <tab> %
" execute current line in shell, replace with results
nnoremap Q !!sh<CR>
" iterm thank you (vim only)
vnoremap <leader>C :'<,'>w !it2copy<CR><CR>
nnoremap <leader>C :w !it2copy<CR><CR>


" Basic Settings
set encoding=utf-8 nobomb  " don't preprend Byte Order Mark
set nomodeline  " don't honor modelines in files that are being edited
set showmode
set showcmd
set hidden
set visualbell
set noerrorbells
set ttyfast
set undofile
set undoreload=10000
set nofoldenable  " turn off folds

" set list
set lazyredraw  " don't redraw while running macros, registers, commands, etc.
set splitbelow
set splitright
set autowrite
set shiftround  " always indent in multiple of `shiftwidth`
set title  " set window title
set listchars=tab:▸·,eol:¬,trail:∆
set list

set linebreak  " wrap lines more intelligently (at specific chars)
set colorcolumn=+1  " highlight 1 column after `textwidth`
set nu

" set wildmenu  " sensible.vim
set wildchar=<TAB>
set wildmode=longest,list  " display a nice list in wildmenu
set wildignore+=*.DS_STORE,*.db,node_modules/**,*.jpg,*.png,*.gif

set pastetoggle=<leader>p

" Leader
let mapleader = ","
let maplocalleader = "\\"

" status line
" TODO replace with a plugin
set statusline=%!BuildStatusLine()

" Tabs, spaces, wrapping
set softtabstop=2  " how many spaces a literal tab character is
set wrap
"set textwidth=80  " 80 for python, but going to start using 120
set textwidth=120


" backups
" I don't know if I actually need this anymore. This produces a ton a files and
" never cleans them up... Maybe clean up files after they get X old?
set backup
set noswapfile

" backward incompatible change in neovim v0.5 necessitates this, see https://github.com/neovim/neovim/issues/14978
if has('nvim-0.5')  " read: version >= 0.5
    set undodir=~/.nvim/tmp/undo//
    set backupdir=~/.nvim/tmp/backup//
    set directory=~/.nvim/tmp/swap//
else
    set undodir=~/.vim/tmp/undo//
    set backupdir=~/.vim/tmp/backup//
    set directory=~/.vim/tmp/swap//
endif

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

"TODO it looks like this might be important. Keep this around
"256 colors for maximum bling.
"if (&term =~ "xterm") || (&term =~ "screen")  " sensible.vim
"set t_Co=256  " sensible.vim
"endif  " sensible.vim

set termguicolors "added for nvim color support
"set t_ut= " clearing uses current background color

"For Neovim 0.1.3 and 0.1.4
"(from night-owl.vim readme)
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1

"added for deesrt-night colorscheme, but doesn't seem to do anything...
let g:dark_transp_bg = 1

set background=dark

colorscheme gruvbox
"let g:gruvbox_material_background = 'hard'  "suggested for gruvbox-material
"let g:gruvbox_contrast_dark = 'hard'

"colorscheme desert-night


" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

set ignorecase " ignore casing for search
set smartcase " ignore casing for search unless there are caps
set showmatch " blink the matching paren/bracket when closing
set matchtime=3  " time in 1/10th of a second to show match
set hlsearch " highlight search matches
set gdefault " sets 'g' flag automatically for substitutions


"nerdtree settings
"
"auto open drawer for all tabs/windows
"autocmd BufWinEnter * NERDTreeMirror

" vim-indent-guides settings
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

"
"fzf + fzf.vim settings

" use rg instead of fzf
"let $FZF_DEFAULT_COMMAND = "rg --files --hidden --follow --color=never"
let $FZF_DEFAULT_COMMAND = "rg --files --hidden --follow --glob '!vendor/cache'"
"let $FZF_DEFAULT_COMMAND = "rg --column --line-number --no-heading --color=always --smart-case"

" bindings for opening files
" https://github.com/junegunn/fzf.vim/issues/435#issuecomment-511044747
let g:fzf_action = {
  \ 'ctrl-t': 'tab drop',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" Empty value to disable preview window altogether
let g:fzf_preview_window = []

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1


" #################
" vim-test settings
" #################

" terminal position
let test#neovim#term_position = "belowright"
let test#vim#term_position = "belowright"

" python specific
let test#strategy = 'neovim'
let test#python#runner = 'pytest'
let test#python#pytest#executable = 'withenv venv/bin/pytest'
let test#ruby#runner = 'rspec'
let test#ruby#rspec#executable = 'withenv vendor/bundle/bundle exec rspec'

" mappings
nnoremap <leader>tn :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>ts :TestSuite<CR>
nnoremap <leader>tl :TestLast<CR>
nnoremap <leader>tv :TestVisit<CR>


" vim-wiki settings
let g:vimwiki_list = [{ 'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md' }]


" mappings
" I cant quit you :(
nnoremap <C-p> :Files<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>t :Tags<CR>


" syntastic settings
"let g:syntastic_always_populate_loc_list = 0
"let g:syntastic_auto_loc_list = 2  " this is the default
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0
"let g:syntastic_auto_jump = 0  " don't auto jump; really annoying for python

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
    "let statusline .= "%#warningmsg#"
    "let statusline .= "%{SyntasticStatuslineFlag()}"
    "let statusline .= "%*"

    " Left/right separator
    let statusline .= "%="

    " Gutentags status indicator
    let statusline .= "%{gutentags#statusline('', ' | ')}"
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

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" format json/xml blocks
"nnoremap <leader>fj :%!python -m json.tool<cr>  " format json
nnoremap <leader>fj :'<,'>!python -m json.tool<cr>
nnoremap <leader>fx :'<,'>!xmllint --format -<cr>

" insert mode abbreviations for correcting common spelling mistakes
iabbrev adn and
iabbrev @@ this is an expanded region
