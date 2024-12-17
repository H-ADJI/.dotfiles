return {
  { "ellisonleao/gruvbox.nvim" },
  { "tomasiser/vim-code-dark" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  }
}
