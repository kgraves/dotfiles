filetype off
set nocompatible
filetype plugin indent on


" vim-plug
call plug#begin('~/.vim/plugged-in')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
"Plug 'tpope/vim-sleuth'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
"Plug 'vim-syntastic/syntastic' "syntax chceking and per-line markers
Plug 'editorconfig/editorconfig-vim'
Plug 'rhysd/committia.vim'
Plug 'mbbill/undotree'
Plug 'ludovicchabant/vim-gutentags'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'janko/vim-test'
"Plug 'vimwiki/vimwiki'
"Plug 'sheerun/vim-polyglot'
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"lsp plugins
Plug 'neovim/nvim-lspconfig'
"Plug 'palantir/python-language-server'

"colorschemes
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'

call plug#end()


" mappings
nnoremap <C-h> :tabp<CR>
nnoremap <C-l> :tabn<CR>
nnoremap <C-j> :tabm-1<CR>
nnoremap <C-k> :tabm+1<CR>
nnoremap <C-t> :tabe<space>
nnoremap <tab> %
vnoremap <tab> %
nnoremap Q !!sh<CR> "execute current line in shell, replace with results

" iterm thank you (vim only)
vnoremap <leader>C :'<,'>w !it2copy<CR><CR>
nnoremap <leader>C :w !it2copy<CR><CR>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" format json/xml blocks
nnoremap <leader>fj :'<,'>!python -m json.tool<cr>
nnoremap <leader>fx :'<,'>!xmllint --format -<cr>


" Basic Settings
set encoding=utf-8 nobomb  " don't preprend Byte Order Mark
set nomodeline  " don't honor modelines in files that are being edited
set showmode
set showcmd
set hidden
set novb
set noeb
set ttyfast
set undofile
set undoreload=10000
set nofoldenable  " turn off folds
set autoread
set cursorline
set magic
set nobackup
set noswapfile

set lazyredraw  " don't redraw while running macros, registers, commands, etc.
set splitbelow
set splitright
set shiftround  " always indent in multiple of `shiftwidth`
set title  " set window title
set listchars=tab:▸·,eol:¬,trail:∆
set list

set linebreak  " wrap lines more intelligently (at specific chars)
set colorcolumn=+1  " highlight 1 column after `textwidth`
set nu

set ignorecase " ignore case for search
set smartcase " ignore casing for search unless there are caps
set showmatch " blink the matching paren/bracket when closing
set matchtime=2
set hlsearch " highlight search matches
set gdefault " sets 'g' flag automatically for substitutions

set wildchar=<TAB>
set wildmode=longest,list  " display a nice list in wildmenu
set wildignore+=*.DS_STORE,*.db,node_modules/**,*.jpg,*.png,*.gif

set pastetoggle=<leader>p
set tabpagemax=20

" Leader
let mapleader = ","
let maplocalleader = "\\"

" status line
" TODO replace with a plugin
set statusline=%!BuildStatusLine()

" Tabs, spaces, wrapping
set softtabstop=2  " how many spaces a literal tab character is
set wrap
set textwidth=120


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

set termguicolors "added for nvim color support
set background=dark

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox


" vim-indent-guides settings
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

"
"fzf + fzf.vim settings

let $FZF_DEFAULT_COMMAND = "rg --files --hidden --follow --glob '!vendor/cache'" "use rg instead of fzf

" bindings for opening files
" https://github.com/junegunn/fzf.vim/issues/435#issuecomment-511044747
let g:fzf_action = {
  \ 'ctrl-t': 'tab drop',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'down': '~40%' }
let g:fzf_preview_window = [] "Empty value to disable preview window altogether
let g:fzf_buffers_jump = 1 "[Buffers] Jump to the existing window if possible


" #################
" vim-test settings
" #################

" terminal position
let test#neovim#term_position = "botright"
let test#vim#term_position = "botright"

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

" better regex support for search
nnoremap / /\v
vnoremap / /\v


" vim-wiki settings
"NOTE: not currently used
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
"let g:syntastic_python_python_exec = 'python3'


" status line
" (https://github.com/mcantor/dotfiles/blob/master/vim/.vimrc)
function! BuildStatusLine()
    let statusline = ""
    let statusline .= "%f" "Filename (F -> full, f -> relative)
    let statusline .= "%( %h%1*%m%*%r%w%) " "Buffer flags
    let statusline .= "(%{&ff}%(\/%Y%))" "File format and type

    " syntastic error messages
    "let statusline .= "%#warningmsg#"
    "let statusline .= "%{SyntasticStatuslineFlag()}"
    "let statusline .= "%*"

    let statusline .= "%=" "Left/right separator

    let statusline .= "%{gutentags#statusline('', ' | ')}" "Gutentags status indicator
    let statusline .= "(%l,%c%V) " "Line & column
    let statusline .= "%03.3b " "Character under cursor (decimal)
    let statusline .= "0x%02.2B " "Character under cursor (hexadecimal)
    let statusline .= "| %P/%L" "File progress

    return statusline
endfunction


"fugitive settings
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gl :Git log<CR>


"nvim-lspconfig settings
lua << EOF
local lsp_config = require 'lspconfig'

vim.lsp.set_log_level("debug")

lsp_config.pylsp.setup{
  -- cmd_env = { vim.fn.getcwd() },
  cmd = { "/home/vagrant/global_venv/bin/pylsp" },
  settings = {
    pylsp = {
      plugins = {
        configurationsSources = { 'flake8', 'mypy' },
        flake8 = {
          enabled = true,
          -- maxLineLength = 120,
          -- ignore = { 'E501' },
        },
        mypy = { enabled = true },
      }
    }
  }
}

lsp_config.vimls.setup{
  cmd = { '/home/vagrant/global_node_modules/node_modules/.bin/vim-language-server', '--stdio' }
}
EOF



lua << EOF
-- local lsp_config = require 'lspconfig'
-- local gem = require 'nvim-lsp-installer.installers.gem'
-- local npm = require 'nvim-lsp-installer.installers.npm'
-- local pip = require 'nvim-lsp-installer.installers.pip3'
-- local server = require 'nvim-lsp-installer.server'
-- local path = require "nvim-lsp-installer.path"

-- vim.lsp.set_log_level('debug')

-- setup ruby language server

-- local solargraph_bin_dir = gem.executable(server.get_server_root_path('solargraph'))
-- local solargraph_bundle_bin_path = solargraph_bin_dir .. '/bundler'

-- lsp_config.solargraph.setup{
  -- cmd = {
    -- solargraph_bundle_bin_path,
    -- 'exec solargraph',
    -- '--stdio',
  -- },
  -- extra = {
    -- cwd = server.get_server_root_path('solargraph'),
  -- },
  -- cmd_env = gem.env(server.get_server_root_path('solargraph')),
  -- -- settings = {
    -- -- -- bundlerPath = gem.executable(solargraph_root_dir, 'bundler')
    -- -- bundlerPath = solargraph_bundle_bin_path
  -- -- }
-- }

EOF


"treesitter settings
" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   -- One of "all", "maintained" (parsers with maintainers), or a list of languages
"   -- ensure_installed = "maintained",
"   -- ensure_installed = {
"     -- "python",
"     -- "ruby",
"     -- "json",
"     -- "markdown",
"     -- "make",
"     -- "go",
"     -- "bash" ,
"     -- "yaml",
"     -- "vim",
"     -- "lua",
"     -- "c",
"     -- "cpp",
"     -- "javascript",
"     -- "html",
"     -- "comment",
"     -- "php",
"     -- "css",
"   -- },

"   -- Install languages synchronously (only applied to `ensure_installed`)
"   sync_install = false,

"   -- List of parsers to ignore installing
"   -- ignore_install = { "javascript" },

"   highlight = {
"     -- `false` will disable the whole extension
"     enable = true,

"     -- list of language that will be disabled
"     -- disable = { "c", "rust" },

"     -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
"     -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
"     -- Using this option may slow down your editor, and you may see some duplicate highlights.
"     -- Instead of true it can also be a list of languages
"     additional_vim_regex_highlighting = false,
"   },
"   indent = {
"     enable = true,
"   }
" }
" EOF
