return {
  {
    "mason-org/mason.nvim",
    version = "^1.0.0",
    dependencies = {},
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "jsonls",
          "html",
          "cssls",
        },
        automatic_enable = true,
      })
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    version = "^1.0.0",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
  },
}
