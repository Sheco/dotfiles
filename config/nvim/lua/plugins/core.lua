

local configs = require("lspconfig.configs")
local lspconfig = require("lspconfig")

-- Add Zeek LSP configuration
configs['zeek'] =  {
  default_config = {
    cmd = { "zeek-language-server"},
    filetypes = { "zeek" },
    root_dir = lspconfig.util.find_git_ancestor,
    settings = {},
  }
}
lspconfig.zeek.setup{}

return {
  { "echasnovski/mini.indentscope", enabled = false, },
	{ "folke/noice.nvim", enabled = false },
	{ "echasnovski/mini.pairs", enabled = false },
	{ "zeek/vim-zeek", enabled = true; },
	{ "folke/flash.nvim", enabled = false },
	{ "windwp/nvim-ts-autotag", enabled = false },
}

