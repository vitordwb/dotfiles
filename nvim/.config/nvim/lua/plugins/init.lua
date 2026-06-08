return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false, -- Colocamos como false para garantir que os atalhos funcionem logo ao abrir o nvim
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<CR>", mode = "n", desc = "Window Left" },
      { "<C-l>", "<cmd>TmuxNavigateRight<CR>", mode = "n", desc = "Window Right" },
      { "<C-j>", "<cmd>TmuxNavigateDown<CR>", mode = "n", desc = "Window Down" },
      { "<C-k>", "<cmd>TmuxNavigateUp<CR>", mode = "n", desc = "Window Up" },
      { "<C-\\>", "<cmd>TmuxNavigatePrevious<CR>", mode = "n", desc = "Window Previous" },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = function(_, opts)
      opts.filters = opts.filters or {}
      opts.filters.git_ignored = false
      opts.filters.dotfiles = false
      return opts
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
