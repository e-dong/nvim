return {
	"folke/lazydev.nvim",
	ft = "lua", -- only load on lua files
	config = function()
		require("lazydev").setup({
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		})
	end,
}
