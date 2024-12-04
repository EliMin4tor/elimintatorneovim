return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")
        lspconfig.omnisharp.setup({
            cmd = { "dotnet", "/home/archi/omnisharp/OmniSharp.dll" },
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })
    end,
}
