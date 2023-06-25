return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
    keys = {
      {
        [[<C-\>]],
      },
      {
        "<leader>0",
        "<Cmd>2ToggleTerm<Cr>",
        desc = "Terminal #2",
      },
    },
    cmd = { "ToggleTerm", "TermExec" },
    opts = {
      open_mapping = [[<C-\>]],
      direction = "float",
      shade_filetypes = {},
      shade_terminals = false,
      shading_factor = 0.3,
      hide_numbers = true,
      insert_mappings = true,
      terminal_mappings = true,
      start_in_insert = true,
      close_on_exit = true,
      winbar = {
        enable = false,
        name_formatter = function(term)
          return term.name
        end,
      },
    },
  },
}
