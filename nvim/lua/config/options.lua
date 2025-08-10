vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

vim.g.lazyvim_check_order = false
vim.g.lazyvim_picker = "snacks"
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.vsnip_snippet_dir = vim.fn.stdpath("data") .. "/lazy/friendly-snippets/snippets"

vim.opt.expandtab = true    -- Use spaces instead of tabs
vim.opt.number = true       -- Show line numbers
vim.opt.scrolloff = 999
vim.opt.shiftwidth = 4      -- Shift 4 spaces when tabbing
vim.opt.tabstop = 4         -- 1 tab == 4 spaces
vim.opt.termguicolors = true
