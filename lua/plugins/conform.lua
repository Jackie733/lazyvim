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
        ["rust"] = { "rustfmt" },
        ["toml"] = { "taplo" },
      },
      formatters = {
        clang_format = {
          -- 确保使用项目根目录的.clang-format文件
          args = { "--style=file", "--fallback-style=LLVM" },
        },
        rustfmt = {
          -- 使用项目的 rustfmt.toml 配置（如果存在）
          command = "rustfmt",
          args = { "--edition", "2021" },
        },
        taplo = {
          -- TOML 格式化工具
          command = "taplo",
          args = { "format", "-" },
        },
      },
    },
  },
}
