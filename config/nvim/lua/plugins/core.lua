
local configs = require("lspconfig.configs")
local lspconfig = require("lspconfig")

-- Add Zeek LSP configuration
configs['zeek'] =  {
  default_config = {
    cmd = { "zeek-language-server"},
    filetypes = { "zeek" }, -- Recognize .zeek files
    root_dir = function(fname)
      return lspconfig.util.find_git_ancestor(fname)
    end,
    settings = {},
  }
}
lspconfig.zeek.setup{}

return {
	{ "echasnovski/mini.indentscope", enabled = false, },
	{ "lukas-reineke/indent-blankline.nvim", enabled = false, },
	{ "folke/noice.nvim", enabled = false },
	{ "echasnovski/mini.pairs", enabled = false },
	{ "zeek/vim-zeek", enabled = true; },
	{ "folke/flash.nvim", enabled = false },
	{ "windwp/nvim-ts-autotag", enabled = false },
	{
		"nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = false },
		}
	}
}

