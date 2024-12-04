return {
    -- add gruvbox
    { "ellisonleao/gruvbox.nvim" },
    { "gbprod/nord.nvim" },

    -- Configure LazyVim to load gruvbox
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "nord",
        },
    }
}
