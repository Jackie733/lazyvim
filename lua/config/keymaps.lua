-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-j>", "6j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "6k", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>rr", function()
  local filename = vim.fn.expand("%:p")
  local filebase = vim.fn.fnamemodify(filename, ":t:r")

  local compile_and_run_cmd = string.format(
    ":split | :term g++ -std=c++14 -Wshadow -Wall -o %s %s -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && ./%s",
    filebase,
    filename,
    filebase
  )

  vim.cmd(compile_and_run_cmd)
end, { noremap = true, silent = true, desc = "runCpp" })
