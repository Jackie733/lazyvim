return {
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    keys = {
      {
        "<leader>sr",
        function()
          require("spectre").open()
        end,
        desc = "Replace in files (Spectre)",
      },
      {
        "<leader>sp",
        function()
          require("spectre").open_file_search({ select_word = true })
        end,
        desc = "Search on current file",
      },
    },
  },
  {
    "cshuaimin/ssr.nvim",
    keys = {
      -- Search and replace in current buffer
      {
        "<leader>bs", -- [b]uffer [s]tructural [s]earch and [r]eplace
        function()
          require("ssr").open()
        end,
        desc = "Structural Search and Replace",
      },
    },
    opts = {
      min_width = 50,
      min_height = 5,
      max_width = 120,
      max_height = 25,
      keymaps = {
        close = "q",
        next_match = "n",
        prev_match = "N",
        replace_confirm = "<cr>",
        replace_all = "<leader><cr>",
      },
    },
  },
}
