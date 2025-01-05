return {
  "nvim-telescope/telescope-file-browser.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },

  keys = {

    {
      "R",
      ":Telescope file_browser path=%:p:h=%:p:h<cr>",
      "File Browser",
    },
  },
  config = function()
    require("telescope").load_extension("file_browser")
  end,
}
