return {
    { 
        "neovim/nvim-lspconfig",
	    dependencies = {
	      "saghen/blink.cmp",
	      "seblyng/roslyn.nvim",
	    },
	    config = function()
	      local lspconfig = require("lspconfig")
	      local capabilities = require('blink.cmp').get_lsp_capabilities()
	      -- Setup roslyn lspconfig with capabilities
	      lspconfig.roslyn.setup({ capabilities = capabilities,
            on_attach = function()
                print("This will run when the server attaches!")
            end,
            settings = {
                ["csharp|inlay_hints"] = {
                    csharp_enable_inlay_hints_for_implicit_object_creation = true,
                    csharp_enable_inlay_hints_for_implicit_variable_types = true,
                },
                ["csharp|code_lens"] = {
                    dotnet_enable_references_code_lens = true,
                },
            },
          })
	      lspconfig.lua_ls.setup({
            capabilities = capabilities,
            on_attach = function(client, bufnr)
              vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to Definition" })
            end,
	      })
	      lspconfig.ts_ls.setup({ capabilities = capabilities, })

          vim.g.vsnip_filetypes = { cs = { "csharp" }, }
	      -- Global keymaps example
	      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Symbol" })
	    end,
    },
    {
        "seblyng/roslyn.nvim",
        opts = {
            filewatching = "auto",
            choose_target = nil,
            ignore_target = nil,
            broad_search = false,
            lock_target = false,
            silent = false,
        }
    }
}
