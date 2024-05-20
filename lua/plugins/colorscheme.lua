return {
  -- {
  --   "AlexvZyl/nordic.nvim",
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require("nordic").load()
  --   end,
  -- },
  -- {
  --   "rmehri01/onenord.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("onenord").load()
  --   end,
  -- },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
}
