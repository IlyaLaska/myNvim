return {
  "VonHeikemen/lsp-zero.nvim", -- Plugin to auto-configure LSP & CMP & Snippet engine to work together
  branch = "v2.x",
  dependencies = {
    -- LSP Support
    {
      "neovim/nvim-lspconfig", -- Official plugin that adds LSP functionality
      -- config = function()

      -- Does not work for some reason
      --   require("lspconfig").volar.setup({
      --     on_attach = function(client)
      --       client.resolved_capabilities.document_formatting = false
      --       client.resolved_capabilities.document_range_formatting = false
      --     end,
      --   })
      -- end
    },
    {
      "williamboman/mason.nvim", -- LSP plugin manager
      build = function()
        pcall(vim.cmd, "MasonUpdate")
      end,
    },
    { "williamboman/mason-lspconfig.nvim" }, -- Plugin for interoperability between official LSP plugin and Mason

    -- Autocompletion
    { "hrsh7th/nvim-cmp" },       -- CMP - completion engine
    { "hrsh7th/cmp-nvim-lsp" },   -- Required      -- Plugin for interoperability between official LSP and nvim-cmp
    { "hrsh7th/cmp-buffer" },     -- Completion source - buffer
    { "hrsh7th/cmp-path" },       -- Completion source - OS file path
    { "saadparwaiz1/cmp_luasnip" }, -- Completion source - LuaSnip snippets
    { "hrsh7th/cmp-nvim-lua" },   -- nvim-cmp source for neovim Lua API - CMP for nvim functions

    -- Snippets
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets" },
  },
  config = function()
    local lsp = require("lsp-zero").preset({})

    lsp.on_attach(function(_client, bufnr)
      lsp.default_keymaps({
        buffer = bufnr,
        -- TODO does not work - find out how to stop it
        omit = { "<Up>", "<Down>" },
      })
    end)

    lsp.set_sign_icons({
      error = '✘',
      warn = '▲',
      hint = '⚑',
      info = '»'
    })


    -- (Optional) Configure lua language server for neovim
    -- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

    lsp.setup()

    -- Make sure you setup `cmp` after lsp-zero

    local cmp = require("cmp")
    local cmp_action = require("lsp-zero").cmp_action()
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      sources = {
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        -- {name = 'buffer'},
        -- {name = 'luasnip'},
        { name = "buffer",  keyword_length = 3 },
        { name = "luasnip", keyword_length = 2 },
      },
      mapping = {
        ["<Tab>"] = cmp_action.luasnip_supertab(),
        ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
      },
    })
  end,
}
