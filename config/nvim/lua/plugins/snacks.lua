return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      --replace_netrw = true,
    },
    statuscolumn = { enabled = true },
  },
  keys = {
    {
      "-",
      function()
        Snacks.explorer({ cwd = LazyVim.root() })
      end,
      desc = "Explorer Snacks (root dir)",
    },
  }
}
