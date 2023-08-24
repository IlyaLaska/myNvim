return {
  'ThePrimeagen/harpoon',
  lazy = true,
  dependencies = {'nvim-lua/plenary.nvim'},
  keys = {
    {"<leader>q", function() require("harpoon.mark").add_file() end, desc = "Add file to Harpoon list"},
    {"<leader>w", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Open Harpoon list"},

    {"<leader>Q", function() require("harpoon.ui").nav_prev() end, desc = "Go to next file in Harpoon list"},
    {"<leader>W", function() require("harpoon.ui").nav_next() end, desc = "Go to prev file in Harpoon list"},
    
    {"<leader>1", function() require("harpoon.ui").nav_file(1) end, desc = "Go to file #1 in Harpoon list"},
    {"<leader>2", function() require("harpoon.ui").nav_file(2) end, desc = "Go to file #2 in Harpoon list"},
    {"<leader>3", function() require("harpoon.ui").nav_file(3) end, desc = "Go to file #3 in Harpoon list"},
    {"<leader>4", function() require("harpoon.ui").nav_file(4) end, desc = "Go to file #4 in Harpoon list"},
    {"<leader>5", function() require("harpoon.ui").nav_file(5) end, desc = "Go to file #5 in Harpoon list"},
    {"<leader>6", function() require("harpoon.ui").nav_file(6) end, desc = "Go to file #6 in Harpoon list"},
    {"<leader>7", function() require("harpoon.ui").nav_file(7) end, desc = "Go to file #7 in Harpoon list"},
    {"<leader>8", function() require("harpoon.ui").nav_file(8) end, desc = "Go to file #8 in Harpoon list"},
    {"<leader>9", function() require("harpoon.ui").nav_file(9) end, desc = "Go to file #9 in Harpoon list"},
  },
  config = function()
    require("telescope").load_extension('harpoon')  -- Telescope support

    -- Copied from defaults
    require('harpoon').setup(
      {
        global_settings = {
          -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
          save_on_toggle = false,

          -- saves the harpoon file upon every change. disabling is unrecommended.
          save_on_change = true,

          -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
          enter_on_sendcmd = false,

          -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
          tmux_autoclose_windows = false,

          -- filetypes that you want to prevent from adding to the harpoon list menu.
          excluded_filetypes = { "harpoon" },

          -- set marks specific to each git branch inside git repository
          mark_branch = false,

          -- enable tabline with harpoon marks
          tabline = false,
          tabline_prefix = "   ",
          tabline_suffix = "   ",
        },
        menu = {
          -- width = vim.api.nvim_win_get_width(0) - 30,  -- set width based on window size
          width = 100
        }
      }
    )
  end
}
