return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- use wildfire.nvim for incremental selection instead
      opts.incremental_selection = {
        enable = false,
      }

      opts.context_commentstring = {
        enable_autocmd = false,
      }

      vim.list_extend(opts.ensure_installed, {
        "vue",
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      local tscontext = require("treesitter-context")
      tscontext.setup({
        enable = true,
        max_lines = 5,            -- How many lines the window should span. Values <= 0 mean no limit
        min_window_height = 5,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
        trim_scope = "outer",     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = "cursor",          -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20,     -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
      })
    end,
  },
  {
    "sustech-data/wildfire.nvim",
    event = "VeryLazy",
    vscode = true,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("wildfire").setup({
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          node_decremental = "<BS>",
        },
      })
    end,
  },
}
