return {
  'nvim-telescope/telescope.nvim',
  -- tag = '0.1.2',
  branch = 'master',
  -- or
  -- branch = '0.1.x',
  lazy = true,
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {"<leader>sf", function() require('telescope.builtin').find_files({hidden=true}) end, desc = "Use Telescope to search for files" },
    {"<leader>sg", function() require('telescope.builtin').live_grep() end, desc = "Use Telescope to search text in the current project" },
    {"<leader>sc", function() require('telescope.builtin').current_buffer_fuzzy_find() end, desc = "Use Telescope to search text in the current file" },
    {"<leader>sr", function() require('telescope.builtin').lsp_references() end, desc = "Use Telescope to search for references to current LSP object" },
    {"<leader>sb", function() require('telescope.builtin').buffers() end, desc = "Use Telescope to search through open buffers" },
    {"<leader>so", function() require('telescope.builtin').oldfiles() end, desc = "Use Telescope to search through recently closed buffers" },
    {"<leader>sh", function() require('telescope.builtin').help_tags() end, desc = "Use Telescope to search in help tags" },
  },
  cmd = "Telescope",
  config = function()
    local actions = require "telescope.actions"
    require('telescope').setup({
      defaults = {
        -- prompt_prefix = "  ",
        -- selection_caret = " ",
        -- path_display = { "smart" },

        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,

            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,

            ['<C-d>'] = actions.delete_buffer,

            ["<A-j>"] = actions.preview_scrolling_down,
            ["<A-k>"] = actions.preview_scrolling_up,
            ["<A-h>"] = actions.preview_scrolling_left,
            ["<A-l>"] = actions.preview_scrolling_right,
          },
          n = {
            ['<C-d>'] = actions.delete_buffer,
          },
        },
      },
    })
    require('telescope').load_extension('fzf')
  end
}
