return {
	"lewis6991/gitsigns.nvim",
	config = function()
		-- setup gitsigns with default properties
		local gitsigns = require("gitsigns")
    gitsigns.setup({})

		-- Set a vim motion to <Space> + g + h to preview changes to the file under the cursor in normal mode
		vim.keymap.set("n", "<leader>gh",gitsigns.preview_hunk, { desc = "[H]unk [P]review" })
		vim.keymap.set({"n", "v"}, "<leader>gs", gitsigns.stage_hunk, { desc = "[H]unk [S]tage" })
		vim.keymap.set({"n", "v"}, "<leader>gr", gitsigns.reset_hunk, { desc = "[H]unk [R]eset" })
		vim.keymap.set("n", "]h",
      function()
        gitsigns.nav_hunk('next')
      end,
      { desc = "Next [H]unk" })
		vim.keymap.set("n", "[h",
      function()
        gitsigns.nav_hunk('prev')
      end,
      { desc =  "Previous [H]unk" })
	end,
}
