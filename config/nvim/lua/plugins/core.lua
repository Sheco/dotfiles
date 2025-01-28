-- Add Zeek LSP configuration
require('lspconfig.configs').zeek =  {
  default_config = {
    cmd = { "zeek-language-server"},
    filetypes = { "zeek" },
    root_dir = function(fname)
      return vim.fs.dirname(vim.fs.find({ '.git' }, { path = fname, upward = true })[1])
    end,
    settings = {},
  }
}
require('lspconfig').zeek.setup{}

return {
  { "echasnovski/mini.indentscope", enabled = false, },
	{ "folke/noice.nvim", enabled = false },
	{ "echasnovski/mini.pairs", enabled = false },
	{ "zeek/vim-zeek", enabled = true; },
	{ "folke/flash.nvim", enabled = false },
	{ "windwp/nvim-ts-autotag", enabled = false },
}

