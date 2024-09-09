return {
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "github_dark_dimmed",
      colorscheme = "nightfox",
    },
  },
  {
    "projekt0n/github-nvim-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").setup({
        -- ...
      })

      -- vim.cmd("colorscheme github_dark_dimmed")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      options = {
        -- use terminal background
        transparent = true,
      },
    },
  },
}
