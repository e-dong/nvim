return {
	"sindrets/diffview.nvim",
	config = function()
		require("diffview").setup()
		vim.keymap.set("n", "<leader>dv", "<cmd>DiffviewOpen<CR>", { desc = "Opens git diff view" })
		vim.keymap.set("n", "<leader>dx", "<cmd>DiffviewClose<CR>", { desc = "Closes git diff view" })
		vim.keymap.set("n", "<leader>dh", "<cmd>DiffviewFileHistory<CR>", { desc = "Opens git diff file history" })
		vim.keymap.set("n", "<leader>dr", "<cmd>DiffviewRefresh<CR>", { desc = "Refreshes diff view" })

    -- highlights for transparency
    local groups = {
      "DiffChange",
      "DiffChanged",
      "diffAdded",
      "diffRemoved"
    }

    for _, group in ipairs(groups) do
        local hl = vim.api.nvim_get_hl(0, {name = group})
        local fg = hl.fg
        vim.api.nvim_set_hl(0, group, { bg = "none", fg = fg })
    end
	end,
}
