-- Add Zeek LSP configuration
-- for vim 0.10
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

-- for vim 0.11
-- vim.lsp.config['zeek'] = {
--     cmd = { "zeek-language-server"},
--     filetypes = { "zeek" },
--     root_markers = { '.git' },
--     settings = {},
--
-- }
-- vim.lsp.enable('zeek')

return {
  { "echasnovski/mini.indentscope", enabled = false, },
	{ "folke/noice.nvim", enabled = false },
	{ "echasnovski/mini.pairs", enabled = false },
	{ "zeek/vim-zeek", enabled = true; },
	{ "folke/flash.nvim", enabled = false },
	{ "windwp/nvim-ts-autotag", enabled = false },
}

