 return {
     "p00f/nvim-ts-rainbow",
     {
         "TroyFletcher/vim-colors-synthwave",
         lazy = false,
         config = function()
           vim.cmd.colorscheme "synthwave"
         end,
     },
     "tpope/vim-surround",
     "tpope/vim-commentary",
     "jiangmiao/auto-pairs",
     { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
     "neovim/nvim-lspconfig",
     "HiPhish/rainbow-delimiters.nvim",
     "hrsh7th/nvim-cmp",
     {
         "hrsh7th/cmp-nvim-lsp",
         lazy = false,
         config = function()
             require'cmp'.setup {
               sources = {
                 { name = 'nvim_lsp' }
               }
             }
         end
     },
     "saadparwaiz1/cmp_luasnip",
     "L3MON4D3/LuaSnip",
     "folke/tokyonight.nvim",
     {
         "nvim-treesitter/nvim-treesitter",
         config = function()
             require'nvim-treesitter.configs'.setup {
               ensure_installed = "all",
               sync_install = false,
               highlight = {
                 enable = true,
                 additional_vim_regex_highlighting = false,
               },
             }
         end
     },
     {
         "nvim-telescope/telescope.nvim",
         keys = {
           { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "live grep" },
           { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "find files" },
         },
         dependencies = {
           "nvim-lua/plenary.nvim",
         },
         config = function()
           require("telescope").setup()
         end,
     },
     {
         "norcalli/nvim-colorizer.lua",
         config = function()
             require'colorizer'.setup()
         end
     },
     {
       "nvim-neo-tree/neo-tree.nvim",
         keys = {
           { "<C-n>", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
         },
         dependencies = {
           "nvim-lua/plenary.nvim",
           "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
           "MunifTanjim/nui.nvim",
           -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
         },
         config = function()
           require("neo-tree").setup()
         end,
     }
 }
