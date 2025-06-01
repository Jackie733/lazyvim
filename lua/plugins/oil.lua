return {
  "stevearc/oil.nvim",
  enabled = false, -- 禁用oil.nvim，使用neo-tree替代
  -- Optional dependencies
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- For file icons, if you want them
  },
  opts = {
    -- Oil will take over netrw and act as the default file explorer
    default_file_explorer = true,

    -- Key E to open the file explorer
    -- You can bind other keys here or in the `config` function below
    -- For example, to map "-" to open oil.nvim in the current directory's parent
    -- (though "-" is typically used *inside* oil to go to parent)

    -- Columns displayed (see :help oil-columns)
    columns = {
      "icon",
      -- "permissions",
      -- "size",
      -- "mtime",
    },
    -- Buffer options
    buf_options = {
      buflisted = false,
      bufhidden = "hide",
    },
    -- Window options
    win_options = {
      wrap = false,
      signcolumn = "yes:1", -- Show signcolumn for diagnostic markers, adjust if needed
      cursorcolumn = false,
      foldcolumn = "0",
      spell = false,
      list = false,
      conceallevel = 3,
      concealcursor = "nvic",
    },
    -- Oil uses on_attach to define keymaps after the buffer has been sufficiently set up
    -- See :help oil-actions
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["<C-s>"] = "actions.select_vsplit", -- Open in vertical split
      ["<C-h>"] = "actions.select_split",  -- Open in horizontal split (or <C-x>)
      ["<C-t>"] = "actions.select_tab",    -- Open in new tab
      ["<C-p>"] = "actions.preview",       -- Preview file (useful with floating windows)
      ["<C-c>"] = "actions.close",         -- Close oil buffer
      ["<C-l>"] = "actions.refresh",
      ["-"] = "actions.parent",            -- Go to parent directory
      ["_"] = "actions.open_cwd",          -- Open oil in current working directory
      ["`"] = "actions.cd",                -- See :help oil-actions.cd
      ["~"] = "actions.tcd",               -- See :help oil-actions.tcd
      ["gs"] = "actions.change_sort",      -- Change sort order
      ["gx"] = "actions.open_external",    -- Open with system's default app
      ["g."] = "actions.toggle_hidden",    -- Toggle hidden files
      ["g\\"] = "actions.toggle_trash",    -- Toggle display of files in trash (requires trash-cli)
    },
    -- Set to true to respect current directory talent.nvim affects.
    -- respect_cwd = true,
    view_options = {
      -- Show hidden files and directories. By default, .git is not shown.
      show_hidden = false,
      -- This function defines what is considered a "hidden" file
      is_hidden_file = function(name, bufnr)
        return vim.startswith(name, ".")
      end,
      -- This function defines what will never be shown, even when show_hidden is true
      is_always_hidden = function(name, bufnr)
        return name == ".." or name == ".git" -- Always hide ".." (parent dir) and ".git"
      end,
      sort = {
        -- sort order can be "name", "type", "size", "mtime", "extension"
        -- see :help oil-sorting
        { "type", "asc" },
        { "name", "asc" },
      },
    },
    -- Configuration for the floating window in oil.open_float
    float = {
      padding = 2,
      max_width = 0,
      max_height = 0,
      border = "rounded", -- "single", "double", "rounded", "solid", "shadow"
      win_options = {
        winblend = 0, -- Set to a value between 0 and 100 to make the window transparent
      },
      -- This will be called when the float window is opened
      -- You can use it to set additional buffer options specific to floating windows
      on_open = function(win)
      end,
    },
    -- Configuration for the preview window
    preview = {
      -- Max width/height of the preview window
      max_width = 0.9,
      max_height = 0.9,
      -- Whether the preview window is bordered
      border = "rounded",
      win_options = {
        winblend = 0,
      },
    },
    -- Configuration for progress.nvim integration.
    -- progress = {
    --   enable = true,
    --   -- The options to pass to progress.nvim.
    --   -- See :help progress.options
    --   options = {},
    -- },
    -- Skip the confirmation prompt for certain actions
    skip_confirm_for_simple_edits = true,
  },
  config = function(_, opts)
    require("oil").setup(opts)

    -- === Global Keymaps to Open Oil ===
    -- LazyVim's default explorer keymap is often <leader>e or <leader>E
    -- Let's use <leader>e to open oil in the current file's directory (or CWD if no file)
    vim.keymap.set("n", "<leader>e", require("oil").toggle_float, { desc = "Explorer (oil.nvim) toggle float" })

    -- If you prefer a non-floating window for the current directory:
    -- vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>", { desc = "Explorer (oil.nvim) current dir" })

    -- Keymap to open oil at the project root (LazyVim provides a utility for this)
    vim.keymap.set("n", "<leader>E", function()
      local oil = require("oil")
      local root_dir = require("lazyvim.util").root.get()
      if #root_dir > 0 then -- Check if root_dir is not empty
        oil.open_float(root_dir[1]) -- Open float at the first root directory found
      else
        oil.open_float(vim.fn.getcwd()) -- Fallback to current working directory
      end
    end, { desc = "Explorer (oil.nvim) project root (float)" })

    -- If you want '-' to open oil (like some people use for file explorers)
    -- This opens oil in the current working directory.
    -- Note: inside an oil buffer, '-' goes to the parent directory.
    vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc = "Open oil.nvim (float) at CWD" })

    -- You can also make Neovim open oil when you :edit a directory
    -- This is handled by `default_file_explorer = true` in opts.
    -- So, `:e .` or `:edit my_folder/` will use oil.
  end,
}
