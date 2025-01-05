return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    enabled = true,
    opts = function(_, opts)
      opts.root_dir = require("null-ls.utils").root_pattern(".git")
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        ui = {
          code_action = "💡",
        },
        lightbulb = {
          sign = false,
          virtual_text = true,
          enable = true,
        },
        symbols_in_winbar = { enable = true },
        implement = {
          enable = true,
          sign = false,
          virtual_text = true,
        },
      })
      -- vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
      -- vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>")
      vim.keymap.set("n", "<leader>ol", "<cmd>Lspsaga outline<CR>")
      vim.keymap.set("n", "gpd", "<cmd>Lspsaga finder<CR>")
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
  },
}
