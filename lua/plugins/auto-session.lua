return {
  'rmagatti/auto-session',
  lazy = false,
  dependencies = {
    'nvim-telescope/telescope.nvim', -- Only needed if you want to use session lens
  },
  config = function ()
    require("auto-session").setup({
      auto_restore = false,
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    })

    -- local keymap = vim.keymap

    -- keymap.set("n", "<leader>
  end
}
