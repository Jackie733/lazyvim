return {
  {
    "catgoose/nvim-colorizer.lua",
    event = "VeryLazy",
    enabled = true,
    opts = {
      filetypes = { "*" },
      user_default_options = {
        names = false, -- "Name" codes like Blue or blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = true, -- 0xAARRGGBB hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes for `mode`: foreground, background,  virtualtext
        mode = "virtualtext", -- Set the display mode.
        -- Available methods are false / true / "normal" / "lsp" / "both"
        -- True is same as normal
        tailwind = true,
        virtualtext = "■",
      },
      -- all the sub-options of filetypes apply to buftypes
      buftypes = {},
    },
  },
  {
    "uga-rosa/ccc.nvim",
    cmd = { "CccPick", "CccConvert", "CccHighlighterEnable" },
    event = "FileType typescript,typescriptreact,javascript,javascriptreact,json,yaml",
    keys = {
      { "<leader>zc", "<cmd>CccConvert<cr>", desc = "Convert color" },
      { "<leader>zp", "<cmd>CccPick<cr>", desc = "Pick Color" },
    },
    opts = {
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
    },
    config = function(_, opts)
      require("ccc").setup(opts)
      if opts.highlighter and opts.highlighter.auto_enable then
        vim.cmd.CccHighlighterEnable()
      end
    end,
  },
}
