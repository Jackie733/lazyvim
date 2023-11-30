return {
  -- "rcarriga/nvim-notify",
  -- config = function()
  --   local banned_messages = { "No information available" }
  --   vim.notify = function(msg, ...)
  --     for _, banned in ipairs(banned_messages) do
  --       if msg == banned then
  --         return
  --       end
  --     end
  --     return require("notify")(msg, ...)
  --   end
  -- end,
  "folke/noice.nvim",
  opts = function(_, opts)
    table.insert(opts.routes, {
      filter = {
        event = "notify",
        find = "No information available",
      },
      opts = { skip = true },
    })
  end,
}
