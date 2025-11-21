return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		require("nvim-tree").setup({
			view = {
				width = 35,
				relativenumber = false,
			},
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			git = {
				ignore = false,
			},
		})
		vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
		vim.keymap.set(
		"n",
			"<leader>ef",
			"<cmd>NvimTreeFindFile<CR>",
			{ desc = "Find current file in file explorer" }
		)
		vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
		vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
    -- highlights
    -- vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = 'None'})
    -- vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = 'None'})
    -- vim.api.nvim_set_hl(0, "NvimTreeRootFolder", { fg = "#cba6f7" })
    -- vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#89b4fa" })
    -- vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#89b4fa" })
    -- vim.api.nvim_set_hl(0, "NvimTreeExecFile", { fg = "#cdd6f4" })
    -- vim.api.nvim_set_hl(0, "NvimTreeImageFile", { fg = "#cdd6f4" })
    -- vim.api.nvim_set_hl(0, "NvimTreeSpecialFile", { fg = "#cdd6f4" })
    vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { fg = "#89b4fa" })

    -- transparent background
	end,
}
