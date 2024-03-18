-- TODO: 完善code_runner
return {
  "CRAG666/code_runner.nvim",
  -- name = "code_runner",
  dev = true,
  keys = {
    {
      "<leader>r",
      function()
        require("code_runner").run_code()
      end,
      desc = "Execute Code",
    },
  },
  opts = {
    mode = "better_term",
    better_term = {
      number = 1,
    },
    filetype = {
      v = "v run",
      tex = function(...)
        latexCompileOptions = {
          "Single",
          "Project",
        }
        local preview = require("code_runner.hooks.preview_pdf")
        local cr_au = require("code_runner.hooks.autocmd")
        vim.ui.select(latexCompileOptions, {
          prompt = "Select compile mode:",
        }, function(opt, _)
          if opt then
            if opt == "Single" then
              preview.run({
                command = "tectonic",
                args = { "$fileName", "--keep-logs", "-o", "/tmp" },
                preview_cmd = preview_cmd,
                overwrite_output = "/tmp",
              })
            elseif opt == "Project" then
              cr_au.stop_job()
              os.execute("tectonic -X build --keep-logs --open &> /dev/null &")
              local fn = function()
                os.execute("tectonic -X build --keep-logs &> /dev/null &")
              end
              cr_au.create_au_write(fn)
            end
          else
            local warn = require("utils").warn
            warn("Not Preview", "Preview")
          end
        end)
      end,
      javascript = "node",
      python = "python -u '$dir/$fileName'",
      sh = "bash",
      typescript = "deno run",
      typescriptreact = "yarn dev$end",
      rust = "cd $dir && rustc $fileName && $dir$fileNameWithoutExt",
    },
    project_path = vim.fn.expand("~/.config/nvim/project_manager.json"),
  },
}
