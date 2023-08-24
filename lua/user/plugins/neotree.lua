return {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = true,
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",      -- UI lib for nvim
  },
  cmd = "Neotree",
  keys = {
    { "<leader>e", "<cmd>Neotree toggle left<CR>",  desc = "Open Neotree on the left side" },
    { "<leader>E", "<cmd>Neotree toggle float<CR>", desc = "Open Neotree in float mode" },
  },
  config = function()
    require("neo-tree").setup({
      window = {
        mappings = {
          ["L"] = "focus_preview",
          ["l"] = "open",
          ["h"] = "close_node",
        },
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
      },
    })
  end,
}
