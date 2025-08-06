local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('tpope/vim-sensible')
Plug('tpope/vim-fugitive')
Plug('tpope/vim-rhubarb')
Plug('tpope/vim-commentary')
Plug('junegunn/fzf')
Plug('junegunn/fzf.vim')
Plug('nvim-telescope/telescope-fzf-native.nvim', {['do'] = 'make'})
Plug('nvim-telescope/telescope.nvim', {['rev'] = '0.1.x'})
Plug('editorconfig/editorconfig-vim')
Plug('rhysd/committia.vim')
Plug('mbbill/undotree')
Plug('nvim-lua/plenary.nvim')
Plug('ludovicchabant/vim-gutentags')
Plug('nathanaelkane/vim-indent-guides')
Plug('vim-test/vim-test')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate', ['branch'] = 'master', ['lazy'] = 0})
Plug('ojroques/nvim-osc52')

-- lsp plugins
Plug('neovim/nvim-lspconfig')
-- Plug('palantir/python-language-server')

Plug('Wansmer/treesj')

-- colorschemes
Plug('chriskempson/base16-vim')
Plug('morhetz/gruvbox')

vim.call('plug#end')



-- basic settings
vim.opt.fileencoding = 'utf-8'
vim.opt.bomb = false
vim.opt.modeline = false
vim.opt.showmode = true
vim.opt.undofile = true
vim.opt.undoreload = 10000
vim.opt.cursorline = true
vim.opt.magic = true
-- vim.opt.nobackup = true
vim.opt.backup = false
-- vim.opt.noswapfile = true
vim.opt.swapfile = false

vim.opt.lazyredraw = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.shiftround = true
vim.opt.title = true
vim.opt.listchars = { tab = '▸·', eol = '¬', trail = '∆' }
vim.opt.list = true
vim.opt.linebreak = true
vim.opt.colorcolumn = '+1'
vim.opt.number = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.opt.matchtime = 2
vim.opt.gdefault = true

-- vim.opt.wildchar = '<TAB>'  -- defaults to tab
vim.opt.wildmode = { 'longest', 'list' }
vim.opt.wildignore:append({ '*.DS_STORE', '*.db', 'node_modules/**', '*.jpg', '*.png', '*.gif' })

-- vim.opt.pastetoggle = '<leader>p'  -- sources say this is not needed anymore
vim.opt.tabpagemax = 20

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.opt.softtabstop = 2
vim.opt.wrap = true
vim.opt.textwidth = 120

local function build_statusline()
  local line = ''
  line = line .. '%f'  -- filename (F -> full, f-> relative)
  line = line .. '%( %h%1*%m%*%r%w%) '  -- buffer flags
  -- line = line .. '(%{&ff}%(\/%Y%))'  -- File format and type
  line = line .. '(%{&ff}%(/%Y%))'  -- File format and type

  line = line .. '%=' -- left/right separator

  -- Skip if gutentags hasn't been loaded yet. (usually during nvim startup)
  if vim.fn.exists('*gutentags#statusline') == 1 then
    line = line .. vim.fn['gutentags#statusline']('', ' | ')
  end

  line = line .. '(%l,%c%V) '  -- line and column
  line = line .. '%03.3b '  -- character under cursor (decimal)
  line = line .. '0x%02.2B '  -- character under cursor (hex)
  line = line .. '| %P/%L'  -- file progress

  return line
end

vim.opt.statusline = build_statusline()



-- mappings
vim.keymap.set('n', '<C-h>', ':tabp<CR>', { noremap = true})
vim.keymap.set('n', '<C-l>', ':tabn<CR>', { noremap = true})
vim.keymap.set('n', '<C-j>', ':tabm-1<CR>', { noremap = true})
vim.keymap.set('n', '<C-k>', ':tabm+1<CR>', { noremap = true})
vim.keymap.set('n', '<C-t>', ':tabe ', { noremap = true})
vim.keymap.set('n', '<tab>', '%', { noremap = true})
vim.keymap.set('v', '<tab>', '%', { noremap = true})
vim.keymap.set('n', 'Q', '!!sh<CR>', { noremap = true})  -- executes current line in shell, replace with results

vim.keymap.set('n', '<leader>ev', ':vsplit $MYVIMRC', { noremap = true})
vim.keymap.set('n', '<leader>sv', ':source $MYVIMRC', { noremap = true})

-- format json
vim.keymap.set('v', '<leader>fj', ':\'<,\'>!python3 -m json.tool<CR>', { noremap = true})
vim.keymap.set('n', '<leader>ffj', ':%!python3 -m json.tool<CR>', { noremap = true})

-- format xml
vim.keymap.set('v', '<leader>fx', ':\'<,\'>!xmllint --format -<cr>', { noremap = true})
vim.keymap.set('n', '<leader>ffx', ':%!xmllint --format -<cr>', { noremap = true})

-- base64 decode
vim.keymap.set('v', '<leader>db', ':\'<,\'>!base64 -d<cr>', { noremap = true})
vim.keymap.set('n', '<leader>fdb', ':%!base64 -d<cr>', { noremap = true})

-- better regex support for search
vim.keymap.set('n', '/', '/\\v', { noremap = true})
vim.keymap.set('v', '/', '/\\v', { noremap = true})



-- make those folders automatically if they don't already exist.
local undodir = '~/.nvim/tmp/undo//'
local backupdir = '~/.nvim/tmp/backup//'
local swapdir = '~/.nvim/tmp/swap//'

if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(vim.fn.expand(undodir), 'p')
end
if vim.fn.isdirectory(backupdir) == 0 then
  vim.fn.mkdir(vim.fn.expand(backupdir), 'p')
end
if vim.fn.isdirectory(swapdir) == 0 then
  vim.fn.mkdir(vim.fn.expand(swapdir), 'p')
end


-- colorscheme
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.g.gruvbox_contrast_dark = 'hard'
vim.cmd.colorscheme('gruvbox')



-- vim-indent-guides settings
vim.g.indent_guides_enable_on_vim_startup = 1
vim.g.indent_guides_start_level = 2
vim.g.indent_guides_guide_size = 1
vim.g.indent_guides_color_change_percent = 70



-- fzf + fzf.vim settings
vim.env.FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob \'!vendor/cache\''  -- use rg instead of fzf

-- bindings for opening files
-- https://github.com/junegunn/fzf.vim/issues/435#issuecomment-511044747
vim.g.fzf_action = {
  ['ctrl-t'] = 'tab drop',
  ['ctrl-x'] = 'split',
  ['ctrl-v'] = 'vsplit'
}

vim.g.fzf_layout = { ['down'] = "~40%" }
vim.g.fzf_preview_window = {}  -- Empty value to disable preview window altogether
vim.g.fzf_buffers_jump = 1  -- [Buffers] Jump to the existing window if possible

-- I cant quit you :(
-- vim.keymap.set('n', '<C-p>', ':Files<CR>', { noremap = true})
-- nnoremap <leader>f :Files<CR> " conflicts with my formatting mappings (<leader>fx)
vim.keymap.set('n', '<leader>t', ':Tags<CR>', { noremap = true})



-- telescope settings
-- TODO: use nvim-telescope/telescope-fzf-native.nvim
local telescope = require('telescope')
telescope.load_extension('fzf')
telescope.setup({
  defaults = {
    mappings = {
      i = {
        ['<C-s>'] = 'select_horizontal'
      },
      n = {
        ['<C-s>'] = 'select_horizontal'
      }
    }
  }
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-f>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>gg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<C-g>', builtin.live_grep, { desc = 'Telescope live grep' })



-- vim-test settings
vim.g['test#neovim#term_position'] = 'botright'
vim.g['test#vim#term_position'] = "botright"

vim.g['test#strategy'] = 'neovim'
vim.g['test#python#runner'] = 'pytest'
vim.g['test#python#pytest#executable'] = 'withenv venv/bin/pytest'
vim.g['test#ruby#runner'] = 'rspec'
vim.g['test#ruby#rspec#executable'] = 'withenv vendor/bundle/bundle exec rspec'

vim.keymap.set('n', '<leader>tn', ':TestNearest<CR>', { noremap = true})
vim.keymap.set('n', '<leader>tf', ':TestFile<CR>', { noremap = true})
vim.keymap.set('n', '<leader>ts', 'TestSuite<CR>', { noremap = true})
vim.keymap.set('n', '<leader>tl', 'TestLast<CR>', { noremap = true})
vim.keymap.set('n', '<leader>tv', 'TestVisit<CR>', { noremap = true})



-- nvim-osc52 settings
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



-- fugitive settings
vim.keymap.set('n', '<leader>gb', ':Git blame<CR>', { noremap = true})
vim.keymap.set('n', '<leader>gl', ':Git log<CR>', { noremap = true})

-- NOTE: relies on nvim-osc52 clipboard override; GBrowse! sets the '+' reg.
local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>br', function() vim.cmd('GBrowse!') end, opts)
vim.keymap.set('v', '<leader>br', ':GBrowse!<CR>', opts)



-- nvim-lspconfig settings
local lsp_config = require('lspconfig')
local home_dir = vim.loop.os_homedir()

vim.lsp.set_log_level("debug")

lsp_config.pylsp.setup {
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



-- treesitter settings
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "python",
    "ruby",
    "json",
    "markdown",
    "make",
    "go",
    "bash" ,
    "yaml",
    "vim",
    "lua",
    "c",
    "cpp",
    "javascript",
    "html",
    "comment",
    "css",
  },
  sync_install = false,  -- only applited to `ensure_installed`
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  }
}



-- treesj config
treesj = require('treesj')
treesj.setup({
  use_default_keymaps = false,
})

vim.keymap.set('n', 'gJ', treesj.join)
vim.keymap.set('n', 'gS', function()
    treesj.toggle({ split = { recursive = true } })
end)
