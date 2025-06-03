return {
  {
    "mason-org/mason.nvim",
    version = "^1.0.0",
    dependencies = {},
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    version = "^1.0.0",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mason-org/mason.nvim",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "eslint",
          "jsonls",
          "html",
          "cssls",
          "clangd",
          "rust_analyzer",
        },
        automatic_enable = true,
      })
    end,
  },
}
