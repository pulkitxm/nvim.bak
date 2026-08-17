local function open_explorer()
  if #Snacks.picker.get({ source = "explorer" }) == 0 then
    Snacks.explorer({ focus = false })
  end
end

return {
  "folke/snacks.nvim",
  opts = {
    indent = { enabled = false },
    picker = {
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
        },
      },
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        vim.schedule(function()
          if vim.bo.filetype == "snacks_dashboard" then
            return
          end
          open_explorer()
        end)
      end,
    })
    vim.api.nvim_create_autocmd("User", {
      pattern = "PersistenceLoadPost",
      callback = function()
        vim.schedule(open_explorer)
      end,
    })
  end,
}
