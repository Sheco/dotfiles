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

