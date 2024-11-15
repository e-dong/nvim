return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          -- LSP
          "bash-language-server",
          "lua-language-server",
          "pyright",
          "ruff-lsp",
          "ruff",
          "jdtls",
          -- Debug and Test Utils
          "java-debug-adapter",
          "java-test",
          -- linter and formatters
         "stylua",
         "prettier",
         "google-java-format",
         "black"
        }
      })
    end
  },
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mfussenegger/nvim-jdtls",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- get access to the lspconfig plugins functions
			local lspconfig = require("lspconfig")

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- setup bash language server
      lspconfig.bashls.setup({
        capabilities = capabilities,
      })

			-- setup the lua language server
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

      -- setup the python language server
      lspconfig.pyright.setup({
        capabilities = capabilities,
        settings = {
          pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              -- Ignore all files for analysis to exclusively use Ruff for linting
              ignore = { '*' },
            },
          },
        },
      })

      local on_attach = function(client, bufnr)
        if client.name == 'ruff_lsp' then
          -- Disable hover in favor of Pyright
          client.server_capabilities.hoverProvider = false
        end
      end

      lspconfig.ruff_lsp.setup({
        on_attach = on_attach,
      })


      -- Set vim motion for <Space> + c + h to show code documentation about the code the cursor is currently over if available
      vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "[C]ode [H]over Documentation" })
      vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "[C]ode [H]over Documentation" })

      -- Set vim motion for <Space> + c + d to go where the code/variable under the cursor was defined
      vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "[C]ode Goto [D]efinition" })
      -- Set vim motion for <Space> + c + a for display code action suggestions for code diagnostics in both normal and visual mode
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
      -- Set vim motion for <Space> + c + r to display references to the code under the cursor
      vim.keymap.set(
      "n",
      "<leader>cr",
      require("telescope.builtin").lsp_references,
      { desc = "[C]ode Goto [R]eferences" }
      )
      -- Set vim motion for <Space> + c + i to display implementations to the code under the cursor
      vim.keymap.set(
      "n",
      "<leader>ci",
      require("telescope.builtin").lsp_implementations,
      { desc = "[C]ode Goto [I]mplementations" }
      )
      -- Set a vim motion for <Space> + c + <Shift>R to smartly rename the code under the cursor
      vim.keymap.set("n", "<leader>cR", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
      -- Set a vim motion for <Space> + c + <Shift>D to go to where the code/object was declared in the project (class file)
      vim.keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "[C]ode Goto [D]eclaration" })
    end,
  },
}
