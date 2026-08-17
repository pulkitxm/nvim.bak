local function mute_icons()
  local shades = { "Azure", "Blue", "Cyan", "Green", "Grey", "Orange", "Purple", "Red", "Yellow" }
  for _, shade in ipairs(shades) do
    vim.api.nvim_set_hl(0, "MiniIcons" .. shade, { fg = "#7d8590" })
  end
end

return {
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    priority = 1000,
    init = function()
      vim.api.nvim_create_autocmd("ColorScheme", { callback = mute_icons })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "github_dark_default",
    },
  },
}
