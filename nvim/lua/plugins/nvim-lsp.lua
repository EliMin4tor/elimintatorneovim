return {
	 {
	    "hrsh7th/nvim-cmp",
	    dependencies = {
	      "hrsh7th/cmp-nvim-lsp",
	      "hrsh7th/cmp-buffer",
	      "hrsh7th/vim-vsnip",
	      "neovim/nvim-lspconfig",
	      "mason-org/mason.nvim",
	      "mason-org/mason-lspconfig.nvim",
	      -- "seblyng/roslyn.nvim",
	    },
	    config = function()
	      local cmp = require("cmp")
	      local lspconfig = require("lspconfig")
	      local cmp_nvim_lsp = require("cmp_nvim_lsp")
	      local capabilities = cmp_nvim_lsp.default_capabilities()
	      -- Setup roslyn lspconfig with capabilities
	      lspconfig.roslyn.setup({
            capabilities = capabilities,
	      })
	      -- Setup Lua LS as example
	      lspconfig.lua_ls.setup({
            capabilities = capabilities,
            on_attach = function(client, bufnr)
              vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to Definition" })
            end,
	      })

	      -- Setup typescript ls example
	      lspconfig.ts_ls.setup({
            capabilities = capabilities,
	      })

            vim.g.vsnip_filetypes = {
              cs = { "csharp" },
            }
	      -- Setup cmp
	      cmp.setup({
                      mapping = cmp.mapping.preset.insert({ ["<c-space>"] = cmp.mapping.complete(), ["<cr>"] = cmp.mapping.confirm({ select = true }), }),
                      snippet = { expand = function(args) vim.fn["vsnip#anonymous"](args.body) end, },
                      sources = cmp.config.sources({
                          { name = "nvim_lsp" },
                          { name = "vsnip" },
                          { name = "buffer" },
                        }),
	      })
	      -- Global keymaps example
	      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Symbol" })
	    end,
	  },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/vim-vsnip" },
    { "rafamadriz/friendly-snippets" },
	{ "neovim/nvim-lspconfig",
	  dependencies = {
	    "mason.nvim",
	     "mason-org/mason-lspconfig.nvim",
	      "hrsh7th/cmp-nvim-lsp", -- Optional: for completion
	  },
	    config = function()
	      local lspconfig = require "lspconfig"
	      local cmp_nvim_lsp = require "cmp_nvim_lsp"

	      -- Example: Setting up Lua language server
	      lspconfig.lua_ls.setup {
		on_attach = function(client, bufnr)
		  -- ... (keymaps and other configurations) ...
		  -- Example keymap
		  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { buffer = bufnr, desc = "Go to Definition" })
		end,
		settings = {
		  Lua = {
		    -- ... (Lua language server settings) ...
		  }
		}
	      }

	      -- Example: Setting up Typescript language server
	      lspconfig.ts_ls.setup {
		on_attach = function(client, bufnr)
		  -- ... (keymaps and other configurations) ...
		end,
	      }
	       -- Example of global keymaps
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, {desc = "Hover Symbol"})
	    end,
	},
  {
    -- TODO this adds rosli, -idk if true - cmp config is missing
    "seblyng/roslyn.nvim",
      event = "VeryLazy",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
   	opts = {
        settings = {
              ["csharp|inlay_hints"] = {
                csharp_enable_inlay_hints_for_implicit_object_creation = false,
                csharp_enable_inlay_hints_for_implicit_variable_types = false,
                csharp_enable_inlay_hints_for_lambda_parameter_types = false,
                csharp_enable_inlay_hints_for_types = false,
                dotnet_enable_inlay_hints_for_indexer_parameters = true,
                dotnet_enable_inlay_hints_for_literal_parameters = false,
                dotnet_enable_inlay_hints_for_object_creation_parameters = false,
                dotnet_enable_inlay_hints_for_other_parameters = false,
                dotnet_enable_inlay_hints_for_parameters = true,
                dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
                dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
                dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
              },
              ["csharp|code_lens"] = {
                dotnet_enable_references_code_lens = false,
              },
	     },
    },
  },
}

