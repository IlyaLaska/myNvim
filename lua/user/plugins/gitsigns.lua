return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup({
      signs = {
        add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        delete = { hl = "GitSignsDelete", text = "", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        topdelete = { hl = "GitSignsDelete", text = "", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Official suggestion for hunk movements
        -- -- Navigation
        -- map('n', ']c', function()
        --   if vim.wo.diff then return ']c' end
        --   vim.schedule(function() gs.next_hunk() end)
        --   return '<Ignore>'
        -- end, { expr = true })
        --
        -- map('n', '[c', function()
        --   if vim.wo.diff then return '[c' end
        --   vim.schedule(function() gs.prev_hunk() end)
        --   return '<Ignore>'
        -- end, { expr = true })


        -- Neovim from scratch keybinds
        -- g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
        -- j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
        -- k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
        -- l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
        -- p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
        -- r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
        -- R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
        -- s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
        -- u = {
        --   "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
        --   "Undo Stage Hunk",
        -- },
        -- o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        -- b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        -- c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        -- d = {
        --   "<cmd>Gitsigns diffthis HEAD<cr>",
        --   "Diff",
        -- },

        -- Actions
        map('n', '<leader>gj', gs.next_hunk)
        map('n', '<leader>gk', gs.prev_hunk)
        map('n', '<leader>gp', gs.preview_hunk)

        map('n', '<leader>gb', gs.toggle_current_line_blame)
        map('n', '<leader>gB', function() gs.blame_line { full = true } end)

        map('n', '<leader>gs', gs.stage_hunk)
        map('n', '<leader>gr', gs.reset_hunk)
        map('v', '<leader>gs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
        map('v', '<leader>gr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)

        map('n', '<leader>gS', gs.stage_buffer)
        map('n', '<leader>gR', gs.reset_buffer)
        map('n', '<leader>gu', gs.undo_stage_hunk)

        map('n', '<leader>gd', gs.diffthis)
        map('n', '<leader>gD', function() gs.diffthis('~') end)
        -- map('n', '<leader>gd', gs.toggle_deleted)

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      end
    })
  end
}
