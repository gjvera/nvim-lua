local packer = require'packer'
local util = require'packer.util'
packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

packer.startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
  use {
      'kyazdani42/nvim-tree.lua',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'bluz71/vim-nightfly-guicolors'
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'norcalli/nvim-colorizer.lua'
  use 'folke/tokyonight.nvim'
  use 'TroyFletcher/vim-colors-synthwave'
  use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'nvim-treesitter/nvim-treesitter'
  use 'p00f/nvim-ts-rainbow'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'jiangmiao/auto-pairs'
  use 'xiyaowong/nvim-transparent'
  use 'jose-elias-alvarez/null-ls.nvim'
  use "lukas-reineke/indent-blankline.nvim"
  end
)

require("transparent").setup({
  enable = true, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be clear
    'all'
  },
  exclude = {}, -- table: groups you don't want to clear
})
require'colorizer'.setup()
require'telescope'.setup()
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  }
}

require'nvim-tree'.setup {
  disable_netrw        = false,
  hijack_netrw         = true,
  open_on_setup        = false,
  ignore_ft_on_setup   = {},
  auto_close           = false,
  auto_reload_on_write = true,
  open_on_tab          = false,
  hijack_cursor        = false,
  update_cwd           = false,
  hijack_unnamed_buffer_when_opening = false,
  hijack_directories   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    preserve_window_proportions = false,
    mappings = {
        list = {
            { key = "<CR>",      action = "edit"},
            { key = "<2-LeftMouse>",  action = "edit"},
            { key = "<2-RightMouse>", action = "cd"},
            { key = "<C-,>",          action = "cd"},
            { key = "<C-t>",          action = "tabnew"},
            { key = "s",              action = "vsplit"},
            { key = "x",              action = "split"},
            { key = "<BS>",           action = "close_node"},
            { key = "<S-CR>",         action = "close_node"},
            { key = "P",              action = "parent_node"},
            { key = "h",              action = "close_node"},
            { key = "l",              action = "edit"},
            { key = "K",              action = "first_sibling"},
            { key = "J",              action = "last_sibling"},
            { key = "<Tab>",          action = "preview"},
            { key = "I",              action = "toggle_ignored"},
            { key = "H",              action = "toggle_dotfiles"},
            { key = "R",              action = "refresh"},
            { key = "a",              action = "create"},
            { key = "d",              action = "remove"},
            { key = "r",              action = "rename"},
            { key = "<C-r>",          action = "full_rename"},
            { key = ",c",             action = "next_git_item"},
            { key = "-",              action = "dir_up"},
            { key = "q",              action = "close"},
        }
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  },
  actions = {
    change_dir = {
      enable = true,
      global = false,
    },
    open_file = {
      quit_on_open = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame", },
          buftype  = { "nofile", "terminal", "help", },
        }
      }
    }
  }
}
