return {
  { 
    'echasnovski/mini.nvim', 
    version = false,
    config = function()
      require('mini.ai').setup()           -- improved around/inside groups
      require('mini.comment').setup({
        -- TODO find out if possible to do that only for line comment
        hooks = {
          post = function() vim.cmd(':exe "normal j"') end
        }
      })      -- allow commenting with gcc
      require('mini.indentscope').setup()  -- draw a vertical line for indent blocks
      require('mini.move').setup()         -- move blocks of code with Alt - HJKL
      require('mini.pairs').setup()        -- Add pairs for quotes/parentheses
      -- require('mini.sessions').setup()    -- save and load the open state on quit and reopen (session)
      require('mini.splitjoin').setup()    -- split / join multiline blocks (arrays / etc) with gS
      require('mini.surround').setup()     -- suround stuff with quotes / parentheses
    end
  }
}
