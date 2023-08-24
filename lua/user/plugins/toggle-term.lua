return {
  'akinsho/toggleterm.nvim',
  version = "*",
  lazy = true, 
  cmd = "ToggleTerm",
  keys = {[[<C-\>]]},
  config = function()
    require("toggleterm").setup{
      open_mapping = [[<C-\>]],
      direction = 'float',
    }
  end
}
