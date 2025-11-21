local handle_telescope_highlights = function(highlights, colors)
	highlights.TelescopeNormal = {
		bg = "none",
		fg = colors.fg_light,
	}
	highlights.TelescopeBorder = {
		bg = "none",
		-- fg = colors.fg_light,
		fg = colors.blue,
	}
	highlights.TelescopePromptNormal = {
		bg = "none",
	}
	highlights.TelescopePromptBorder = {
		bg = "none",
		-- fg = colors.fg_light,
		fg = colors.blue,
	}
	highlights.TelescopePromptTitle = {
		bg = "none",
		fg = colors.fg_light,
	}
	highlights.TelescopePreviewTitle = {
		bg = "none",
		fg = colors.fg_light,
	}
	highlights.TelescopeResultsTitle = {
		bg = "none",
		fg = colors.white,
	}
  highlights.TeleScopePromptCounter = {
    fg = colors.blue
  }
end

local handle_tree_highlights = function(highlights, colors)
	highlights.NvimTreeNormal = {
		bg = "none",
	}
	highlights.NvimTreeNormalNC = {
		bg = "none",
	}
	-- highlights.NvimTreeWinSeparator = {
	-- 	bg = "none",
	--    fg = colors.blue
	-- }
  -- highlights.NvimTreeCursorLine = {
  --   guibg = "none",
  -- }
end

local handle_general_highlights = function(highlights, colors)
	highlights.Normal = { bg = "none" }
	highlights.NormalNC = { bg = "none" }
	highlights.NormalFloat = { bg = "none" }
	highlights.FloatBorder = { bg = "none" }
	highlights.Pmenu = { bg = "none" }
	highlights.SignColumn = { bg = "none" }
	highlights.LineNrAbove = { fg = colors.white }
	highlights.LineNrBelow = { fg = colors.white }
	highlights.WinSeparator = { bg = "none", fg = colors.blue }
  highlights.StatusLine = { bg = "none" }
  highlights.StatusLineNC = { bg = "none" }
  highlights.CursorLine = { bg = "none" }
  highlights.LineNr = { bg = "none", fg = colors.blue }
  highlights.TabLineFill = { bg = "none" }
  highlights.TabLine = { bg = "none" }

end

return {
	"folke/tokyonight.nvim",
  lazy = false,
  priority = 1,
	config = function()
		require("tokyonight").setup({
      transparent = true,
      style = "night",
			on_highlights = function(highlights, colors)
				handle_general_highlights(highlights, colors)
				handle_tree_highlights(highlights, colors)
				handle_telescope_highlights(highlights, colors)
			end,
		})
		vim.cmd([[colorscheme tokyonight]])
	end,
}
