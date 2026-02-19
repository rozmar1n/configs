return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  -- какой-то neogit
  {
    "NeogitOrg/neogit",
    event = "CmdlineEnter",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required

      "nvim-telescope/telescope.nvim", -- optional
    },
  },
  -- чтобы в nvim-tree отображались папки, которые содержаться в gitignore
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      filters = {
        git_ignored = false,
      },
    },
  },

  -- что-то там
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- множественный курсор
  {
    "brenton-leighton/multiple-cursors.nvim",
    version = "*",
    opts = {},
    lazy = false,
    keys = {
      {
        "<C-j>",
        "<Cmd>MultipleCursorsAddDown<CR>",
        mode = { "n", "x" },
        desc = "Add cursor and move down",
      },
      {
        "<C-k>",
        "<Cmd>MultipleCursorsAddUp<CR>",
        mode = { "n", "x" },
        desc = "Add cursor and move up",
      },
      {
        "<C-Up>",
        "<Cmd>MultipleCursorsAddUp<CR>",
        mode = { "n", "i", "x" },
        desc = "Add cursor and move up",
      },
      {
        "<C-Down>",
        "<Cmd>MultipleCursorsAddDown<CR>",
        mode = { "n", "i", "x" },
        desc = "Add cursor and move down",
      },
      {
        "<C-LeftMouse>",
        "<Cmd>MultipleCursorsMouseAddDelete<CR>",
        mode = { "n", "i" },
        desc = "Add or remove cursor",
      },
      {
        "<Leader>m",
        "<Cmd>MultipleCursorsAddVisualArea<CR>",
        mode = { "x" },
        desc = "Add cursors to the lines of the visual area",
      },
      {
        "<Leader>a",
        "<Cmd>MultipleCursorsAddMatches<CR>",
        mode = { "n", "x" },
        desc = "Add cursors to cword",
      },
      {
        "<Leader>A",
        "<Cmd>MultipleCursorsAddMatchesV<CR>",
        mode = { "n", "x" },
        desc = "Add cursors to cword in previous area",
      },
      {
        "<Leader>d",
        "<Cmd>MultipleCursorsAddJumpNextMatch<CR>",
        mode = { "n", "x" },
        desc = "Add cursor and jump to next cword",
      },
      {
        "<Leader>D",
        "<Cmd>MultipleCursorsJumpNextMatch<CR>",
        mode = { "n", "x" },
        desc = "Jump to next cword",
      },
    },
  },
  --TODO comments
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  -- хз что
  { import = "nvchad.blink.lazyspec" },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },

  -- добавление автоподсказок для написания кода
  {
    "monkoose/neocodeium",
    event = "VeryLazy",
    config = function()
      local neocodeium = require "neocodeium"
      neocodeium.setup {
        suggest_hl = "Comment",
      }
      vim.keymap.set("i", "<A-f>", neocodeium.accept)
      vim.keymap.set("i", "<A-w>", function()
        require("neocodeium").accept_word()
      end)
      vim.keymap.set("i", "<A-a>", function()
        require("neocodeium").accept_line()
      end)
    end,
  },

  --открытие png картинок в окне neovim
  {
    'skardyy/neo-img',
    build = ":NeoImg Install",
    config = function()
      require('neo-img').setup()
    end
}
}


