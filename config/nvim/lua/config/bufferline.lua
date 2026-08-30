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

