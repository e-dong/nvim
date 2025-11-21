return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  priority = 1000,
	config = function()
    local custom_tk_theme = require'lualine.themes.tokyonight'
    local colors = require("tokyonight.colors.night")
    custom_tk_theme.normal.a = { bg = "none", fg = colors.blue }
    custom_tk_theme.normal.b.bg = "none"
    custom_tk_theme.normal.c.bg = "none"
    custom_tk_theme.inactive.a.bg = "none"
    custom_tk_theme.inactive.b.bg = "none"
    custom_tk_theme.inactive.c.bg = "none"

    require("lualine").setup({
      options = {
        theme = custom_tk_theme,
        icons_enabled = true,
      },
      sections = {
        lualine_a = {
          {
            "filename",
            path = 1,
          },
        },
      },
    })
	end,
}
