-- INFO: introduction
-- This comes from https://github.com/Hashino/minimal.nvim

-- INFO: plugins
vim.pack.add({
  "https://github.com/folke/tokyonight.nvim",
  "https://github.com/nvim-lua/plenary.nvim",        -- library dependency
  "https://github.com/nvim-tree/nvim-web-devicons",  -- icons (nerd font)
  "https://github.com/nvim-telescope/telescope.nvim", -- the fuzzy finder
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/saghen/blink.cmp",
  "https://github.com/saghen/blink.lib",
  "https://github.com/neovim/nvim-lspconfig", -- default configs for lsps
  "https://github.com/mason-org/mason.nvim",                     -- package manager
  "https://github.com/mason-org/mason-lspconfig.nvim",           -- lspconfig bridge
  "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim", -- auto installer
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/folke/which-key.nvim",
  "https://github.com/folke/todo-comments.nvim", -- highlight TODO/INFO/WARN comments
  'https://github.com/folke/persistence.nvim',
  'https://github.com/nvim-neo-tree/neo-tree.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/NeogitOrg/neogit',
  'https://github.com/sindrets/diffview.nvim',
  'https://github.com/folke/lazydev.nvim',
  'https://github.com/mfussenegger/nvim-dap',
  'https://github.com/igorlfs/nvim-dap-view',
  'https://github.com/nvim-neotest/nvim-nio',
  'https://github.com/jay-babu/mason-nvim-dap.nvim',
  'https://github.com/theHamsta/nvim-dap-virtual-text',
  'https://github.com/akinsho/bufferline.nvim',
  'https://github.com/zeek/vim-zeek'
} )

require 'config.options'
require 'config.bufferline'
require 'config.lsp'
require 'config.debug'
require 'config.treesitter'
require 'config.telescope'
require 'config.git'

require('lazydev').setup()

-- INFO: better statusline
require("lualine").setup({})

-- INFO: keybinding helper

require("which-key").setup({
  spec = {
    { "<leader>s", group = "[S]earch", icon = { icon = "", color = "green", }, },
    { "<leader>g", group = "[G]it", icon = { icon=" ", color="green", }, },
  }
})

-- NOTE: there are many more quality-of-life plugins available and others that
-- achieve what these do. these are just our recommendations to start.

-- INFO: utility plugins
require("todo-comments").setup()

-- INFO: session handling
require('persistence').setup()

vim.keymap.set("n", "<leader>l", function()
  require('persistence').start()
  require('persistence').load()
end, { desc = "[L]oad session", })

-- INFO: file manager
vim.keymap.set("n", "-", "<cmd>Neotree filesystem reveal position=current<cr>")
require('neo-tree').setup({
  filesystem = {
    window = {
      mappings = {
        ['-'] = 'close_window'
      }
    }
  }
})


vim.keymap.set("n", "<leader>q", function()
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      vim.cmd("cclose")
      return
    end
  end
  vim.cmd("copen")
end)

-- INFO: terminal
vim.keymap.set("n", "<leader>t", function()
  vim.cmd("term")
  vim.cmd("startinsert")
end, { desc = "[T]erminal"})

-- uncomment to enable automatic plugin updates
-- vim.pack.update()
