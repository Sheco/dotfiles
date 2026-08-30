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


