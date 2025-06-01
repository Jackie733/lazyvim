return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["c"] = { "clang_format" },
        ["cpp"] = { "clang_format" },
        ["c++"] = { "clang_format" },
        ["h"] = { "clang_format" },
        ["hpp"] = { "clang_format" },
      },
      formatters = {
        clang_format = {
          -- 确保使用项目根目录的.clang-format文件
          args = { "--style=file", "--fallback-style=LLVM" },
        },
      },
      -- 保存时自动格式化
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },
}
