return {
  -- add symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    opts = {
      -- add your options that should be passed to the setup() function here
      position = "right",
      width = 20,
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
  {
    "rmagatti/goto-preview",
    event = "LspAttach",
    enabled = false,
    config = function()
      require("goto-preview").setup({
        width = 120, -- Width of the floating window
        height = 15, -- Height of the floating window
        border = require("util.opts").float.border, -- Border characters of the floating window
        default_mappings = false, -- Bind default mappings
        debug = false, -- Print debug information
        resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
        post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
        post_close_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
        references = { -- Configure the telescope UI for slowing the references cycling window.
          telescope = require("telescope.themes").get_dropdown({ hide_preview = false }),
        },
        -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
        focus_on_open = true, -- Focus the floating window when opening it.
        dismiss_on_move = false, -- Dismiss the floating window when moving the cursor.
        force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
        bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
        stack_floating_preview_windows = true, -- Whether to nest floating windows
        preview_window_title = { enable = true, position = "left" }, -- Whether to set the preview window title as the filename
      })
      local utils = require("util.utils")

      local set_keymap = utils.set_n_keymap

      set_keymap("gp", "<nop>", "+~Goto preview")
      set_keymap("gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "Go to definition preview")
      set_keymap(
        "gpt",
        "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
        "Go to type definition preview"
      )
      set_keymap(
        "gpi",
        "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
        "Go to implementation preview"
      )
      set_keymap("gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", "Close all preview windows")
      set_keymap("gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", "Go to references preview")
    end,
  },
  {
    "js-everts/cmp-tailwind-colors",
    event = "LspAttach",
    config = function()
      require("cmp-tailwind-colors").setup({
        enable_alpha = true, -- requires pumblend > 0.
        format = function(itemColor)
          return {
            fg = itemColor,
            bg = nil, -- or nil if you dont want a background color
            text = "■", -- or use an icon
          }
        end,
      })
    end,
  },
  { "roobert/tailwindcss-colorizer-cmp.nvim", enabled = false },
}
