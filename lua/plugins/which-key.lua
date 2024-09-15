return {
	"folke/which-key.nvim",
	event = "VimEnter",
	config = function()
		-- gain access to the which key plugin
		local which_key = require("which-key")

		-- call the setup function with default properties
		which_key.setup({})

		-- Register prefixes for the different key mappings we have setup previously
		which_key.add({
			{ "<leader>t", group = "[T]ab" },
			{ "<leader>s", group = "[S]plit" },
			{ "<leader>J", group = "[J]ava" },
			{ "<leader>c", group = "[C]ode" },
			{ "<leader>d", group = "[D]ebug" },
			{ "<leader>e", group = "[E]xplorer" },
			{ "<leader>f", group = "[F]ind" },
			{ "<leader>G", group = "[G]it" },
			{ "<leader>S", group = "[S]ession" },
		})
	end,
}
