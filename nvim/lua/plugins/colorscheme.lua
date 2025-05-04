return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nord").setup({
        transparent = false, -- Enable this to disable setting the background color
      })
      vim.cmd.colorscheme("nord")
    end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    -- opts = {
    --   colorscheme = "nord",
    -- },
  },
}
