" vim-plug
" TODO: switch to .nvim dir
call plug#begin('~/.vim/plugged-in')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
"Plug 'tpope/vim-sleuth'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'rhysd/committia.vim'
Plug 'mbbill/undotree'
Plug 'ludovicchabant/vim-gutentags'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'janko/vim-test'
Plug 'Roguelazer/variables_file.vim'
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ojroques/nvim-osc52'

"lsp plugins
Plug 'neovim/nvim-lspconfig'
"Plug 'palantir/python-language-server'

"colorschemes
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'

call plug#end()


" Basic Settings
set encoding=utf-8 nobomb  " don't preprend Byte Order Mark; need w neovim?
set nomodeline  " don't honor modelines
set hidden  " allow switch from unsaved buffer
set novb noeb
set undofile  " TODO learn more about; stole some of this from Losh
set cursorline
set noswapfile

" TODO help file says this should only be used temporarily, could cause display errors...
set lazyredraw  " don't redraw while running macros, registers, commands, etc.
set splitbelow splitright
set shiftround  " always indent in multiple of `shiftwidth`
set listchars=tab:▸·,eol:¬,trail:∆
set list

" TODO revisit this setting; thinking about not wrapping
set linebreak  " wrap lines more intelligently (at specific chars)
set colorcolumn=+1  " highlight 1 column after `textwidth`
set nu

set ignorecase smartcase
set gdefault " sets 'g' flag automatically for substitutions

set wildchar=<TAB>
set wildmode=longest,list  " display a nice list in wildmenu
set wildignore+=*.DS_STORE,*.db,node_modules/**,*.jpg,*.png,*.gif

set pastetoggle=<leader>p
set tabpagemax=20

let mapleader=" "
let maplocalleader="\\"

" status line
" TODO replace with a plugin
set statusline=%!BuildStatusLine()

" Tabs, spaces, wrapping
set softtabstop=2  " how many spaces a literal tab character is
set nowrap  " TODO trying this out; might want to set horz scroll value
set textwidth=120

" TODO: I'm not using the swap or backup dirs right now, could get rid of
set undodir=~/.nvim/tmp/undo//
set backupdir=~/.nvim/tmp/backup//
set directory=~/.nvim/tmp/swap//

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



" mappings
nnoremap <C-h> :tabp<CR>
nnoremap <C-l> :tabn<CR>
nnoremap <C-j> :tabm-1<CR>
nnoremap <C-k> :tabm+1<CR>
nnoremap <C-t> :tabe<space>
nnoremap <tab> %
vnoremap <tab> %
nnoremap Q !!sh<CR> "execute current line in shell, replace with results

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" format json
nnoremap <leader>fj :'<,'>!python3 -m json.tool<cr>
nnoremap <leader>ffj :%!python3 -m json.tool<cr>

" format xml
nnoremap <leader>fx :'<,'>!xmllint --format -<cr>
nnoremap <leader>ffx :%!xmllint --format -<cr>

" base64 decode
nnoremap <leader>db :'<,'>!base64 -d<cr>
nnoremap <leader>fdb :%!base64 -d<cr>

" open helpfile for word under cursor
nnoremap <leader>h :help <CR>



let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox



" ##########################
" vim-indent-guides settings
" ##########################
"
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 70



" ##########################
"fzf + fzf.vim settings
" ##########################

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



" mappings
" I cant quit you :(
nnoremap <C-p> :Files<CR>
"nnoremap <leader>f :Files<CR> " conflicts with my formatting mappings (<leader>fx)
nnoremap <leader>t :Tags<CR>



" ###################
" nvim-osc52 settings
" ###################

lua << EOF
local function copy(lines, _)
  require('osc52').copy(table.concat(lines, '\n'))
end

local function paste()
  return {vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('')}
end

vim.g.clipboard = {
  name = 'osc52',
  copy = {['+'] = copy, ['*'] = copy},
  -- not sure if I need this paste part...
  paste = {['+'] = paste, ['*'] = paste},
}

-- Now the '+' register will copy to system clipboard using OSC52
vim.keymap.set('n', '<leader>c', '"+y')
vim.keymap.set('v', '<leader>c', '"+y')
vim.keymap.set('n', '<leader>cc', '"+yy')
EOF



" ###################
" home brewed status line
" (https://github.com/mcantor/dotfiles/blob/master/vim/.vimrc)
"
" TODO use a simple plugin to do this; only really looking for col. num and char code
" ###################

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


" ###################
" fugitive settings
" ###################
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gl :Git log<CR>


"nvim-lspconfig settings
lua << EOF
local lsp_config = require 'lspconfig'
local home_dir = vim.loop.os_homedir()

vim.lsp.set_log_level("debug")

lsp_config.pylsp.setup{
  cmd = { home_dir .. "/global_venv/bin/pylsp" },
  settings = {
    pylsp = {
      plugins = {
        -- TODO: most likely can change what's installed with pylsp to not have to disable all of this.
        configurationSources = { 'flake8', 'mypy' },
        flake8 = { enabled = true },
        mypy = { enabled = true },
        pycodestyle = { enabled = false },
      }
    }
  }
}
EOF


lua << EOF
-- NOTE: relies on nvim-osc52 clipboard override; GBrowse! sets the '+' reg.
local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>br', function() vim.cmd('GBrowse!') end, opts)
-- this format bc using vim.cmd didn't get selection correctly nor deselect/exit visual mode
vim.keymap.set('v', '<leader>br', ':GBrowse!<CR>', opts)
EOF
