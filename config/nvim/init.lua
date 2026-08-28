-- INFO: introduction
-- This comes from https://github.com/Hashino/minimal.nvim
-- this is a minimal neovim configuration written in lua. this is not meant to
-- be a distribution, but rather a template for you to build upon and/or a
-- reference for how to configure neovim using lua in the latest version.
--
-- TUTOR:
-- if you're completely new to neovim and/or vim, consider going through
-- `:Tutor` inside neovim to get a basic idea of how it works.
--     if you don't know what this means, type the following:
--       - <escape key>
--       - :
--       - Tutor
--       - <enter key>
--
-- LUA:
-- some level of familiarity with lua/programming languages are also expected.
-- if you're new to lua, consider going through the official reference:
--    https://www.lua.org/manual
-- or a more friendly tutorial like:
--    https://learnxinyminutes.com/docs/lua/
-- you can also check out `:h lua-guide` inside neovim for a neovim-specific
-- lua guide.
--
-- DEPENDENCIES:
-- this configuration assumes you have the following tools installed on your
-- system:
--    `git` - for vim builtin package manager. (see `:h vim.pack`)
--    `ripgrep` - for fuzzy finding
--    clipboard tool: xclip/xsel/win32yank - for clipboard sharing between OS and neovim (see `h: clipboard-tool`)
--    a nerdfont (ensure the terminal running neovim is using it)
-- run `:checkhealth` inside neovim to see if your system is missing anything.
--
-- MINIMAL:
-- to say that something is 'minimal' you have to define what variable you're
-- minimizing. this configuration minimizes for lines of code and concepts.
-- to some, this configuration may have too many plugins. for example, using
-- mason.nvim to manage lsp servers will be an unnecessary dependency if the
-- user is already familiar with lsps and is comfortable managing them through
-- their OS package manager. but to someone that isn't familiar with lsp servers
-- this approach wouldn't cover everything needed to have the 'minimum' necessary
-- for lsp + completion + fuzzy finding. to some, fuzzy finding is also a bloated
-- dependency.
-- this configuration is only a starting point/reference. it is expected that
-- the user will change the configuration to suit their needs.


-- INFO: options
-- these change the default neovim behaviours using the 'vim.opt' API.
-- see `:h vim.opt` for more details.
-- run `:h '{option_name}'` to see what they do and what values they can take.
-- for example, `:h 'number'` for `vim.opt.number`.

-- set <space> as the leader key
-- must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- enable true color support
vim.opt.termguicolors = true

-- make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- sync clipboard between OS and Neovim.
--  remove this option if you want your OS clipboard to remain independent.
--  see `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"
vim.g.clipboard = 'osc52'

-- enable break indent
vim.opt.breakindent = true

-- save undo history
vim.opt.undofile = true

-- case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- decrease update time
vim.opt.updatetime = 250

-- decrease mapped sequence wait time
-- displays which-key popup sooner
vim.opt.timeoutlen = 300

-- configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣", }

-- preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true

-- enable line wrapping
vim.opt.wrap = true

-- formatting
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.textwidth = 80
vim.opt.colorcolumn =  "+1"

vim.o.completeopt = 'menuone,noselect,popup,fuzzy'

-- add borders to certain popups
vim.o.winborder = 'rounded'

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = " ",
    },
  },
  virtual_text = true, -- disable inline spam
  underline = true,
})

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float({
      focus = false,
      scope = "line",
    })
  end,
})

-- clear search highlights with <Esc>
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- INFO: plugins
-- we install plugins with neovim's builtin package manager: vim.pack
-- and then enable/configure them by calling their setup functions.
--
-- (see `:h vim.pack` for more details on how it works)
-- you can press `gx` on any of the plugin urls below to open them in your
-- browser and check out their documentation and functionality.
-- alternatively, you can run `:h {plugin-name}` to read their documentation.
--
-- plugins are then loaded and configured with a call to `setup` functions
-- provided by each plugin. this is not a rule of neovim but rather a convention
-- followed by the community.
-- these setup calls take a table as an agument and their expected contents can
-- vary wildly. refer to each plugin's documentation for details.

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

-- INFO: colorscheme
vim.cmd.colorscheme("tokyonight")

require('lazydev').setup()
local bufferline = require('bufferline')
bufferline.setup({
  options = {
    style_preset = bufferline.style_preset.default,
    separator_style = "slope",
    diagnostics="nvim_lsp",
    indicator = {
      style="underline",
    },
    sort_by = function(buffer_a, buffer_b)
        -- add custom logic
        local modified_a = vim.fn.getftime(buffer_a.path)
        local modified_b = vim.fn.getftime(buffer_b.path)
        return modified_a > modified_b
    end,
  }
})
vim.keymap.set("n", "<C-l>", "<cmd>BufferLineCycleNext<cr>",     { desc = "Next buffer" })
vim.keymap.set("n", "<C-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })
vim.keymap.set("t", "<C-l>", "<cmd>BufferLineCycleNext<cr>",     { desc = "Next buffer" })
vim.keymap.set("t", "<C-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer right" })
vim.keymap.set("n", "<S-h>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer left" })

-- INFO: formatting and syntax highlighting

-- equivalent to :TSUpdate
require("nvim-treesitter").setup({
  highlight = {
    enable = true,
  },
})
require('nvim-treesitter').install({ 'lua', 'python', 'typescript', 'javascript' })

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    if ev.data.spec.name == "nvim-treesitter" and ev.data.kind == "update" then
      vim.cmd("TSUpdate")
    end
  end,
})

-- INFO: completion engine

require("blink.cmp").setup({
  completion = {
    documentation = {
      auto_show = true,
    },
  },

  keymap = { preset = 'default' },

  fuzzy = {
    implementation = "lua",
  },
})

-- INFO: lsp server installation and configuration

-- lsp servers we want to use and their configuration
-- see `:h lspconfig-all` for available servers and their settings
local lsp_servers = {
  lua_ls = {
    -- https://luals.github.io/wiki/settings/ | `:h nvim_get_runtime_file`
    Lua = { workspace = { library = vim.api.nvim_get_runtime_file("lua", true) }, },
  },
  bashls = {},
  ts_ls = {},
  pyright = {},
}
vim.lsp.enable { 'zeek' }

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
  ensure_installed = vim.tbl_keys(lsp_servers),
})
require("mason-nvim-dap").setup()
require('dap-view').setup({
  winbar = {
    default_section="scopes"
  }
})
require("nvim-dap-virtual-text").setup({})

-- configure each lsp server on the table
-- to check what clients are attached to the current buffer, use
-- `:checkhealth vim.lsp`. to view default lsp keybindings, use `:h lsp-defaults`.
for server, config in pairs(lsp_servers) do
  vim.lsp.config(server, {
    settings = config,

    -- only create the keymaps if the server attaches successfully
    on_attach = function(_, bufnr)
      vim.keymap.set("n", "grd", vim.lsp.buf.definition,
        { buffer = bufnr, desc = "vim.lsp.buf.definition()", })

      vim.keymap.set("n", "grf", vim.lsp.buf.format,
        { buffer = bufnr, desc = "vim.lsp.buf.format()", })
    end,
  })
end

-- NOTE: if all you want is lsp + completion + highlighting, you're done.
-- the rest of the lines are just quality-of-life/appearance plugins and
-- can be removed.

-- INFO: fuzzy finder

require("telescope").setup({})

local pickers = require("telescope.builtin")

vim.keymap.set("n", "<leader>sp", pickers.builtin, { desc = "[S]earch Builtin [P]ickers", })
vim.keymap.set("n", "<leader>sb", pickers.buffers, { desc = "[S]earch [B]uffers", })
vim.keymap.set("n", "<leader>sf", pickers.find_files, { desc = "[S]earch [F]iles", })
vim.keymap.set("n", "<leader>sw", pickers.grep_string, { desc = "[S]earch Current [W]ord", })
vim.keymap.set("n", "<leader>sg", pickers.live_grep, { desc = "[S]earch by [G]rep", })
vim.keymap.set("n", "<leader>sr", pickers.resume, { desc = "[S]earch [R]esume", })

vim.keymap.set("n", "<leader>sh", pickers.help_tags, { desc = "[S]earch [H]elp", })
vim.keymap.set("n", "<leader>sm", pickers.man_pages, { desc = "[S]earch [M]anuals", })

vim.keymap.set('n', '<leader><leader>',
  function()
    require('telescope.builtin').buffers({
      sort_mru = true,
      ignore_current_buffer = false
    })
  end,
  { desc = 'Show buffers' }
)

vim.keymap.set('n', 'grl',
  '<cmd>Telescope diagnostics<CR>',
  { desc = '[L]ist diagnostics messages' })

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

vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", {desc="Neogit"})

require('gitsigns').setup{
    signs = {
      add = { text = '+' }, ---@diagnostic disable-line: missing-fields
      change = { text = '~' }, ---@diagnostic disable-line: missing-fields
      delete = { text = '_' }, ---@diagnostic disable-line: missing-fields
      topdelete = { text = '‾' }, ---@diagnostic disable-line: missing-fields
      changedelete = { text = '~' }, ---@diagnostic disable-line: missing-fields
    },
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']g', function()
      if vim.wo.diff then
        vim.cmd.normal({']g', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end, { desc = "[G]it next hunk"})

    map('n', '[g', function()
      if vim.wo.diff then
        vim.cmd.normal({'[g', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end, { desc = "[G]it prev hunk"})

    -- Actions
    map('n', '<leader>gs', gitsigns.stage_hunk, { desc = "[G]it stage hunk"})
    map('n', '<leader>gr', gitsigns.reset_hunk, { desc = "[G]it reset hunk"})

    map('v', '<leader>gs', function()
      gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, { desc = "[G]it stage hunk"})

    map('v', '<leader>gr', function()
      gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, { desc = "[G]it reset hunk"})

    map('n', '<leader>gS', gitsigns.stage_buffer, { desc = "[G]it stage buffer"})
    map('n', '<leader>gR', gitsigns.reset_buffer, { desc = "[G]it reset buffer"})
    map('n', '<leader>gp', gitsigns.preview_hunk, { desc = "[G]it preview hunk"})
    map('n', '<leader>gi', gitsigns.preview_hunk_inline, { desc = "[G]it preview hunk inline"})

    map('n', '<leader>gb', function()
      gitsigns.blame_line({ full = true })
    end, { desc = "[G]it blame line"})

    map('n', '<leader>gd', gitsigns.diffthis, { desc = "[G]it diff this"})

    map('n', '<leader>gD', function()
      gitsigns.diffthis('~')
    end, { desc = "[G]it diff this (~)"})

    map('n', '<leader>gQ', function() gitsigns.setqflist('all') end, { desc = "[G]it show changes (all)"})
    map('n', '<leader>gq', gitsigns.setqflist, { desc = "[G]it show changes"})

    -- Toggles
    map('n', '<leader>gb', gitsigns.toggle_current_line_blame, { desc = "[G]it toggle current line blame"})
    map('n', '<leader>gw', gitsigns.toggle_word_diff, { desc = "[G]it toggle word diff"})

    -- Text object
    map({'o', 'x'}, 'gh', gitsigns.select_hunk, { desc = "[G]it select hunk"})
  end
}

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


-- Debugging
local dap = require("dap")
local function wanted_config(ft)
  -- 1. in-file marker: `dap_default: <name>` in the first 30 lines
  for _, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, 30, false)) do
    local name = line:match('dap_default:%s*(.-)%s*$')
    if name and name ~= '' then return name end
  end
  -- 2. project default from .dap_default
  local root = vim.fs.root(0, { '.dap_default', '.git' })
  if root then
    local f = io.open(root .. '/.dap_default', 'r')
    if f then
      local name = vim.trim(f:read('*l') or '')
      f:close()
      if name ~= '' then return name end
    end
  end
end

local function debug_current()
  -- Session already running → just resume (continue/step past breakpoint)
  if dap.session() then
    dap.continue()
    return
  end

  local ft = vim.bo.filetype
  local wanted = wanted_config(ft)
  if wanted then
    for _, cfg in ipairs(dap.configurations[ft] or {}) do
      if cfg.name == wanted then
        dap.run(cfg)
        return
      end
    end
    vim.notify(('No dap config named %q for %s'):format(wanted, ft), vim.log.levels.WARN)
  end
  dap.continue()  -- no marker, no project default, or no match → picker
end

vim.keymap.set("n", "<F5>", function()
  require('dap-view').open()
  debug_current()
end, {  desc="[C]ontinue" })

vim.keymap.set("n", "<F17>", function() -- Shift-F5
  require('dap-view').close()
  dap.close()
end, {  desc="Stop" })

vim.keymap.set("n", "<F9>", function()
  dap.toggle_breakpoint()
end, { desc = "[T]oggle breakpoint" })

vim.keymap.set("n", "<F10>", function()
  dap.step_over()
end, {  desc="Step [O]ver" })

vim.keymap.set("n", "<F11>", function()
  dap.step_into()
end, {  desc="Step [I]nto" })

vim.keymap.set("n", "<F23>", function() -- Shift-F11
  dap.step_out()
end, {  desc="Step o[U]t" })

local lua_pkg = require("mason-registry").get_package("local-lua-debugger-vscode")
local lua_debug_path = lua_pkg:get_install_path().."/extension"

dap.adapters.lua = {
  type = "executable",
  command = "node",
  args = { lua_debug_path.."/extension/debugAdapter.js" },
  enrich_config = function(config, on_config)
    if not config.extensionPath then
      local c = vim.deepcopy(config)
      c.extensionPath = lua_debug_path
      on_config(c)
    else
      on_config(config)
    end
  end,
}

dap.configurations.lua = {
  {
    name = "Launch file",
    type = "lua",
    request = "launch",
    cwd = "${workspaceFolder}",
    program = function()
      return { lua = "lua", file = vim.fn.expand("%:p") }
    end,
    args = function()
      return {}
    end,
  },
  {
    name = "Launch LOVE",
    type = "lua",
    request = "launch",
    cwd = "${workspaceFolder}",
    program = function()
      return { command = "love" }
    end,
    args = function()
      local dir = vim.fn.expand("%:p:h")
      local main = vim.fs.find({ "main.lua" }, { upward = true, path = dir })[1]
      local root = main and vim.fs.dirname(main) or nil

      return { root }
    end,
  },
}

local js_pkg = require("mason-registry").get_package("js-debug-adapter")
dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = {
      js_pkg:get_install_path() .."/js-debug/src/dapDebugServer.js",
      "${port}",
    },
  },
}

local js_based_languages = { "typescript", "javascript", "typescriptreact" }

for _, language in ipairs(js_based_languages) do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require 'dap.utils'.pick_process,
      cwd = "${workspaceFolder}",
    },
  }
end


local python_pkg = require("mason-registry").get_package("debugpy")

dap.adapters.python = function(cb, config)
  if config.request == "attach" then
    local port = (config.connect or config).port
    cb({
      type = "server",
      host = (config.connect or config).host or "127.0.0.1",
      port = assert(port, "`connect.port` is required for a python attach configuration"),
      options = { source_filetype = "python" },
    })
  else
    cb({
      type = "executable",
      command = python_pkg:get_install_path() .. "/venv/bin/python",
      args = { "-m", "debugpy.adapter" },
      options = { source_filetype = "python" },
    })
  end
end

local function python_path()
  local venv = os.getenv("VIRTUAL_ENV")
  if venv then return venv .. "/bin/python" end
  local cwd = vim.fn.getcwd()
  for _, p in ipairs({ "/.venv/bin/python", "/venv/bin/python" }) do
    if vim.fn.executable(cwd .. p) == 1 then return cwd .. p end
  end
  return "python3"
end
dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    pythonPath = python_path,
    cwd = "${workspaceFolder}",
  },
  {
    type = "python",
    request = "launch",
    name = "Launch file + args",
    program = "${file}",
    args = function()
      return vim.split(vim.fn.input("Arguments: "), " +")
    end,
    pythonPath = python_path,
    cwd = "${workspaceFolder}",
  },
  {
    type = "python",
    request = "launch",
    name = "Launch module",
    module = function() return vim.fn.input("Module: ") end,
    pythonPath = python_path,
    cwd = "${workspaceFolder}",
  },
  {
    type = "python",
    request = "attach",
    name = "Attach (remote debugpy)",
    connect = function()
      return { host = "127.0.0.1", port = tonumber(vim.fn.input("Port [5678]: ")) or 5678 }
    end,
  },
}

-- uncomment to enable automatic plugin updates
-- vim.pack.update()
