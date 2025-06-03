-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- C/C++ 文件类型配置
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "h", "hpp" },
  callback = function()
    -- 启用自动格式化
    vim.b.autoformat = true

    -- 设置缩进为4个空格
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = true

    -- 设置文本宽度
    vim.opt_local.textwidth = 100

    -- 启用自动缩进
    vim.opt_local.autoindent = true
    vim.opt_local.smartindent = true

    -- C语言特定的缩进选项
    vim.opt_local.cindent = true
  end,
})

-- Rust 文件类型配置
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "rust" },
  callback = function()
    -- 启用自动格式化
    vim.b.autoformat = true

    -- 设置缩进为4个空格（Rust 标准）
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = true

    -- 设置文本宽度（Rust 推荐 100 字符）
    vim.opt_local.textwidth = 100

    -- 启用自动缩进
    vim.opt_local.autoindent = true
    vim.opt_local.smartindent = true
  end,
})

-- TOML 文件类型配置（包括 cargo.toml）
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "toml" },
  callback = function()
    -- 启用自动格式化
    vim.b.autoformat = true

    -- 设置缩进为2个空格（TOML 常用）
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true

    -- 启用自动缩进
    vim.opt_local.autoindent = true
    vim.opt_local.smartindent = true
  end,
})

-- 确保在保存时应用格式化
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.c", "*.cpp", "*.h", "*.hpp" },
  callback = function()
    -- 如果启用了自动格式化，则在保存前格式化
    if vim.b.autoformat then
      vim.lsp.buf.format({ async = false })
    end
  end,
})

-- Rust 和 TOML 保存时自动格式化
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.rs", "*.toml" },
  callback = function()
    -- 如果启用了自动格式化，则在保存前格式化
    if vim.b.autoformat then
      -- 优先使用 conform.nvim 格式化（如果可用）
      local conform_ok, conform = pcall(require, "conform")
      if conform_ok then
        conform.format({
          bufnr = vim.api.nvim_get_current_buf(),
          async = false,
          timeout_ms = 3000,
        })
      else
        -- 回退到 LSP 格式化（对于 Rust 文件）
        if vim.bo.filetype == "rust" then
          vim.lsp.buf.format({ async = false })
        end
      end
    end
  end,
})
